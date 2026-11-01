# REQ-05 · Histórias de usuário e critérios de aceitação

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | REQ-05 · Histórias de usuário e critérios de aceitação |
| Versão | 1.0 |
| Status | Em revisão |
| Autores | Micaela Dorneles, Miguel Drozino, Nathan Rodrigues, Ricardo Guilhen |
| Data | 01/11/2026 |
| Tarefa Jira | JAG-63 |
| Padrão de referência | User stories (Connextra) com critérios em Gherkin |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 0.1 | 30/09/2026 | Equipe Jaguara | Narrativas das 46 histórias na planilha de casos de uso. |
| 1.0 | 01/11/2026 | Ricardo Guilhen | Critérios de aceitação em Gherkin (um cenário de sucesso e um de exceção por história) e ligação com casos de uso e regras de negócio. |

## 1. Objetivo

Descrever o valor de cada funcionalidade do ponto de vista do usuário e definir critérios de aceitação verificáveis, que são a base dos casos de teste do [TST-02](../05-testes/TST-02-casos-de-teste.md).

## 2. Convenções

- `US-nn` corresponde ao caso de uso `UC-nn` do [REQ-04](REQ-04-especificacao-casos-de-uso.md).
- Os cenários usam Gherkin em português (`# language: pt`): **Dado** (contexto), **Quando** (ação), **Então** (resultado observável).
- Cada história tem pelo menos um cenário de sucesso e um de exceção, que exercita uma regra de negócio.
- Os blocos podem ser copiados para arquivos `.feature` e executados com Cucumber.

## 3. Histórias

<a id="us-01"></a>

### US-01 · Cadastrar usuário tutor

> Como tutor ou admin, preciso criar uma conta para acessar o aplicativo e gerenciar meus pets.

**Caso de uso:** [UC-01](REQ-04-especificacao-casos-de-uso.md#uc-01) · **Requisito:** RF01 · **Prioridade:** Must

```gherkin
# language: pt
Funcionalidade: US-01 Cadastrar usuário tutor

  Cenário: Cadastro com dados válidos
    Dado que não existe conta com o CPF informado
    Quando o visitante informa os dados obrigatórios e confirma o e-mail recebido
    Então a conta do tutor fica com status ATIVA

  Cenário: CPF já cadastrado (RN01)
    Dado que já existe um tutor com o CPF informado
    Quando o visitante tenta concluir o cadastro
    Então o sistema recusa o cadastro e informa que o CPF já está em uso
```

<a id="us-02"></a>

### US-02 · Autenticar usuário

> Como usuário, preciso entrar no aplicativo com login e senha para acessar as informações da minha conta com segurança.

**Caso de uso:** [UC-02](REQ-04-especificacao-casos-de-uso.md#uc-02) · **Requisito:** RF02 · **Prioridade:** Must

```gherkin
# language: pt
Funcionalidade: US-02 Autenticar usuário

  Cenário: Login com credenciais corretas
    Dado que o usuário possui conta ATIVA
    Quando informa e-mail e senha corretos
    Então o sistema cria a sessão e exibe a tela inicial do perfil do usuário

  Cenário: Bloqueio após cinco falhas (RN03)
    Dado que o usuário errou a senha quatro vezes seguidas
    Quando informa a senha errada pela quinta vez
    Então a conta fica bloqueada por 5 minutos
```

<a id="us-03"></a>

### US-03 · Recuperar Senha

> Como usuário, preciso redefinir a minha senha quando esquecê-la para voltar a acessar a minha conta.

**Caso de uso:** [UC-03](REQ-04-especificacao-casos-de-uso.md#uc-03) · **Requisito:** RF03 · **Prioridade:** Must

```gherkin
# language: pt
Funcionalidade: US-03 Recuperar Senha

  Cenário: Redefinição dentro do prazo
    Dado que o usuário recebeu o link de recuperação há menos de 2 horas
    Quando define uma senha diferente das três últimas
    Então a nova senha passa a valer e o link deixa de funcionar

  Cenário: Link expirado (RN05)
    Dado que o link de recuperação foi emitido há mais de 2 horas
    Quando o usuário tenta redefinir a senha
    Então o sistema recusa e orienta a solicitar um novo link
```

<a id="us-04"></a>

### US-04 · Gerenciar Pet

> Como tutor, preciso cadastrar, editar, arquivar e remover os meus pets para manter os dados deles sempre atualizados.

**Caso de uso:** [UC-04](REQ-04-especificacao-casos-de-uso.md#uc-04) · **Requisito:** RF04 · **Prioridade:** Must

```gherkin
# language: pt
Funcionalidade: US-04 Gerenciar Pet

  Cenário: Cadastro de pet
    Dado que o tutor está autenticado
    Quando cadastra um pet escolhendo espécie e raça da lista
    Então o pet é criado com o tutor como responsável principal

  Cenário: Exclusão de pet com histórico (RN08)
    Dado que o pet possui vacinação registrada
    Quando o tutor solicita a exclusão definitiva
    Então o sistema impede a exclusão e oferece o arquivamento
```

<a id="us-05"></a>

### US-05 · Vincular Responsável ao Pet

> Como tutor, preciso vincular e desvincular responsáveis ao meu pet para compartilhar os cuidados dele com outras pessoas.

**Caso de uso:** [UC-05](REQ-04-especificacao-casos-de-uso.md#uc-05) · **Requisito:** RF05 · **Prioridade:** Should

```gherkin
# language: pt
Funcionalidade: US-05 Vincular Responsável ao Pet

  Cenário: Inclusão de responsável adicional
    Dado que o pet tem um responsável principal
    Quando o tutor adiciona outro tutor cadastrado como responsável adicional
    Então o novo vínculo fica ativo e o convidado passa a ver o pet

  Cenário: Remoção do único responsável principal (RN09)
    Dado que o pet tem um único responsável principal
    Quando esse responsável tenta remover o próprio vínculo
    Então o sistema impede a remoção
```

<a id="us-06"></a>

### US-06 · Controlar Despesas

> Como tutor, preciso registrar as despesas do meu pet para acompanhar quanto gasto com ele.

**Caso de uso:** [UC-06](REQ-04-especificacao-casos-de-uso.md#uc-06) · **Requisito:** RF06 · **Prioridade:** Should

```gherkin
# language: pt
Funcionalidade: US-06 Controlar Despesas

  Cenário: Registro de despesa
    Dado que o tutor tem um pet cadastrado
    Quando registra valor, data e categoria da despesa
    Então a despesa aparece no histórico financeiro do pet

  Cenário: Despesa sem categoria (RN10)
    Dado que o tutor está no cadastro de despesa
    Quando tenta salvar sem informar a categoria
    Então o sistema não salva e pede a categoria
```

<a id="us-07"></a>

### US-07 · Emitir Relatório de Despesas

> Como tutor, preciso gerar e exportar relatórios financeiros em PDF das despesas do pet.

**Caso de uso:** [UC-07](REQ-04-especificacao-casos-de-uso.md#uc-07) · **Requisito:** RF07 · **Prioridade:** Should

```gherkin
# language: pt
Funcionalidade: US-07 Emitir Relatório de Despesas

  Cenário: Exportação em PDF
    Dado que o pet tem despesas no período escolhido
    Quando o tutor gera o relatório e escolhe exportar em PDF
    Então o sistema gera um PDF com as despesas e o total por categoria

  Cenário: Período sem despesas (RN11)
    Dado que o pet não tem despesas no período escolhido
    Quando o tutor gera o relatório
    Então o sistema informa que não há dados para o período
```

<a id="us-08"></a>

### US-08 · Registrar Alimentação

> Como tutor, preciso registrar a alimentação do meu pet e definir metas e limites diários para controlar o que ele come.

**Caso de uso:** [UC-08](REQ-04-especificacao-casos-de-uso.md#uc-08) · **Requisito:** RF08 · **Prioridade:** Should

```gherkin
# language: pt
Funcionalidade: US-08 Registrar Alimentação

  Cenário: Registro de refeição dentro do limite
    Dado que o pet tem plano com limite diário de 300 g e nenhum consumo no dia
    Quando o tutor registra uma refeição de 200 g
    Então a refeição é registrada e o consumo do dia passa a ser 200 g

  Cenário: Limite diário excedido (RN12)
    Dado que o pet já consumiu 250 g de um limite diário de 300 g
    Quando o tutor registra uma refeição de 100 g
    Então a refeição é registrada e o sistema alerta que o limite foi excedido
```

<a id="us-09"></a>

### US-09 · Sincronizar Calendário Externo

> Como tutor, preciso sincronizar o meu calendário externo com o calendário do aplicativo.

**Caso de uso:** [UC-09](REQ-04-especificacao-casos-de-uso.md#uc-09) · **Requisito:** RF09 · **Prioridade:** Could

```gherkin
# language: pt
Funcionalidade: US-09 Sincronizar Calendário Externo

  Cenário: Sincronização autorizada
    Dado que o tutor tem conta Google
    Quando autoriza o acesso ao calendário externo
    Então os eventos são sincronizados com o calendário do aplicativo

  Cenário: Autorização negada (RN13)
    Dado que o tutor iniciou a sincronização
    Quando nega o acesso no provedor do calendário
    Então a sincronização é cancelada e nada é importado
```

<a id="us-10"></a>

### US-10 · Gerenciar Calendário

> Como tutor, preciso gerenciar eventos, serviços e medicamentos no calendário para não perder nenhum compromisso do meu pet.

**Caso de uso:** [UC-10](REQ-04-especificacao-casos-de-uso.md#uc-10) · **Requisito:** RF10 · **Prioridade:** Must

```gherkin
# language: pt
Funcionalidade: US-10 Gerenciar Calendário

  Cenário: Criação de evento sem conflito
    Dado que o pet não tem compromisso às 10h de sábado
    Quando o tutor cria uma consulta para esse horário
    Então o evento é criado e o lembrete é agendado

  Cenário: Evento em conflito (RN14)
    Dado que o pet já tem um compromisso às 10h de sábado
    Quando o tutor cria outro evento no mesmo horário
    Então o sistema impede o cadastro por conflito de agenda
```

<a id="us-11"></a>

### US-11 · Compartilhar Perfil do Pet

> Como tutor, preciso ter a opção de compartilhar o perfil do meu pet.

**Caso de uso:** [UC-11](REQ-04-especificacao-casos-de-uso.md#uc-11) · **Requisito:** RF11 · **Prioridade:** Should

```gherkin
# language: pt
Funcionalidade: US-11 Compartilhar Perfil do Pet

  Cenário: Compartilhamento com escopo limitado
    Dado que o tutor está no perfil do pet
    Quando compartilha apenas vacinas e alergias com um e-mail
    Então o destinatário recebe acesso somente a vacinas e alergias

  Cenário: Acesso fora do escopo (RN15)
    Dado que um compartilhamento libera apenas vacinas
    Quando o destinatário tenta abrir os exames do pet
    Então o sistema nega o acesso
```

<a id="us-12"></a>

### US-12 · Visualizar Vacinação

> Como tutor, preciso poder ver as vacinações que o meu pet tomou.

**Caso de uso:** [UC-12](REQ-04-especificacao-casos-de-uso.md#uc-12) · **Requisito:** RF12 · **Prioridade:** Must

```gherkin
# language: pt
Funcionalidade: US-12 Visualizar Vacinação

  Cenário: Consulta do histórico vacinal
    Dado que o pet tem três vacinações válidas
    Quando o tutor abre o histórico de vacinação
    Então o sistema lista as três vacinações em ordem de aplicação

  Cenário: Registro invalidado (RN16)
    Dado que uma das vacinações foi marcada como inválida
    Quando o tutor abre o histórico de vacinação
    Então a vacinação inválida não é exibida
```

<a id="us-13"></a>

### US-13 · Cadastrar Vacinação

> Como tutor, preciso cadastrar as vacinas aplicadas no meu pet, com data e responsável pela aplicação, para manter o histórico vacinal completo.

**Caso de uso:** [UC-13](REQ-04-especificacao-casos-de-uso.md#uc-13) · **Requisito:** RF13 · **Prioridade:** Must

```gherkin
# language: pt
Funcionalidade: US-13 Cadastrar Vacinação

  Cenário: Registro completo
    Dado que o tutor está no cadastro de vacinação
    Quando informa vacina, data de aplicação, responsável e próxima dose
    Então a vacinação é registrada e o lembrete da próxima dose é agendado

  Cenário: Registro sem responsável (RN17)
    Dado que o tutor está no cadastro de vacinação
    Quando tenta salvar sem informar o responsável pela aplicação
    Então o sistema rejeita o cadastro
```

<a id="us-14"></a>

### US-14 · Gerenciar Medicamentos

> Como tutor, preciso administrar os medicamentos que o meu pet toma.

**Caso de uso:** [UC-14](REQ-04-especificacao-casos-de-uso.md#uc-14) · **Requisito:** RF14 · **Prioridade:** Must

```gherkin
# language: pt
Funcionalidade: US-14 Gerenciar Medicamentos

  Cenário: Tratamento com lembretes
    Dado que o tutor cadastra um medicamento de 8 em 8 horas
    Quando salva o tratamento
    Então o sistema agenda os lembretes para os responsáveis do pet

  Cenário: Finalização do tratamento (RN18)
    Dado que o tratamento tem lembretes futuros
    Quando o tutor finaliza o tratamento
    Então os lembretes pendentes são cancelados
```

<a id="us-15"></a>

### US-15 · Gerenciar Memorial do Pet

> Como tutor, preciso administrar a página de memorial do pet.

**Caso de uso:** [UC-15](REQ-04-especificacao-casos-de-uso.md#uc-15) · **Requisito:** RF15 · **Prioridade:** Could

```gherkin
# language: pt
Funcionalidade: US-15 Gerenciar Memorial do Pet

  Cenário: Memorial de pet falecido
    Dado que o pet tem status FALECIDO
    Quando o tutor cria o memorial com uma foto e um texto
    Então o memorial é salvo e exibido no perfil do pet

  Cenário: Memorial de pet ativo (RN19)
    Dado que o pet tem status ATIVO
    Quando o tutor tenta criar o memorial
    Então o sistema bloqueia o memorial
```

<a id="us-16"></a>

### US-16 · Gerenciar Permissões

> Como empresa, preciso administrar as permissões dos funcionários da minha empresa.

**Caso de uso:** [UC-16](REQ-04-especificacao-casos-de-uso.md#uc-16) · **Requisito:** RF16 · **Prioridade:** Must

```gherkin
# language: pt
Funcionalidade: US-16 Gerenciar Permissões

  Cenário: Alteração de perfil
    Dado que a empresa tem o perfil Atendente definido
    Quando atribui esse perfil a um funcionário
    Então as permissões do perfil passam a valer para o funcionário

  Cenário: Perfil não definido pela empresa (RN20)
    Dado que a empresa não definiu o perfil Gerente
    Quando tenta atribuir esse perfil
    Então o sistema recusa a alteração
```

<a id="us-17"></a>

### US-17 · Emitir BI

> O usuário-empresa precisa visualizar indicadores e dashboards estratégicos para analisar dados

**Caso de uso:** [UC-17](REQ-04-especificacao-casos-de-uso.md#uc-17) · **Requisito:** RF17 · **Prioridade:** Could

```gherkin
# language: pt
Funcionalidade: US-17 Emitir BI

  Cenário: Indicadores da própria empresa
    Dado que a empresa tem atendimentos no mês
    Quando seleciona os indicadores de atendimento e faturamento
    Então o sistema exibe os dashboards só com os dados da empresa

  Cenário: Dados de outra empresa (RN21)
    Dado que a empresa está no módulo de BI
    Quando tenta consultar indicadores de outra empresa
    Então o sistema bloqueia o acesso
```

<a id="us-18"></a>

### US-18 · Emitir Relatórios

> O usuário-empresa precisa gerar relatórios operacionais e gerenciais para acompanhamento

**Caso de uso:** [UC-18](REQ-04-especificacao-casos-de-uso.md#uc-18) · **Requisito:** RF18 · **Prioridade:** Should

```gherkin
# language: pt
Funcionalidade: US-18 Emitir Relatórios

  Cenário: Relatório com permissão
    Dado que o usuário tem permissão de relatórios
    Quando gera o relatório de atendimentos do mês
    Então o relatório é exibido

  Cenário: Relatório sem permissão (RN22)
    Dado que o funcionário não tem permissão de relatórios
    Quando tenta gerar um relatório
    Então o sistema bloqueia a ação
```

<a id="us-19"></a>

### US-19 · Gerenciar Funcionários

> O usuário-empresa precisa cadastrar, editar e remover funcionários para gerenciar o acesso da equipe

**Caso de uso:** [UC-19](REQ-04-especificacao-casos-de-uso.md#uc-19) · **Requisito:** RF19 · **Prioridade:** Must

```gherkin
# language: pt
Funcionalidade: US-19 Gerenciar Funcionários

  Cenário: Cadastro de funcionário
    Dado que a empresa tem perfis de acesso definidos
    Quando cadastra um funcionário com perfil válido e ele confirma o e-mail
    Então o funcionário fica ativo com o perfil escolhido

  Cenário: Remoção com sessão aberta (RN23)
    Dado que o funcionário está com sessão ativa
    Quando a empresa remove o funcionário
    Então todas as sessões dele são revogadas imediatamente
```

<a id="us-20"></a>

### US-20 · Consultar Pets Vinculados

> O usuário-empresa e o usuário-funcionário precisam consultar as informações dos pets vinculados autorizados

**Caso de uso:** [UC-20](REQ-04-especificacao-casos-de-uso.md#uc-20) · **Requisito:** RF20 · **Prioridade:** Should

```gherkin
# language: pt
Funcionalidade: US-20 Consultar Pets Vinculados

  Cenário: Listagem de pets vinculados
    Dado que a empresa tem pets com agendamento ou compartilhamento ativo
    Quando o funcionário abre a lista de pets vinculados
    Então o sistema lista somente esses pets

  Cenário: Pet sem vínculo (RN24)
    Dado que o pet não tem atendimento nem compartilhamento com a empresa
    Quando o funcionário tenta abrir os dados do pet
    Então o sistema nega o acesso
```

<a id="us-21"></a>

### US-21 · Gerenciar Clientes

> O usuário-empresa e o usuário-funcionário precisam cadastrar e atualizar dados de clientes na plataforma

**Caso de uso:** [UC-21](REQ-04-especificacao-casos-de-uso.md#uc-21) · **Requisito:** RF21 · **Prioridade:** Should

```gherkin
# language: pt
Funcionalidade: US-21 Gerenciar Clientes

  Cenário: Cadastro de cliente com consentimento
    Dado que o tutor consentiu o tratamento dos dados
    Quando a empresa cadastra o tutor como cliente
    Então o cliente é salvo com a data do consentimento

  Cenário: Cadastro sem consentimento (RN25)
    Dado que não há consentimento do tutor
    Quando a empresa tenta salvar o cliente
    Então o sistema bloqueia a gravação
```

<a id="us-22"></a>

### US-22 · Visualizar Perfil do Pet

> O usuário-empresa e o usuário-funcionário precisam consultar o histórico e as informações completas do pet

**Caso de uso:** [UC-22](REQ-04-especificacao-casos-de-uso.md#uc-22) · **Requisito:** RF22 · **Prioridade:** Should

```gherkin
# language: pt
Funcionalidade: US-22 Visualizar Perfil do Pet

  Cenário: Perfil com autorização
    Dado que a empresa tem compartilhamento ativo com o pet
    Quando o funcionário abre o perfil do pet
    Então o sistema exibe as seções liberadas pelo tutor

  Cenário: Perfil sem autorização (RN26)
    Dado que a empresa não tem autorização sobre o pet
    Quando o funcionário tenta abrir o perfil completo
    Então o sistema nega o acesso
```

<a id="us-23"></a>

### US-23 · Registrar Serviços

> O usuário-empresa e o usuário-funcionário precisam registrar os serviços prestados aos pets

**Caso de uso:** [UC-23](REQ-04-especificacao-casos-de-uso.md#uc-23) · **Requisito:** RF23 · **Prioridade:** Must

```gherkin
# language: pt
Funcionalidade: US-23 Registrar Serviços

  Cenário: Registro de atendimento
    Dado que o agendamento de banho foi contratado por R$ 60,00 e o preço atual é R$ 70,00
    Quando o funcionário registra o atendimento
    Então o item é cobrado por R$ 60,00

  Cenário: Alteração de atendimento finalizado (RN28)
    Dado que o atendimento está FINALIZADO
    Quando o funcionário tenta alterar as observações sem justificativa
    Então o sistema bloqueia e exige alteração com auditoria
```

<a id="us-24"></a>

### US-24 · Controlar Agenda

> Como usuário-empresa e o usuário-funcionário, preciso visualizar a agenda semanal com os serviços agendados e as solicitações pendentes, e gerenciar agendamentos e horários de atuação, para organizar os atendimentos e saber a disponibilidade.

**Caso de uso:** [UC-24](REQ-04-especificacao-casos-de-uso.md#uc-24) · **Requisito:** RF25 · **Prioridade:** Must

```gherkin
# language: pt
Funcionalidade: US-24 Controlar Agenda

  Cenário: Cadastro de horário de atuação
    Dado que o profissional não tem horário às segundas pela manhã
    Quando a empresa cadastra o horário das 8h às 12h
    Então o horário de atuação é registrado

  Cenário: Remarcação em horário ocupado (RN29)
    Dado que o profissional já tem atendimento às 14h
    Quando a empresa remarca outro agendamento para 14h com o mesmo profissional
    Então o sistema bloqueia a alteração por conflito
```

<a id="us-25"></a>

### US-25 · Monitorar Desempenho e Logs

> Como administrador, preciso visualizar métricas, dashboards e registros de erros para acompanhar o funcionamento do sistema.

**Caso de uso:** [UC-25](REQ-04-especificacao-casos-de-uso.md#uc-25) · **Requisito:** RF26 · **Prioridade:** Could

```gherkin
# language: pt
Funcionalidade: US-25 Monitorar Desempenho e Logs

  Cenário: Consulta de logs críticos
    Dado que existem logs críticos na última semana
    Quando o administrador filtra os logs por nível CRITICO
    Então o sistema lista os registros do período

  Cenário: Log inexistente (RN31)
    Dado que não há logs para o filtro
    Quando o administrador consulta
    Então o sistema informa que não há registros
```

<a id="us-26"></a>

### US-26 · Prestar Suporte Operacional

> Os administradores precisam poder corrigir os problemas de usuários relacionados ao sistema

**Caso de uso:** [UC-26](REQ-04-especificacao-casos-de-uso.md#uc-26) · **Requisito:** RF27 · **Prioridade:** Could

```gherkin
# language: pt
Funcionalidade: US-26 Prestar Suporte Operacional

  Cenário: Ação corretiva
    Dado que há um chamado aberto com informações suficientes
    Quando o administrador executa a correção
    Então a intervenção é registrada no chamado e na auditoria

  Cenário: Chamado incompleto (RN32)
    Dado que o chamado não tem informações suficientes
    Quando o administrador analisa o chamado
    Então o status passa a AGUARDANDO_INFORMACAO e o solicitante é notificado
```

<a id="us-27"></a>

### US-27 · Gerenciar Integrações

> O administrador precisa criar, editar, visualizar e excluir integrações com outras plataformas

**Caso de uso:** [UC-27](REQ-04-especificacao-casos-de-uso.md#uc-27) · **Requisito:** RF28 · **Prioridade:** Could

```gherkin
# language: pt
Funcionalidade: US-27 Gerenciar Integrações

  Cenário: Criação de integração
    Dado que o administrador tem permissão de integrações
    Quando cadastra uma integração com parâmetros válidos
    Então a integração é salva e testada

  Cenário: Administrador sem permissão (RN33)
    Dado que o administrador não tem permissão de integrações
    Quando tenta criar uma integração
    Então o sistema bloqueia a operação
```

<a id="us-28"></a>

### US-28 · Gerenciar Contas de Usuários

> O administrador pode suspender, bloquear ou reativar contas de usuários

**Caso de uso:** [UC-28](REQ-04-especificacao-casos-de-uso.md#uc-28) · **Requisito:** RF29 · **Prioridade:** Should

```gherkin
# language: pt
Funcionalidade: US-28 Gerenciar Contas de Usuários

  Cenário: Suspensão de conta
    Dado que a conta do usuário está ATIVA
    Quando o administrador suspende a conta informando o motivo
    Então a conta fica SUSPENSA e a ação é auditada

  Cenário: Falha na auditoria (RN34)
    Dado que o registro de auditoria está indisponível
    Quando o administrador tenta bloquear uma conta
    Então a operação é cancelada sem alterar o status
```

<a id="us-29"></a>

### US-29 · Gerenciar Permissões Globais

> Como administrador, preciso gerenciar perfis e permissões globais para controlar os níveis de acesso em todo o sistema.

**Caso de uso:** [UC-29](REQ-04-especificacao-casos-de-uso.md#uc-29) · **Requisito:** RF30 · **Prioridade:** Should

```gherkin
# language: pt
Funcionalidade: US-29 Gerenciar Permissões Globais

  Cenário: Alteração de permissão global
    Dado que o perfil Tutor não tem a permissão de exportar dados
    Quando o administrador concede a permissão
    Então a permissão vale a partir da próxima requisição dos tutores

  Cenário: Alteração inconsistente (RN35)
    Dado que o administrador edita um perfil global
    Quando tenta salvar o perfil sem nenhuma permissão
    Então o sistema rejeita a alteração
```

<a id="us-30"></a>

### US-30 · Gerenciar Webhooks

> O administrador precisa criar, editar, visualizar e excluir webhooks

**Caso de uso:** [UC-30](REQ-04-especificacao-casos-de-uso.md#uc-30) · **Requisito:** RF31 · **Prioridade:** Could

```gherkin
# language: pt
Funcionalidade: US-30 Gerenciar Webhooks

  Cenário: Webhook seguro
    Dado que o administrador está em Gerenciar webhooks
    Quando cadastra uma URL HTTPS com segredo de assinatura
    Então o webhook é salvo

  Cenário: Webhook inseguro (RN36)
    Dado que o administrador está em Gerenciar webhooks
    Quando cadastra uma URL HTTP sem autenticação
    Então o sistema bloqueia o cadastro e informa o motivo
```

<a id="us-31"></a>

### US-31 · Disparar notificações automáticas

> Como usuário, preciso ser notificado automaticamente sobre compromissos, medicamentos, vacinas e demais atividades para não perder nenhum evento importante.

**Caso de uso:** [UC-31](REQ-04-especificacao-casos-de-uso.md#uc-31) · **Requisito:** RF32 · **Prioridade:** Must

```gherkin
# language: pt
Funcionalidade: US-31 Disparar notificações automáticas

  Cenário: Lembrete com antecedência
    Dado que o tutor configurou antecedência de 30 minutos para medicamentos
    Quando chega a dose das 20h
    Então o tutor recebe a notificação às 19h30

  Cenário: Falha no envio (RN37)
    Dado que o serviço de push está indisponível
    Quando o sistema tenta enviar uma notificação
    Então a falha é registrada e uma nova tentativa é agendada
```

<a id="us-32"></a>

### US-32 · Cadastrar usuário-empresa

> Como empresa, preciso cadastrar meu negócio na plataforma para passar a oferecer meus serviços e gerenciar meus atendimentos.

**Caso de uso:** [UC-32](REQ-04-especificacao-casos-de-uso.md#uc-32) · **Requisito:** RF01 · **Prioridade:** Must

```gherkin
# language: pt
Funcionalidade: US-32 Cadastrar usuário-empresa

  Cenário: Cadastro de empresa
    Dado que não existe empresa com o CNPJ informado
    Quando a empresa informa CNPJ, e-mail e senha e confirma o e-mail
    Então a conta da empresa fica ATIVA

  Cenário: CNPJ já cadastrado (RN01)
    Dado que já existe empresa com o CNPJ informado
    Quando outra conta tenta se cadastrar com esse CNPJ
    Então o sistema recusa e informa que o CNPJ já está em uso
```

<a id="us-33"></a>

### US-33 · Visualizar Catálogo de Serviços

> Como tutor, preciso visualizar os serviços oferecidos pelas empresas para poder escolher e solicitar o agendamento.

**Caso de uso:** [UC-33](REQ-04-especificacao-casos-de-uso.md#uc-33) · **Requisito:** RF39 · **Prioridade:** Must

```gherkin
# language: pt
Funcionalidade: US-33 Visualizar Catálogo de Serviços

  Cenário: Catálogo com serviços ativos
    Dado que a empresa tem serviços ativos
    Quando o tutor abre o catálogo da empresa
    Então o sistema lista nome, descrição, valor e duração de cada serviço

  Cenário: Catálogo vazio (RN27)
    Dado que a empresa não tem serviços ativos
    Quando o tutor abre o catálogo
    Então o sistema informa que não há serviços disponíveis no momento
```

<a id="us-34"></a>

### US-34 · Gerenciar documentos do pet

> Como tutor, preciso cadastrar, consultar, atualizar e gerenciar os documentos do meu pet.

**Caso de uso:** [UC-34](REQ-04-especificacao-casos-de-uso.md#uc-34) · **Requisito:** RF33 · **Prioridade:** Should

```gherkin
# language: pt
Funcionalidade: US-34 Gerenciar documentos do pet

  Cenário: Envio de documento
    Dado que o tutor está nos documentos do pet
    Quando envia o PDF de um laudo com título e tipo
    Então o documento fica disponível no perfil do pet

  Cenário: Acesso por terceiro sem permissão (RN15)
    Dado que o documento não está em nenhum escopo compartilhado
    Quando um destinatário de compartilhamento tenta abri-lo
    Então o sistema nega o acesso
```

<a id="us-35"></a>

### US-35 · Consultar Linha do Tempo do Pet

> Como usuário-tutor ou usuário-empresa autorizada, preciso consultar a linha do tempo e o histórico de eventos do pet.

**Caso de uso:** [UC-35](REQ-04-especificacao-casos-de-uso.md#uc-35) · **Requisito:** RF34 · **Prioridade:** Should

```gherkin
# language: pt
Funcionalidade: US-35 Consultar Linha do Tempo do Pet

  Cenário: Linha do tempo do tutor
    Dado que o pet tem vacinas, exames e atendimentos
    Quando o tutor abre a linha do tempo
    Então os eventos aparecem em ordem cronológica

  Cenário: Empresa sem autorização (RN26)
    Dado que a empresa não tem o escopo LINHA_DO_TEMPO
    Quando o funcionário tenta abrir a linha do tempo
    Então o sistema nega o acesso
```

<a id="us-36"></a>

### US-36 · Gerenciar Exames do Pet

> Como usuário-tutor ou usuário-empresa, preciso cadastrar, consultar e gerenciar os exames do meu pet.

**Caso de uso:** [UC-36](REQ-04-especificacao-casos-de-uso.md#uc-36) · **Requisito:** RF35 · **Prioridade:** Should

```gherkin
# language: pt
Funcionalidade: US-36 Gerenciar Exames do Pet

  Cenário: Registro de exame
    Dado que o tutor está nos exames do pet
    Quando registra um hemograma com o laudo anexado
    Então o exame aparece no histórico clínico

  Cenário: Empresa sem escopo de exames (RN30)
    Dado que o compartilhamento da empresa não inclui EXAMES
    Quando o funcionário tenta registrar um exame
    Então o sistema nega a operação
```

<a id="us-37"></a>

### US-37 · Gerenciar Alergias e Restrições

> Como usuário-tutor ou usuário-empresa, preciso cadastrar, consultar e gerenciar as alergias e restrições do meu pet.

**Caso de uso:** [UC-37](REQ-04-especificacao-casos-de-uso.md#uc-37) · **Requisito:** RF36 · **Prioridade:** Should

```gherkin
# language: pt
Funcionalidade: US-37 Gerenciar Alergias e Restrições

  Cenário: Registro de alergia
    Dado que o tutor está nas alergias do pet
    Quando registra alergia grave a dipirona
    Então a alergia aparece em destaque no perfil do pet

  Cenário: Funcionário sem permissão clínica (RN30)
    Dado que o perfil do funcionário não permite alterar dados clínicos
    Quando ele tenta excluir uma alergia
    Então o sistema nega a operação
```

<a id="us-38"></a>

### US-38 · Gerenciar Catálogo de Serviços (empresa)

> Como usuário-empresa, preciso cadastrar, consultar, alterar e gerenciar os serviços que ofereço.

**Caso de uso:** [UC-38](REQ-04-especificacao-casos-de-uso.md#uc-38) · **Requisito:** RF37 · **Prioridade:** Must

```gherkin
# language: pt
Funcionalidade: US-38 Gerenciar Catálogo de Serviços (empresa)

  Cenário: Cadastro de serviço
    Dado que a empresa está no catálogo
    Quando cadastra Banho com preço e duração de 60 minutos
    Então o serviço fica ativo no catálogo

  Cenário: Alteração de preço (RN27)
    Dado que existe agendamento de Banho contratado por R$ 60,00
    Quando a empresa altera o preço para R$ 70,00
    Então o agendamento existente mantém R$ 60,00
```

<a id="us-39"></a>

### US-39 · Agendar Serviço (empresa)

> Como usuário-empresa, preciso agendar serviços para os pets autorizados sem gerar conflitos de horário.

**Caso de uso:** [UC-39](REQ-04-especificacao-casos-de-uso.md#uc-39) · **Requisito:** RF38 · **Prioridade:** Must

```gherkin
# language: pt
Funcionalidade: US-39 Agendar Serviço (empresa)

  Cenário: Agendamento em horário livre
    Dado que o profissional e o pet estão livres às 9h
    Quando a empresa agenda um serviço para as 9h
    Então o agendamento é criado e o tutor é notificado

  Cenário: Recurso ocupado (RN29)
    Dado que a sala de banho está ocupada às 9h
    Quando a empresa agenda outro serviço na mesma sala às 9h
    Então o sistema recusa por conflito de recurso
```

<a id="us-40"></a>

### US-40 · Solicitar Agendamento de Serviço (tutor)

> Como tutor, preciso solicitar o agendamento de um serviço para o meu pet.

**Caso de uso:** [UC-40](REQ-04-especificacao-casos-de-uso.md#uc-40) · **Requisito:** RF39 · **Prioridade:** Must

```gherkin
# language: pt
Funcionalidade: US-40 Solicitar Agendamento de Serviço (tutor)

  Cenário: Solicitação em horário disponível
    Dado que o serviço tem horário disponível às 15h
    Quando o tutor solicita o agendamento para o seu pet às 15h
    Então a solicitação fica PENDENTE com a primeira entrada no histórico

  Cenário: Horário ocupado no envio (RN14)
    Dado que o horário das 15h foi ocupado enquanto o tutor preenchia
    Quando o tutor envia a solicitação
    Então o sistema informa o conflito e atualiza os horários disponíveis
```

<a id="us-41"></a>

### US-41 · Gerenciar Solicitações de Serviço (empresa)

> Como usuário-empresa, preciso consultar, aceitar, atualizar, recusar e acompanhar as solicitações de serviço recebidas.

**Caso de uso:** [UC-41](REQ-04-especificacao-casos-de-uso.md#uc-41) · **Requisito:** RF40 · **Prioridade:** Must

```gherkin
# language: pt
Funcionalidade: US-41 Gerenciar Solicitações de Serviço (empresa)

  Cenário: Aceite de solicitação
    Dado que há uma solicitação PENDENTE
    Quando a empresa aceita a solicitação
    Então a solicitação fica ACEITA, o agendamento é criado e o tutor é notificado

  Cenário: Recusa sem motivo (RN40)
    Dado que há uma solicitação PENDENTE
    Quando a empresa tenta recusar sem informar o motivo
    Então o sistema exige o motivo da recusa
```

<a id="us-42"></a>

### US-42 · Consultar e Acompanhar Solicitações (tutor)

> Como tutor, preciso consultar o status, acompanhar o andamento e cancelar, quando necessário, as minhas solicitações de serviço.

**Caso de uso:** [UC-42](REQ-04-especificacao-casos-de-uso.md#uc-42) · **Requisito:** RF41 · **Prioridade:** Must

```gherkin
# language: pt
Funcionalidade: US-42 Consultar e Acompanhar Solicitações (tutor)

  Cenário: Acompanhamento
    Dado que o tutor tem uma solicitação ACEITA
    Quando abre os detalhes da solicitação
    Então o sistema exibe o status atual e o histórico de alterações

  Cenário: Cancelamento após o horário (RN38)
    Dado que o horário da solicitação já passou
    Quando o tutor tenta cancelar
    Então o sistema bloqueia o cancelamento e informa o motivo
```

<a id="us-43"></a>

### US-43 · Conversar em Chat na Plataforma

> Como usuário-tutor ou usuário-empresa, preciso me comunicar por meio de um chat integrado à plataforma.

**Caso de uso:** [UC-43](REQ-04-especificacao-casos-de-uso.md#uc-43) · **Requisito:** RF42 · **Prioridade:** Could

```gherkin
# language: pt
Funcionalidade: US-43 Conversar em Chat na Plataforma

  Cenário: Conversa com empresa
    Dado que o tutor tem agendamento com a empresa
    Quando envia uma mensagem no chat da empresa
    Então a mensagem é entregue à empresa

  Cenário: Assistente sem plano PANTERA (RN25)
    Dado que o tutor não tem assinatura PANTERA ativa
    Quando abre o chat com o assistente virtual
    Então o sistema bloqueia o acesso e oferece a assinatura
```

<a id="us-44"></a>

### US-44 · Realizar Pagamento (tutor)

> Como tutor, preciso realizar o pagamento dos serviços contratados para o meu pet.

**Caso de uso:** [UC-44](REQ-04-especificacao-casos-de-uso.md#uc-44) · **Requisito:** RF43 · **Prioridade:** Should

```gherkin
# language: pt
Funcionalidade: US-44 Realizar Pagamento (tutor)

  Cenário: Pagamento confirmado
    Dado que o tutor tem um serviço aceito para pagar
    Quando paga com PIX e o gateway confirma
    Então o pagamento fica ACEITO com a data de confirmação

  Cenário: Cartão recusado (RN39)
    Dado que o tutor escolheu cartão de crédito
    Quando o gateway recusa a transação
    Então o pagamento fica RECUSADO e o tutor pode tentar outro meio
```

<a id="us-45"></a>

### US-45 · Gerenciar Pagamentos

> Como usuário-tutor ou usuário-empresa, preciso consultar e gerenciar as informações relacionadas aos pagamentos realizados/recebidos.

**Caso de uso:** [UC-45](REQ-04-especificacao-casos-de-uso.md#uc-45) · **Requisito:** RF44 · **Prioridade:** Should

```gherkin
# language: pt
Funcionalidade: US-45 Gerenciar Pagamentos

  Cenário: Consulta por período
    Dado que o tutor tem pagamentos no mês
    Quando filtra os pagamentos do mês
    Então o sistema lista os pagamentos com valor, data e status

  Cenário: Reembolso de pagamento não concluído (RN39)
    Dado que o pagamento está PENDENTE
    Quando o tutor solicita reembolso
    Então o sistema não permite o reembolso
```

<a id="us-46"></a>

### US-46 · Gerenciar Privacidade e Consentimentos

> Como usuário-tutor ou usuário-empresa, preciso consultar e gerenciar meus consentimentos, permissões de compartilhamento e solicitações de privacidade, incluindo exclusão de dados quando aplicável.

**Caso de uso:** [UC-46](REQ-04-especificacao-casos-de-uso.md#uc-46) · **Requisito:** RF45 · **Prioridade:** Must

```gherkin
# language: pt
Funcionalidade: US-46 Gerenciar Privacidade e Consentimentos

  Cenário: Revogação de consentimento opcional
    Dado que o tutor consentiu o compartilhamento opcional de dados
    Quando revoga esse consentimento
    Então o consentimento fica revogado com data e a ação é auditada

  Cenário: Revogação de termo obrigatório (RN25)
    Dado que o termo de uso é obrigatório
    Quando o tutor tenta revogá-lo
    Então o sistema alerta que o serviço não pode ser prestado e oferece a exclusão da conta
```
