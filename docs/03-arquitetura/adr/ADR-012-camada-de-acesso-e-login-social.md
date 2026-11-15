# ADR-012 · Camada de acesso centralizada e login social

| Campo | Valor |
|---|---|
| Status | Aceita |
| Data | 14/11/2026 |
| Autores | Ricardo Guilhen |
| Tarefa Jira | JAG-217 |

## Contexto

Na avaliação de 10/11/2026 foi apontado que consultar a autenticação a cada acesso pode não ser um problema, mas que uma camada do tipo *middleware* ou um facilitador de acesso, como SSO, traria benefícios.

A [ADR-009](ADR-009-autenticacao-e-autorizacao.md) já define autenticação própria (Argon2id, access token JWT de 15 minutos e refresh token ligado a uma `Sessao`) e autorização em duas camadas (RBAC nos *guards* do NestJS e posse ou compartilhamento nos serviços). Faltava dizer como isso é montado:

- o [ARQ-01](../ARQ-01-arquitetura.md) diz que o *guard* consulta a sessão no banco a cada requisição, e o DS-01 atualiza `ultimaAtividade` a cada requisição, o que gera uma leitura e uma escrita no PostgreSQL por chamada;
- cada controlador precisaria lembrar de aplicar os *guards*, e uma rota esquecida ficaria aberta;
- o único jeito de entrar é e-mail e senha.

Restrições: revogação imediata ao remover funcionário (RN23), expiração por inatividade de 4 horas (RN04), API sem estado para escalar (RNF05), orçamento baixo (R07) e dados pessoais longe de terceiros quando possível (ADR-009).

## Decisão

### 1. Uma única camada de acesso, aplicada a todas as rotas

Toda requisição HTTP e toda conexão WebSocket ([ADR-011](ADR-011-tempo-real-e-tarefas-assincronas.md)) passa pela mesma sequência, registrada uma vez no módulo principal da API ([DS-07](../../04-modelagem/MOD-02-diagramas-de-sequencia.md)):

| Ordem | Peça (NestJS) | O que faz | Consulta o banco? |
|---|---|---|---|
| 1 | *Middlewares* globais | Cabeçalhos de segurança, CORS, identificador da requisição e limite de requisições por IP | Não |
| 2 | `AutenticacaoGuard` global (`APP_GUARD`) | Valida assinatura e validade do access token; rotas marcadas com `@Publica()` passam direto | Não |
| 3 | Lista de sessões revogadas no Redis | Recusa o token se o identificador da sessão (`sid`) estiver na lista | Não (Redis) |
| 4 | `PermissoesGuard` global | Compara as permissões exigidas por `@Permissoes('agenda:editar')` com as que estão no token; rota sem o decorador e sem `@Publica()` é negada | Não |
| 5 | Serviço de domínio com `PoliticaAcessoPet` | Verifica posse, responsável, compartilhamento ou agendamento para dados de pets (RN15, RN24, RN26) | Sim, só a consulta que a regra exige |
| 6 | `AuditoriaInterceptor` | Grava `LogAuditoria` nas rotas marcadas com `@Auditar()` (RN31) | Sim, escrita assíncrona pela fila |

Negar por padrão: uma rota nova só responde se declarar `@Publica()` ou `@Permissoes(...)`. Um teste automatizado percorre as rotas registradas e falha se alguma não tiver uma das duas marcações.

### 2. O banco só é consultado no login, na renovação e na revogação

- O access token carrega `sub` (usuário), `sid` (sessão), perfil, empresa e a lista de códigos de permissão. Ele vale 15 minutos.
- A cada renovação (no máximo a cada 15 minutos de uso) a API lê a `Sessao` no banco, aplica a inatividade de 4 horas (RN04), atualiza `ultimaAtividade`, relê as permissões do perfil e emite um token novo.
- Logout, remoção de funcionário (RN23), troca de senha e bloqueio pelo administrador encerram a `Sessao` no banco **e** gravam o `sid` no Redis com expiração de 15 minutos, o tempo máximo de vida do token. A revogação vale na requisição seguinte.
- Mudança nas permissões de um perfil revoga as sessões dos usuários daquele perfil, que renovam o token com as permissões novas.
- Se o Redis estiver indisponível, o `AutenticacaoGuard` consulta a `Sessao` no banco. Fica mais lento, mas nunca aceita um token revogado.

### 3. Login social para tutores (RF46, prioridade *Could*)

- Tutores podem criar a conta e entrar com **Google** ou **Sign in with Apple**, pelo protocolo OpenID Connect. A opção da Apple vem da diretriz 4.8 da App Store: um app que oferece login de terceiros precisa oferecer também uma opção equivalente com proteção de privacidade, e o Sign in with Apple atende a essa exigência.
- O app recebe o `id_token` do provedor e envia à API. A API valida assinatura (chaves públicas do provedor), emissor, audiência, validade e `nonce`, e procura uma `IdentidadeExterna` com o mesmo provedor e identificador.
- Se ela existe, a API cria uma `Sessao` e emite os **mesmos tokens do Jaguara**; o resto da plataforma não sabe como o usuário entrou.
- Se não existe, a API pede os dados que o provedor não dá: CPF (RN01) e aceite dos termos (RN42). Uma conta já existente com o mesmo e-mail só é ligada depois de o usuário confirmar a senha dela, para impedir tomada de conta.
- O provedor recebe apenas o evento de login que o próprio usuário iniciou; o Jaguara recebe nome, e-mail e o identificador do provedor ([ARQ-02](../ARQ-02-seguranca-e-lgpd.md), seção 8).

### 4. SSO corporativo para empresas fica fora da v1.0

SSO por SAML ou OIDC com o provedor de identidade da empresa (Microsoft Entra ID, Google Workspace) não entra na v1.0. O público-alvo do Enterprise são pet shops, clínicas e hotéis pequenos, que em geral não têm provedor de identidade corporativo, e o recurso exigiria configuração por empresa e testes com cada provedor. O desenho desta ADR permite incluí-lo depois sem mudar o resto da API: seria mais um tipo de `IdentidadeExterna`, ligado à empresa, emitindo os mesmos tokens.

## Alternativas consideradas

- **Manter a consulta da sessão no banco a cada requisição:** simples e com revogação exata, mas soma uma leitura e uma escrita no PostgreSQL por chamada e cresce com o número de réplicas da API (RNF05).
- **JWT sem lista de revogação:** nenhum acesso ao banco ou ao Redis, mas um funcionário removido continuaria com acesso por até 15 minutos, o que fere a RN23.
- **Provedor de identidade gerenciado (Auth0, Cognito, Firebase) ou Keycloak próprio:** traria SSO e login social prontos, mas foi recusado na ADR-009 pelo custo por usuário e pelos dados em terceiros; o Keycloak somaria um serviço pesado para o time operar na VPS.
- **API *gateway* separado (Kong, Traefik com plugins):** centraliza a autenticação fora da API, mas as regras de posse e compartilhamento continuariam na API, e seria mais um componente para manter.

## Consequências

- Positiva: nenhuma rota fica aberta por esquecimento; a regra de acesso fica em um só lugar e é testada uma vez.
- Positiva: a maior parte das requisições não toca o banco para autenticar; a carga no PostgreSQL passa a depender do uso real, não do número de chamadas.
- Positiva: o tutor pode entrar com uma conta que já usa, o que reduz atrito no cadastro.
- Negativa: as permissões no token podem ficar desatualizadas por até 15 minutos se a revogação por mudança de perfil falhar; mitigado pela revogação automática das sessões do perfil alterado.
- Negativa: o Redis passa a fazer parte do caminho de autenticação; mitigado pela consulta ao banco quando ele estiver fora.
- Negativa: o login social adiciona dependência de Google e Apple para quem escolher esse caminho; e-mail e senha continuam disponíveis para todos.

## Notas

Complementa a ADR-009, que continua valendo para senhas, tokens, sessões e RBAC.

Proposta em 14/11/2026. Aceita em 15/11/2026, após a revisão de Ricardo Guilhen (JAG-217).
