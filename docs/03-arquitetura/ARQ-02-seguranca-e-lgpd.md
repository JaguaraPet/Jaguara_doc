# ARQ-02 · Segurança e conformidade com a LGPD

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | ARQ-02 · Segurança da informação e proteção de dados pessoais |
| Versão | 2.0 |
| Status | Em revisão |
| Autores | Ricardo Guilhen |
| Data | 14/11/2026 |
| Tarefa Jira | JAG-69, JAG-215 |
| Padrão de referência | LGPD (Lei nº 13.709/2018); Resoluções CD/ANPD nº 2/2022 (agentes de pequeno porte), nº 15/2024 (incidentes) e nº 19/2024 (transferência internacional); OWASP ASVS 4.0 nível 2; modelo de RIPD da ANPD (simplificado) |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 1.0 | 01/11/2026 | Ricardo Guilhen | Bases legais, controles de segurança, RIPD simplificado e direitos do titular. |
| 1.1 | 14/11/2026 | Ricardo Guilhen | Dados de clientes sem conta no Jaguara (ADR-010, item 3). |
| 2.0 | 14/11/2026 | Ricardo Guilhen | Gaps da avaliação de 10/11: classificação dos dados, dados dos pets, criptografia em repouso e de backups, CPF cifrado e mascarado, suboperadores e transferência internacional, registro das operações de tratamento, RIPD revisado e prazos de incidente. |

## 1. Objetivo

Definir como o Jaguara protege os dados de tutores, pets, empresas, funcionários e clientes das empresas e como cumpre a LGPD, a partir do mapeamento de dados do [GES-08](../01-gestao/GES-08-pesquisa-de-mercado.md) e das regras RN15, RN24, RN25, RN26 e RN31.

## 2. Papéis na LGPD

| Papel | Quem |
|---|---|
| Controlador | Jaguara, para dados de tutores, das contas das empresas e da própria plataforma |
| Controlador (dados da operação da empresa) | Cada empresa Enterprise, sobre seus clientes, funcionários e atendimentos; o Jaguara atua como **operador** desses dados e só os trata conforme as instruções da empresa e os termos da Enterprise |
| Suboperadores | Serviços externos da seção 8, contratados pelo Jaguara |
| Encarregado (DPO) | Ver seção 2.1 |
| Titulares | Tutores, representantes das empresas, funcionários e clientes das empresas, inclusive os que não têm conta no Jaguara |

### 2.1 Encarregado e canal do titular

A Resolução CD/ANPD nº 2/2022 dispensa o agente de tratamento de pequeno porte de indicar encarregado, desde que mantenha um canal de comunicação com o titular e não faça tratamento de alto risco. Mesmo assim, o Jaguara adota:

- **Fase acadêmica:** o líder técnico responde pelos pedidos de titulares, registrados em `SolicitacaoPrivacidade`.
- **Antes do lançamento público:** indicar formalmente o encarregado (art. 41) e publicar nome e contato na política de privacidade. Isso fica em aberto (QA-01) porque o enquadramento como pequeno porte depende da forma jurídica e do faturamento da empresa que vier a operar o Jaguara.
- **Canal:** formulário "Privacidade" no app e na web (UC-46) e um e-mail exclusivo de privacidade, os dois indicados na política de privacidade.

## 3. Classificação dos dados

Todo dado guardado pelo Jaguara tem um nível. O nível define onde o dado pode aparecer, quem acessa e como é protegido.

| Nível | O que entra | Exemplos | Controles mínimos |
|---|---|---|---|
| **Restrito** | Dado que, vazado, permite fraude, tomada de conta ou identificação direta | Hash de senha, tokens, refresh tokens, credenciais de integração, CPF, arquivos de documentos dos pets | Cifrado na coluna ou no arquivo além do disco; nunca em log, e-mail, *push* ou URL; acesso só pelo serviço que precisa dele; leitura auditada |
| **Confidencial** | Dado pessoal comum e dado do pet ligado ao tutor | Nome, e-mail, telefone, endereço, data de nascimento, dados e saúde dos pets, fotos, despesas, pagamentos, mensagens, dados dos clientes das empresas | Acesso por posse, vínculo ou compartilhamento (RN15, RN24, RN26); disco cifrado; mascarado em listas e relatórios quando não for necessário por inteiro |
| **Interno** | Dado operacional sem identificação direta | Logs técnicos, métricas, configurações, catálogo e agenda da empresa | Acesso do time e de administradores; retenção limitada |
| **Público** | Dado feito para ser visto | Espécies e raças, serviços e horários divulgados pelas empresas, termos e política publicados | Sem restrição de leitura; alteração só por perfil autorizado |

Na dúvida, vale o nível mais alto. Um dado novo só entra no modelo com o nível definido no inventário da seção 4.

## 4. Inventário de dados e bases legais

| Categoria | Dados | Nível | Finalidade | Base legal (art. 7º) | Retenção |
|---|---|---|---|---|---|
| Identificação do tutor | Nome, CPF, e-mail, telefone, endereço | Restrito (CPF) e Confidencial | Conta, unicidade (RN01), comunicação | Execução de contrato (V) | Enquanto a conta existir; 5 anos após exclusão só o necessário para obrigações legais |
| Autenticação | Hash de senha, sessões, tokens, histórico de senhas | Restrito | Acesso seguro (RN03 a RN06) | Execução de contrato (V) | Sessões: 30 dias; histórico: 3 últimas senhas |
| Cadastro do pet | Nome, espécie, raça, sexo, nascimento, peso, cor, microchip, foto | Confidencial | Funcionalidade principal | Execução de contrato (V) | Enquanto a conta existir (seção 5) |
| Saúde do pet | Vacinas, exames, medicamentos, alergias, registros clínicos | Confidencial | Funcionalidade principal | Execução de contrato (V) | Enquanto a conta existir; cópia do atendimento fica com a empresa (seção 5) |
| Documentos do pet | Arquivos de receitas, laudos e carteiras de vacina | Restrito | Guardar e compartilhar documentos | Execução de contrato (V) | Enquanto a conta existir |
| Compartilhamentos | Escopos e destinatários | Confidencial | Acesso de terceiros autorizado pelo tutor (RN15) | Consentimento (I) | Até revogação ou expiração |
| Financeiro | Despesas e pagamentos | Confidencial | Controle de gastos e cobrança | Execução de contrato (V); obrigação legal (II) para dados fiscais | 5 anos (fiscal) |
| Empresa | CNPJ, razão social, endereço, representante | Confidencial | Conta Enterprise | Execução de contrato (V) | Enquanto a conta existir |
| Funcionários | Nome, CPF, e-mail, perfil | Restrito (CPF) e Confidencial | Acesso à operação da empresa | Execução de contrato (V), pela empresa | Até o desligamento (RN23) e 6 meses de auditoria |
| Clientes da empresa | Nome, CPF, contato, pets e vínculo opcional com a conta do tutor | Restrito (CPF) e Confidencial | Operação da empresa | Consentimento (I) (RN25), coletado pela empresa | Até revogação ou fim do vínculo com a empresa |
| Registros de consentimento | Termo e versão aceitos, data, meio e prova da coleta | Confidencial | Provar o consentimento (art. 8º, § 2º) | Obrigação legal (II) | Enquanto o tratamento durar e 5 anos depois |
| Dispositivos | Token de *push* e plataforma | Confidencial | Enviar notificações | Execução de contrato (V) | Até o logout ou token inválido |
| Chat | Mensagens com a empresa | Confidencial | Comunicação e suporte | Execução de contrato (V) | 1 ano |
| Assistente virtual | Mensagens e contexto do pet enviado ao provedor | Confidencial | Responder dúvidas gerais (RF42) | Execução de contrato (V) | 90 dias no Jaguara; sem retenção no provedor (seção 8) |
| Logs e auditoria | Ações, IP, data | Interno | Segurança e auditoria (RN31) | Legítimo interesse (IX) | 1 ano; logs críticos 5 anos |
| Marketing | Preferências de comunicação | Confidencial | Ofertas e novidades | Consentimento (I) | Até revogação |

Os prazos de retenção são propostas para validação jurídica antes do lançamento (QA-02).

## 5. Dados dos pets

O animal não é titular de dados, mas quase tudo que se guarda sobre ele identifica ou revela algo do tutor. Quando o dado do pet está ligado a um tutor, o Jaguara o trata como **dado pessoal do tutor** (art. 5º, I: informação relacionada a pessoa natural identificável). A saúde animal não é dado pessoal sensível (art. 5º, II, trata só de pessoas), por isso fica no nível Confidencial e não exige consentimento específico.

| Dado do pet | Por que revela algo do tutor | Regra no Jaguara |
|---|---|---|
| Microchip | Liga o animal ao tutor em cadastros de clínicas e prefeituras | Único no sistema; visível só ao tutor, aos responsáveis (RN09) e a empresas com escopo de saúde; nunca usado em busca aberta |
| Foto | Pode mostrar pessoas, a casa e a localização pelo GPS dos metadados | Metadados EXIF e de GPS removidos pelo *worker* antes de a foto ficar disponível; arquivo com nome aleatório |
| Documentos (receitas, laudos, carteira de vacina) | Trazem nome, endereço e às vezes o CPF do tutor | Nível Restrito; armazenamento privado com URL assinada de leitura de 5 minutos, gerada só depois de checar a permissão (RN15, RN26); arquivo cifrado no armazenamento |
| Histórico clínico, vacinas e medicamentos | Mostra rotina, gastos e condição financeira da família | Acesso por posse, responsável ou compartilhamento com escopo; leitura por empresa registrada em `LogAuditoria` |
| Agenda e eventos | Mostram horários em que a família está fora de casa | Títulos de eventos enviados ao calendário externo sem dado de saúde; só com autorização (RN13) |
| Memorial | Conteúdo afetivo sobre o animal falecido | Visível só ao tutor e a quem ele compartilhar |

Regras do ciclo de vida:

1. **Acesso:** dono, responsáveis (RN09), empresas com compartilhamento ativo e no escopo dado pelo tutor (RN15) e funcionários com permissão e vínculo de atendimento (RN24, RN26). Negar por padrão.
2. **Assistente virtual:** recebe só espécie, raça, idade e alergias do pet da conversa ([ARQ-03](ARQ-03-integracoes.md), 3.5).
3. **Exclusão da conta do tutor:** pets, fotos e documentos são excluídos ou anonimizados com o tutor (UC-46). O registro de atendimento feito por uma empresa é dela, como controladora, e fica com ela pelo prazo que ela definir conforme as normas do CFMV sobre prontuário; o Jaguara mantém essa cópia apenas no espaço da empresa e sem ligação com a conta excluída.
4. **Pet cadastrado pela empresa para cliente sem conta:** é dado da empresa (controladora). Se o cliente criar conta depois, o pet só passa para a conta do tutor com o aceite dele ([ADR-010](adr/ADR-010-decisoes-de-dominio.md), item 3).
5. **Pet falecido:** os dados seguem as regras acima até o tutor excluí-los; as notificações agendadas do pet são canceladas (DE-02).

## 6. Criptografia e proteção em repouso

| Camada | Proteção | Chave |
|---|---|---|
| Disco da VPS e volume do PostgreSQL | Criptografia de disco do provedor ou LUKS | Gerida pelo provedor ou pelo time, fora do servidor |
| Colunas de nível Restrito | AES-256-GCM na aplicação, antes de gravar: `cpf_cifrado`, credenciais de integração, tokens de calendário | Chave de dados por ambiente, em variável de ambiente do CapRover, com versão gravada junto ao valor cifrado para permitir rotação |
| Busca e unicidade de CPF | Índice cego `cpf_hash` = HMAC-SHA256 do CPF normalizado com segredo próprio; a unicidade (RN01) usa o hash e nunca o CPF em claro | Segredo do HMAC separado da chave de dados |
| Senhas | Argon2id com sal por usuário ([ADR-009](adr/ADR-009-autenticacao-e-autorizacao.md)) | Não se aplica |
| Arquivos (fotos e documentos) | *Bucket* privado com criptografia do lado do servidor; sem listagem pública | Chave do provedor de armazenamento |
| Backups diários (RNF07) | `pg_dump` cifrado com chave pública antes de sair do servidor; guardado em armazenamento externo no Brasil; retenção de 30 dias; teste de restauração mensal registrado | Chave privada de restauração fora do servidor, com dois integrantes do time |
| Redis | Sem dado de nível Restrito; só identificadores, filas e a lista de sessões revogadas; acesso só pela rede interna, com senha | Não se aplica |

Rotação: a chave de dados e o segredo do HMAC são trocados uma vez por ano e logo após qualquer incidente. Valores antigos são cifrados de novo por um job do *worker*; o índice cego é recalculado no mesmo job.

### 6.1 Mascaramento do CPF

- A API devolve o CPF mascarado (`***.456.789-**`) em todas as respostas, exceto ao próprio titular na tela "Meus dados" e na exportação de dados (UC-46).
- Funcionários da empresa veem o CPF do cliente mascarado; o CPF completo só aparece para perfis com a permissão de ver dados completos de clientes, concedida pelo administrador da empresa.
- CPF nunca aparece em logs, mensagens de erro, URLs, e-mails ou notificações *push*.
- O modelo físico aplica a regra: as colunas `cpf_cifrado` e `cpf_hash` substituem `cpf` em `tutor`, `funcionario_enterprise` e `cliente` ([MOD-03](../04-modelagem/MOD-03-modelo-de-dados.md), versão 1.3).

## 7. Direitos do titular (art. 18)

| Direito | Como é atendido | Caso de uso |
|---|---|---|
| Confirmação e acesso | Tela "Meus dados" e exportação em JSON | UC-46 |
| Correção | Edição do perfil; pedido `CORRECAO_DADOS` para dados bloqueados | UC-46 |
| Anonimização, bloqueio ou eliminação | Pedido `EXCLUSAO_DADOS`: anonimiza o usuário e seus pets, mantendo apenas o exigido por lei | UC-46 |
| Portabilidade | Exportação em formato estruturado (JSON) | UC-46 |
| Informação sobre compartilhamento | Lista de compartilhamentos ativos por pet e lista de suboperadores na política de privacidade | UC-11 |
| Revogação do consentimento | Revogação com data, sem afetar tratamentos anteriores | UC-46 |

Pedidos são registrados em `SolicitacaoPrivacidade` e respondidos em até 15 dias.

**Cliente da empresa sem conta no Jaguara:** a empresa é a controladora, então é ela quem responde. O cliente pede à empresa, que atende pela tela de clientes (UC-21). Se o pedido chegar ao Jaguara, o Jaguara, como operador, repassa à empresa e avisa o cliente de que ela é a responsável.

## 8. Suboperadores e transferência internacional

O Jaguara só envia a cada serviço o mínimo necessário para a finalidade. A escolha final de cada provedor é registrada em ADR quando a integração for implementada ([ARQ-03](ARQ-03-integracoes.md)); a tabela vale como requisito para essa escolha.

| Serviço | Dados enviados | Finalidade | Local esperado | Salvaguarda |
|---|---|---|---|---|
| Hospedagem (VPS e PostgreSQL) | Todos | Executar a plataforma | Brasil (requisito na escolha do provedor) | Contrato de serviço; seção 6 |
| Armazenamento de arquivos | Fotos e documentos | Guardar arquivos | Brasil, de preferência | Contrato; *bucket* privado |
| Gateway de pagamento | Nome, e-mail e CPF do pagador, valor | Cobrança (RF43, RF44) | Brasil | Contrato do gateway, que é controlador dos dados de pagamento que coleta |
| Calendário externo (Google, Microsoft) | Título, data e local dos eventos, sem dado de saúde | Sincronizar agenda (RN13) | Exterior | Pedido e autorização do próprio titular via OAuth (art. 33, VIII e IX) e termos do provedor |
| E-mail transacional | E-mail e texto da mensagem | Confirmação de conta, recuperação de senha e avisos | Exterior, em geral | Cláusulas-padrão contratuais da ANPD (art. 33, II, b; Resolução CD/ANPD nº 19/2024) |
| *Push* (Expo, FCM e APNs) | Token do dispositivo e texto da notificação, sem dado de saúde nem CPF | Lembretes e avisos (RN37) | Exterior | Cláusulas-padrão contratuais; texto mínimo, como "Lembrete de medicamento do Thor" |
| Provedor de IA do assistente | Espécie, raça, idade e alergias do pet e o texto da conversa | Assistente virtual (RF42) | Exterior | Cláusulas-padrão contratuais; contrato sem retenção e sem uso dos dados para treino; aviso ao tutor para não digitar dados pessoais |
| Lojas e Expo EAS | Nenhum dado da plataforma | Distribuir o app | Exterior | Não se aplica |

A lista atualizada de suboperadores fica na política de privacidade. Incluir ou trocar um suboperador exige atualizar esta tabela, avisar as empresas Enterprise com 30 dias de antecedência (termos da Enterprise) e revisar o RIPD.

## 9. Registro das operações de tratamento (art. 37)

As seções 4 e 8 dão os dados, as bases legais e os destinatários. Esta tabela liga cada operação ao agente responsável.

| Operação | Agente | Titulares | Dados | Compartilhado com | Base legal |
|---|---|---|---|---|---|
| Cadastro e acesso do tutor | Jaguara (controlador) | Tutores | Identificação e autenticação | E-mail transacional | Contrato |
| Gestão de pets e saúde | Jaguara (controlador) | Tutores | Pets, saúde e documentos | Armazenamento; empresas, só com compartilhamento | Contrato; consentimento para o compartilhamento |
| Assistente virtual | Jaguara (controlador) | Tutores com PANTERA | Contexto do pet e conversa | Provedor de IA | Contrato |
| Lembretes e notificações | Jaguara (controlador) | Tutores | Dispositivo e texto do lembrete | *Push*, e-mail | Contrato |
| Pagamentos e assinaturas | Jaguara (controlador) | Tutores | Financeiro | Gateway de pagamento | Contrato; obrigação legal |
| Conta da empresa | Jaguara (controlador) | Representantes | Dados da empresa e do representante | E-mail transacional | Contrato |
| Funcionários da empresa | Empresa (controladora); Jaguara (operador) | Funcionários | Identificação e acesso | Nenhum | Contrato da empresa com o funcionário |
| Cadastro de clientes da empresa | Empresa (controladora); Jaguara (operador) | Clientes sem conta e tutores | Identificação, contato e pets | Nenhum | Consentimento coletado pela empresa (RN25) |
| Agendamento e atendimento | Empresa (controladora); Jaguara (operador) | Clientes e tutores | Agenda, serviços, registros do atendimento | Calendário externo, se autorizado | Contrato da empresa com o cliente |
| Chat | Jaguara e empresa, cada um sobre suas mensagens | Tutores e funcionários | Mensagens | Nenhum | Contrato |
| Auditoria e segurança | Jaguara (controlador) | Todos | Logs | Nenhum | Legítimo interesse |

O registro é revisto junto com o RIPD (seção 11).

## 10. Controles de segurança (OWASP ASVS nível 2)

| Área ASVS | Controle no Jaguara | Requisito |
|---|---|---|
| V2 Autenticação | Argon2id; senha mínima de 8 caracteres verificada contra listas de senhas vazadas; bloqueio após 5 falhas; recuperação com token de uso único de 2 h | RN03, RN05, RN06 |
| V3 Sessão | Access token de 15 min; refresh token rotativo vinculado à `Sessao`; expiração por inatividade de 4 h; revogação imediata | RN04, RN23 |
| V4 Controle de acesso | RBAC por rota; verificação de posse e de compartilhamento em cada consulta de pet; negar por padrão | RN20, RN24, RN26, RN30 |
| V5 Validação | DTOs validados; consultas parametrizadas (Prisma); saída escapada no frontend; tipo e tamanho de arquivo checados (PDF, JPEG, PNG, até 10 MB) | RNF01 |
| V6 Criptografia | TLS 1.2 ou superior; AES-256-GCM nas colunas de nível Restrito; índice cego HMAC-SHA256 para CPF; backups cifrados; chaves fora do repositório e com rotação anual (seção 6) | RNF01, RNF07 |
| V7 Erros e logs | Erros sem detalhes internos; logs estruturados sem senha, token, CPF ou dado de saúde | RN31 |
| V8 Proteção de dados | Classificação da seção 3; minimização (CPF só onde a regra exige); CPF mascarado; arquivos com URL assinada de curta duração; metadados de fotos removidos | LGPD |
| V9 Comunicação | HSTS; CORS restrito às origens do app e da web | RNF01 |
| V10 Código malicioso | `npm audit` e Dependabot na CI | RNF01 |
| V13 API | Limite de requisições por IP e por usuário; webhooks com HMAC-SHA256 e carimbo de tempo | RN36 |
| V14 Configuração | Segredos fora do repositório; cabeçalhos de segurança; imagens Docker mínimas | RNF01 |

## 11. Relatório de Impacto à Proteção de Dados (RIPD), versão simplificada

| Item | Avaliação |
|---|---|
| Natureza | Dados de identificação, contato e financeiros de tutores; dados de clientes das empresas, inclusive sem conta; dados operacionais de empresas; cadastro, saúde e documentos de animais ligados aos tutores |
| Escopo | Usuários no Brasil; volume previsto de até 10.000 tutores e 500 empresas na v1.0 (RNF05); parte dos dados vai a suboperadores no exterior (seção 8) |
| Contexto | Os titulares esperam que dados do pet sejam vistos por clínicas só quando autorizarem; clientes cadastrados por uma empresa não escolheram o Jaguara e talvez nem o conheçam |
| Finalidades | Seção 4 |
| Riscos principais | Acesso indevido por empresa não autorizada; vazamento de credenciais; exposição de CPF; vazamento de backup; localização exposta por metadados de fotos; cadastro de cliente sem consentimento válido; transferência internacional sem salvaguarda; uso do chat ou do assistente para orientação clínica indevida |
| Probabilidade e impacto | Risco R03 do [GES-05](../01-gestao/GES-05-registro-de-riscos.md): probabilidade 3, impacto 5; riscos R15 e R16 do mesmo registro |
| Medidas | Compartilhamento por escopo (RN15), verificação de vínculo (RN24), auditoria (RN31), classificação (seção 3), regras dos pets (seção 5), criptografia e mascaramento (seção 6), registro de consentimento do cliente com versão e prova, cláusulas-padrão com suboperadores (seção 8), aviso de que o assistente não substitui o veterinário |
| Risco residual | Médio, aceitável para a v1.0 com as medidas implementadas e testadas |
| Revisão | A cada nova integração, suboperador ou categoria de dado, e antes do lançamento público |

## 12. Incidentes

1. Detectar (alertas de monitoramento ou relato) e registrar em `LogAuditoria` com nível CRITICO.
2. Conter (revogar sessões, rotacionar chaves, bloquear contas afetadas).
3. Avaliar o risco aos titulares assim que o incidente for confirmado.
4. Quando o Jaguara é **controlador** e há risco ou dano relevante: comunicar a ANPD e os titulares em até 3 dias úteis a partir da ciência de que o incidente atingiu dados pessoais (art. 48; Resolução CD/ANPD nº 15/2024). Agentes de pequeno porte têm prazo em dobro, mas o Jaguara adota o prazo normal.
5. Quando o Jaguara é **operador** (dados da operação de uma empresa): avisar a empresa sem demora, com as informações de que ela precisa para fazer a própria comunicação.
6. Guardar o registro do incidente, mesmo sem comunicação, e registrar a lição aprendida no registro de riscos.

## Questões em aberto

| ID | Questão | Encaminhamento |
|---|---|---|
| QA-01 | Indicação formal do encarregado de dados (DPO) | Definir antes do lançamento público, conforme o enquadramento da empresa (seção 2.1) |
| QA-02 | Validação jurídica dos prazos de retenção | Consultar orientador ou assessoria jurídica |
| QA-03 | Provedores com dados no Brasil (hospedagem, armazenamento, backups) | Requisito para a ADR de cada integração |
