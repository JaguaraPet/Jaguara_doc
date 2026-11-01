# Backlog de documentação do Jaguara

| Campo | Valor |
|---|---|
| Documento | GES-07 · Backlog de documentação |
| Versão | 1.2 |
| Status | Tarefas criadas no Jira |
| Data | 28/10/2026 |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 1.0 | 28/10/2026 | Equipe Jaguara | Levantamento inicial da documentação faltante. |
| 1.1 | 28/10/2026 | Equipe Jaguara | Cruzamento com o backlog do Jira (JAG-1 a JAG-49) e ajuste às convenções do projeto. |
| 1.2 | 28/10/2026 | Equipe Jaguara | Tarefas novas criadas no Jira (JAG-50 a JAG-82) e padrão registrado nas descrições de JAG-26, 27, 28, 38, 41, 43, 44, 47 e 48. |

## 1. Objetivo

Listar toda a documentação que o projeto precisa até a v1.0, no padrão definido na ADR-001, separando o que já está no backlog do Jira do que precisa ser criado.

## 2. Resumo

| Situação | Tarefas |
|---|---|
| Já existia no Jira | 12 |
| Criada, refazendo algo já fechado | 2 |
| Criada | 31 |
| **Total levantado** | **45** |

## 3. Convenções seguidas

As tarefas criadas (JAG-50 a JAG-82) seguem o que o projeto JAG já usa:

- tipo de item **Tarefa**, sem épicos nem etiquetas;
- prioridades com os nomes do Jira (Highest, High, Medium, Low);
- sem story points: o tempo estimado fica no fim da descrição, para o time preencher no planejamento;
- sem sprint e sem responsável: tudo entra em *ag. desenvolvimento* no backlog;
- descrição com objetivo, padrão, entregável, critérios de aceite e dependências pelas chaves JAG.

## 4. Sugestão para a SCRUM Sprint 7

Tarefas novas que destravam as demais, além das que já estão em andamento (JAG-27, JAG-26, JAG-35, JAG-41):

- JAG-50 · Criar modelo padrão de documento e Definition of Done da documentação
- JAG-51 · Migrar a documentação do Google Drive e Miro para o repositório de documentação
- JAG-53 · Padronizar identificadores e criar a tabela de correspondência JGR → UC
- JAG-65 · Decidir as questões em aberto do modelo de domínio
- JAG-61 · Adequar o diagrama de casos de uso à UML 2.5.1
- JAG-58 · Reestruturar o documento de requisitos no padrão ISO 29148 (ERS)

## 5. Levantamento completo

### Padronização e estrutura da documentação

| # | Tarefa | Padrão | Situação no Jira | Depende de | Prioridade | Onda |
|---|---|---|---|---|---|---|
| 1 | Registrar o padrão de documentação (ADR-001) | ADR (Michael Nygard) | Existe: JAG-38. Primeira ADR da tarefa de ADRs. | – | Highest | 1 |
| 2 | Criar modelo padrão de documento e Definition of Done da documentação | IEEE (cabeçalho e controle de versão) | **JAG-50** (criada) | #1 | Highest | 1 |
| 3 | Migrar a documentação do Google Drive e Miro para o repositório de documentação | Docs as code | **JAG-51** (criada) | #2 | High | 1 |
| 4 | Configurar a geração dos diagramas PlantUML | PlantUML | **JAG-52** (criada) | #3 | High | 1 |
| 5 | Padronizar identificadores e criar a tabela de correspondência JGR → UC | ISO/IEC/IEEE 29148 | **JAG-53** (criada) | #3 | High | 1 |

### Gestão do projeto (PMBOK)

| # | Tarefa | Padrão | Situação no Jira | Depende de | Prioridade | Onda |
|---|---|---|---|---|---|---|
| 6 | Migrar o TAP para o modelo padrão | PMBOK | Existe: JAG-4. Incluído na migração (tarefa D3); não precisa de tarefa própria. | #2 | Medium | 1 |
| 7 | Elaborar a EAP e o dicionário da EAP | PMBOK (WBS) | **JAG-54** (criada) | #3 | High | 1 |
| 8 | Elaborar o cronograma com marcos até a entrega da v1.0 | PMBOK | **JAG-55** (criada) | #7 | High | 1 |
| 9 | Criar o registro de stakeholders e a matriz RACI | PMBOK | Existe: JAG-21. RACI já feita; entra na migração (D3). | – | Medium | 1 |
| 10 | Formalizar o registro de riscos | PMBOK | **JAG-56** (criada) | #3 | Medium | 1 |
| 11 | Documentar o processo do time: cerimônias, Definition of Ready e Definition of Done | Scrum Guide | **JAG-57** (criada) | – | Medium | 1 |

### Requisitos (ISO/IEC/IEEE 29148)

| # | Tarefa | Padrão | Situação no Jira | Depende de | Prioridade | Onda |
|---|---|---|---|---|---|---|
| 12 | Reestruturar o documento de requisitos no padrão ISO 29148 (ERS) | ISO/IEC/IEEE 29148 | **JAG-58** (criada, refaz JAG-17) | #5 | Highest | 1 |
| 13 | Tornar os requisitos não funcionais mensuráveis | ISO/IEC/IEEE 29148 e ISO/IEC 25010 | **JAG-59** (criada) | #12 | High | 1 |
| 14 | Criar o glossário do domínio | ISO/IEC/IEEE 29148 | **JAG-60** (criada) | – | Medium | 1 |
| 15 | Adequar o diagrama de casos de uso à UML 2.5.1 | UML 2.5.1 | **JAG-61** (criada, refaz JAG-2) | #5 | High | 1 |
| 16 | Completar as especificações de casos de uso incompletas | Modelo Bússola | Existe: JAG-35. Já descrito no JAG-35 (em desenvolvimento). | – | Highest | 1 |
| 17 | Padronizar as especificações de casos de uso (pós-condições, RF/RN e extensões numeradas) | Modelo Bússola + Cockburn (fully dressed) | **JAG-62** (criada) | #16, #5 | High | 1 |
| 18 | Escrever critérios de aceitação em Gherkin para as histórias de usuário | User stories + Gherkin | **JAG-63** (criada) | #17 | High | 2 |
| 19 | Montar a matriz de rastreabilidade | ISO/IEC/IEEE 29148 | **JAG-64** (criada) | #18 | High | 2 |
| 20 | Decidir as questões em aberto do modelo de domínio | ADR | **JAG-65** (criada) | – | Highest | 1 |

### Modelagem do sistema (UML 2.5.1)

| # | Tarefa | Padrão | Situação no Jira | Depende de | Prioridade | Onda |
|---|---|---|---|---|---|---|
| 21 | Revisar e aprovar o modelo de classes (MOD-01) | UML 2.5.1 | Existe: JAG-27. É a tarefa atual. Atualizar a descrição e fechar após a revisão do grupo. | – | Highest | 1 |
| 22 | Diagramas de sequência | UML 2.5.1 | Existe: JAG-26. Alinhar ao padrão (ver ajustes sugeridos). | – | High | 2 |
| 23 | Modelo de dados ER e dicionário de dados | Notação pé de galinha | Existe: JAG-47, JAG-48. Definição de tabelas e de schemas cobrem o modelo lógico e o físico. | – | High | 2 |
| 24 | Elaborar os diagramas de máquina de estados | UML 2.5.1 | **JAG-66** (criada) | #21 | Medium | 2 |
| 25 | Elaborar os diagramas de atividade dos processos de negócio | UML 2.5.1 | **JAG-67** (criada) | #17 | Medium | 2 |

### Arquitetura (arc42 + C4)

| # | Tarefa | Padrão | Situação no Jira | Depende de | Prioridade | Onda |
|---|---|---|---|---|---|---|
| 26 | Definir a stack e registrar as decisões em ADRs | ADR | Existe: JAG-38, JAG-39. Usar a avaliação do JAG-7 (Azure) como insumo. | – | Highest | 2 |
| 27 | Documento de arquitetura arc42 | arc42 | Existe: JAG-41. Alinhar ao padrão arc42 (ver ajustes sugeridos). | – | High | 2 |
| 28 | Diagramas C4 de contexto, contêineres e componentes | C4 model | Existe: JAG-41, JAG-44. Contexto e contêineres no JAG-41; componentes no JAG-44. | – | High | 2 |
| 29 | Especificar a API em OpenAPI | OpenAPI 3.1 | **JAG-68** (criada) | #21, #26 | High | 2 |
| 30 | Documentar segurança e conformidade com a LGPD | LGPD, OWASP ASVS | **JAG-69** (criada) | #27 | High | 2 |
| 31 | Especificar as integrações externas | arc42 (seção 3) e OpenAPI | **JAG-70** (criada) | #27 | Medium | 3 |

### Interface e experiência do usuário

| # | Tarefa | Padrão | Situação no Jira | Depende de | Prioridade | Onda |
|---|---|---|---|---|---|---|
| 32 | Elaborar o mapa de navegação e os fluxos de tela | Fluxograma de navegação | **JAG-71** (criada) | #17 | High | 2 |
| 33 | Protótipos no Figma | Figma | Existe: JAG-36. Um ticket por tela, como já combinado. | – | High | 3 |
| 34 | Guia de estilo | WCAG 2.2 | Existe: JAG-28. Ampliar a paleta para guia de estilo (ver ajustes sugeridos). | – | Medium | 3 |

### Qualidade e testes (ISO/IEC/IEEE 29119-3)

| # | Tarefa | Padrão | Situação no Jira | Depende de | Prioridade | Onda |
|---|---|---|---|---|---|---|
| 35 | Elaborar o plano de testes | ISO/IEC/IEEE 29119-3 | **JAG-72** (criada) | #12 | High | 3 |
| 36 | Especificar os casos de teste a partir dos critérios Gherkin | ISO/IEC/IEEE 29119-3 | **JAG-73** (criada) | #19, #35 | High | 3 |
| 37 | Emitir o relatório de execução de testes da v1.0 | ISO/IEC/IEEE 29119-3 | **JAG-74** (criada) | #36 | Medium | 4 |

### Entrega e operação

| # | Tarefa | Padrão | Situação no Jira | Depende de | Prioridade | Onda |
|---|---|---|---|---|---|---|
| 38 | Escrever o README técnico e o guia de ambiente dos repositórios | Docs as code | **JAG-75** (criada) | #26 | High | 2 |
| 39 | Definir padrões de código, fluxo Git e guia de contribuição | Conventional Commits | **JAG-76** (criada) | #26 | Medium | 2 |
| 40 | Escrever o guia de implantação e operação | arc42 (seção 7) | **JAG-77** (criada) | #27 | Medium | 4 |
| 41 | Escrever o manual do usuário do tutor (app) | ISO/IEC/IEEE 26514 | **JAG-78** (criada) | #32 | Medium | 4 |
| 42 | Escrever o manual do usuário da empresa (web Enterprise) | ISO/IEC/IEEE 26514 | **JAG-79** (criada) | #32 | Medium | 4 |
| 43 | Publicar as notas de versão da v1.0 | Keep a Changelog | **JAG-80** (criada) | #37 | Low | 4 |

### Monografia (ABNT NBR 14724)

| # | Tarefa | Padrão | Situação no Jira | Depende de | Prioridade | Onda |
|---|---|---|---|---|---|---|
| 44 | Estruturar a monografia no modelo ABNT e mapear capítulos e artefatos | ABNT NBR 14724 | **JAG-81** (criada) | – | Medium | 3 |
| 45 | Compilar os apêndices técnicos para a entrega | ABNT NBR 14724 | **JAG-82** (criada) | #37 | Medium | 4 |

Ondas: 1 = Base: padrão, requisitos e modelo estático; 2 = Modelagem dinâmica, dados e arquitetura; 3 = Interface e planejamento de testes; 4 = Entrega, manuais e monografia.

## 6. Padrão registrado nas tarefas existentes

Estas tarefas estavam com a descrição vazia e receberam o texto abaixo em 28/10/2026. Status, responsáveis e prioridades não foram alterados.

| Tarefa | Resumo | Padrão registrado |
|---|---|---|
| JAG-27 | Criar diagrama de classes | Padrão UML 2.5.1 em PlantUML. Entregável: docs/04-modelagem/MOD-01-modelo-de-classes.md e diagrama-de-classes/DC-00 a DC-08. Critérios: revisado pelos quatro integrantes; SVGs gerados; questões em aberto QA-02 a QA-04 decididas (nova tarefa de decisão). |
| JAG-26 | Criar diagrama de sequência | Padrão UML 2.5.1 em PlantUML, usando as classes e operações da MOD-01. Fluxos mínimos: autenticação, solicitar agendamento, aceitar solicitação, registrar atendimento, realizar pagamento e disparo de notificação. Entregável: docs/04-modelagem/MOD-02-diagramas-de-sequencia.md. |
| JAG-41 | Desenvolver documento técnico de arquitetura | Seguir as 12 seções do arc42, com diagramas C4 de contexto e contêineres (C4-PlantUML). Cenários de qualidade ligados aos RNF. Entregável: docs/03-arquitetura/ARQ-01-arquitetura.md. |
| JAG-44 | Desenvolvimento de documento de arquitetura de código | Diagrama C4 de componentes do backend e a organização em camadas/pastas, como seção 5 (visão de blocos) do arc42. |
| JAG-38 | Desenvolvimento de ADRs | Modelo de Michael Nygard (contexto, decisão, status, consequências), um arquivo por decisão em docs/03-arquitetura/adr/. ADR-001: padrão de documentação. Próximas: nuvem (insumo JAG-7), backend, frontend/mobile, banco, autenticação. |
| JAG-47 / JAG-48 | Definição de tabelas / schemas do banco | JAG-47 = modelo lógico (ER em notação pé de galinha, derivado da MOD-01); JAG-48 = modelo físico com tipos, chaves e índices. Os dois com dicionário de dados em docs/04-modelagem/MOD-03-modelo-de-dados.md. |
| JAG-43 | Desenvolvimento do documento de teste unitário | Passa a ser a seção de testes unitários do plano de testes (nova tarefa, ISO/IEC/IEEE 29119-3). |
| JAG-28 | Definir paleta de cores do projeto | Registrar a paleta como tokens e verificar contraste WCAG AA; é a primeira parte do guia de estilo (docs/06-ux/UX-02-guia-de-estilo.md). |
| JAG-35 | Melhoria da documentação de casos de uso | Sem mudança de escopo. A padronização dos campos (pós-condições, RF/RN, extensões numeradas) fica para a tarefa nova seguinte. |