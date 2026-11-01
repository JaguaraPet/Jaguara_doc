# REQ-00 · Identificadores e correspondência

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | REQ-00 · Padrão de identificadores e tabela de correspondência |
| Versão | 1.0 |
| Status | Em revisão |
| Autores | Ricardo Guilhen |
| Data | 01/11/2026 |
| Tarefa Jira | JAG-53 |
| Padrão de referência | ISO/IEC/IEEE 29148 (identificação única e rastreável) |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 1.0 | 01/11/2026 | Ricardo Guilhen | Padrão de identificadores e correspondência entre as numerações da planilha de casos de uso. |

## 1. Objetivo

Unificar os identificadores usados em todos os documentos e registrar a correspondência entre a numeração antiga e a atual dos casos de uso, para que referências feitas em documentos, tarefas do Jira e diagramas anteriores continuem rastreáveis.

## 2. Padrão de identificadores

| Item | Formato | Exemplo | Onde é definido |
|---|---|---|---|
| Requisito funcional | `RFnn` | RF39 | [REQ-01](REQ-01-ERS.md) |
| Regra de negócio | `RNnn` | RN40 | [REQ-01](REQ-01-ERS.md) |
| Requisito não funcional | `RNFnn` | RNF03 | [REQ-01](REQ-01-ERS.md) |
| Caso de uso | `UC-nn` | UC-40 | [REQ-04](REQ-04-especificacao-casos-de-uso.md) |
| História de usuário | `US-nn` (mesmo número do UC) | US-40 | [REQ-05](REQ-05-historias-de-usuario.md) |
| Caso de teste | `CT-nn-mm` (história + cenário) | CT-40-02 | [TST-02](../05-testes/TST-02-casos-de-teste.md) |
| Restrição de integridade | `RC-nn` | RC-21 | [MOD-01](../04-modelagem/MOD-01-modelo-de-classes.md) |
| Diagrama | `DC-nn` (classes), `DS-nn` (sequência), `DE-nn` (estados), `DA-nn` (atividades), `UCD-nn` (casos de uso) | DS-02 | Documento do diagrama |
| Decisão de arquitetura | `ADR-nnn` | ADR-004 | [adr/](../03-arquitetura/adr) |
| Risco | `Rnn` | R03 | [GES-05](../01-gestao/GES-05-registro-de-riscos.md) |
| Questão em aberto | `QA-nn` (local a cada documento) | QA-01 | Seção final de cada documento |
| Documento | `XXX-nn` | REQ-04 | [docs/README.md](../README.md) |

Regras:

- Um identificador nunca é reaproveitado. Item descontinuado mantém o número com a marcação *descontinuado* (exemplo: RF24).
- O número do caso de uso é igual ao número da aba da planilha atual (`JGRnnn` → `UC-nn`).

## 3. Correspondência dos casos de uso

Em 30/10/2026 o JGR024 (Registrar atendimentos) foi incorporado ao JGR023 e a planilha foi renumerada: os casos JGR025 a JGR047 passaram a JGR024 a JGR046. Referências feitas antes dessa data (documentos, tarefas JAG-1, JAG-2, JAG-35 e diagramas antigos) usam a numeração anterior.

| UC | Planilha atual (30/10) | Numeração anterior (até 28/10) | Caso de uso | RF |
|---|---|---|---|---|
| UC-01 | JGR001 | JGR001 | Cadastrar usuário-tutor | RF01 |
| UC-02 | JGR002 | JGR002 | Autenticar usuário | RF02 |
| UC-03 | JGR003 | JGR003 | Recuperar senha | RF03 |
| UC-04 | JGR004 | JGR004 | Gerenciar pet | RF04 |
| UC-05 | JGR005 | JGR005 | Vincular responsável ao pet | RF05 |
| UC-06 | JGR006 | JGR006 | Controlar despesas | RF06 |
| UC-07 | JGR007 | JGR007 | Emitir relatório de despesas | RF07 |
| UC-08 | JGR008 | JGR008 | Registrar alimentação | RF08 |
| UC-09 | JGR009 | JGR009 | Sincronizar calendário externo | RF09 |
| UC-10 | JGR010 | JGR010 | Gerenciar calendário | RF10 |
| UC-11 | JGR011 | JGR011 | Compartilhar perfil do pet | RF11 |
| UC-12 | JGR012 | JGR012 | Visualizar vacinação | RF12 |
| UC-13 | JGR013 | JGR013 | Cadastrar vacinação | RF13 |
| UC-14 | JGR014 | JGR014 | Gerenciar medicamentos | RF14 |
| UC-15 | JGR015 | JGR015 | Gerenciar memorial de pet | RF15 |
| UC-16 | JGR016 | JGR016 | Gerenciar permissões | RF16 |
| UC-17 | JGR017 | JGR017 | Emitir BI | RF17 |
| UC-18 | JGR018 | JGR018 | Emitir relatórios | RF18 |
| UC-19 | JGR019 | JGR019 | Gerenciar funcionários | RF19 |
| UC-20 | JGR020 | JGR020 | Consultar pets vinculados | RF20 |
| UC-21 | JGR021 | JGR021 | Gerenciar clientes | RF21 |
| UC-22 | JGR022 | JGR022 | Visualizar perfil do pet | RF22 |
| UC-23 | JGR023 | JGR023 | Registrar serviços | RF23 |
| UC-24 | JGR024 | JGR025 | Controlar agenda | RF25 |
| UC-25 | JGR025 | JGR026 | Monitorar desempenho e logs | RF26 |
| UC-26 | JGR026 | JGR027 | Prestar suporte operacional | RF27 |
| UC-27 | JGR027 | JGR028 | Gerenciar integrações | RF28 |
| UC-28 | JGR028 | JGR029 | Gerenciar contas de usuários | RF29 |
| UC-29 | JGR029 | JGR030 | Gerenciar permissões globais | RF30 |
| UC-30 | JGR030 | JGR031 | Gerenciar Webhooks | RF31 |
| UC-31 | JGR031 | JGR032 | Disparar notificações automáticas | RF32 |
| UC-32 | JGR032 | JGR033 | Cadastrar usuário-empresa | RF01 |
| UC-33 | JGR033 | JGR034 | Visualizar Catálogo de Serviços | RF39 |
| UC-34 | JGR034 | JGR035 | Gerenciar documentos do pet | RF33 |
| UC-35 | JGR035 | JGR036 | Consultar Linha do Tempo do Pet | RF34 |
| UC-36 | JGR036 | JGR037 | Gerenciar Exames do Pet | RF35 |
| UC-37 | JGR037 | JGR038 | Gerenciar Alergias e Restrições | RF36 |
| UC-38 | JGR038 | JGR039 | Gerenciar Catálogo de Serviços (empresa) | RF37 |
| UC-39 | JGR039 | JGR040 | Agendar Serviço (empresa) | RF38 |
| UC-40 | JGR040 | JGR041 | Solicitar Agendamento de Serviço (tutor) | RF39 |
| UC-41 | JGR041 | JGR042 | Gerenciar Solicitações de Serviço (empresa) | RF40 |
| UC-42 | JGR042 | JGR043 | Consultar e Acompanhar Solicitações (tutor) | RF41 |
| UC-43 | JGR043 | JGR044 | Conversar em Chat na Plataforma | RF42 |
| UC-44 | JGR044 | JGR045 | Realizar Pagamento (tutor) | RF43 |
| UC-45 | JGR045 | JGR046 | Gerenciar Pagamentos | RF44 |
| UC-46 | JGR046 | JGR047 | Gerenciar Privacidade e Consentimentos | RF45 |
| — | — | JGR024 | Registrar atendimentos (descontinuado, incorporado ao UC-23) | RF24 |
## 4. Referências cruzadas corrigidas

| Origem | Referência antiga | Referência correta | Situação |
|---|---|---|---|
| Caso de uso de cadastro de empresa | RF01 (cadastro de tutor) | RF01, que cobre os dois tipos de cadastro (tutor e empresa) | Mantida, com UC-32 ligado ao RF01 |
| Caso de uso de catálogo | RF39 | RF39 (o requisito inclui visualizar o catálogo e solicitar o agendamento) | Mantida, com UC-33 e UC-40 ligados ao RF39 |
| Casos de uso após o JGR023 | JGR025 a JGR047 | UC-24 a UC-46 | Corrigida em todos os documentos do repositório |
| Diagrama de sequência original | JGR024 para Controlar agenda | UC-24 | Já usava a numeração nova |
