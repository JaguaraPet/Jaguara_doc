# GES-03 · Cronograma

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | GES-03 · Cronograma e marcos |
| Versão | 1.1 |
| Status | Em revisão |
| Autores | Ricardo Guilhen |
| Data | 14/11/2026 |
| Tarefa Jira | JAG-55 |
| Padrão de referência | PMBOK (cronograma por marcos) e Scrum (sprints de duas semanas) |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 1.0 | 01/11/2026 | Ricardo Guilhen | Versão inicial com as sprints realizadas e o planejamento até a v1.0. |
| 1.1 | 14/11/2026 | Ricardo Guilhen | Sprint 7 realizada e Sprint 8 como a última até a v1.0; sem monografia nem banca, a entrega final é o projeto com o pitch (ADR-003). |

## 1. Objetivo

Registrar as sprints já executadas, os marcos do projeto e a distribuição prevista dos pacotes da [EAP (GES-02)](GES-02-EAP.md) até a entrega da versão 1.0.

## 2. Escopo e premissas

- As sprints têm duas semanas e vão de quinta a quinta-feira ([GES-06](GES-06-processo-do-time.md)).
- O cronograma operacional (tarefas, responsáveis e status) vive no Jira, board *SCRUM board* do projeto JAG. Este documento registra apenas sprints, metas e marcos.
- Não há monografia nem banca: a entrega final do curso é o projeto e um pitch ([ADR-003](../03-arquitetura/adr/ADR-003-padrao-de-documentacao.md)). A data do pitch aparece como *a confirmar* até ser divulgada.

## 3. Sprints realizadas

| Sprint | Período | Meta registrada no Jira | Principais entregas |
|---|---|---|---|
| SCRUM Sprint 1 | 06/08 a 20/08/2026 | — | Definição do tema e do escopo |
| SCRUM Sprint 2 | 20/08 a 04/09/2026 | — | Pesquisa de mercado, SWOT, Duplo Diamante, GUT, RACI; primeiro trabalho de Tecnologias Emergentes |
| SCRUM Sprint 3 | 04/09 a 18/09/2026 | Finalizar documentação e iniciar programação | Novos requisitos (RF33 a RF45), TAP revisado, novos casos de uso |
| SCRUM Sprint 4 | 18/09 a 02/10/2026 | Concluir diagramas e criar protótipos | Diagramas de casos de uso e classes iniciados |
| SCRUM Sprint 5 | 02/10 a 16/10/2026 | — | Especificação de casos de uso no modelo Bússola |
| SCRUM Sprint 6 | 16/10 a 30/10/2026 | Entregar artefatos de documentação, iniciar repositório e projeção das telas | Repositórios criados, diagrama de casos de uso refatorado, avaliação de custos de infraestrutura |
| SCRUM Sprint 7 | 29/10 a 12/11/2026 | — | Documentação padronizada no repositório, ADRs aceitas, entrega dos artefatos (02/11) e avaliação ao vivo (10/11), backlog da v1.0 detalhado no Jira |

## 4. Marcos

| Marco | Data | Situação |
|---|---|---|
| M1 · Escopo e TAP aprovados | 08/09/2026 | Concluído |
| M2 · Entrega de artefatos à disciplina de gestão (SWOT, GUT, RACI, pesquisa de mercado) | 28/08/2026 | Concluído |
| M3 · Entrega de artefatos à Escola de TI (avaliação de artefatos) | 02/11/2026 (entrega) e 10/11/2026 (avaliação ao vivo) | Concluído |
| M4 · Ambiente de desenvolvimento e CI/CD prontos | 12/11/2026 | Em aberto no Jira ao fim da Sprint 7; segue na Sprint 8 |
| M5 · MVP do tutor (cadastro, pet, saúde, calendário, notificações) | 26/11/2026 | Planejado (Sprint 8) |
| M6 · MVP Enterprise (catálogo, agenda, solicitações, atendimento) | 26/11/2026 | Planejado (Sprint 8) |
| M7 · Versão 1.0 testada e implantada | 26/11/2026 | Planejado (Sprint 8) |
| M8 · Pitch final | A confirmar | Depende do calendário do curso |

## 5. Sprints planejadas

| Sprint | Período | Meta proposta | Pacotes da EAP |
|---|---|---|---|
| SCRUM Sprint 8 | 13/11 a 26/11/2026 | Entregar a v1.0: módulos do tutor, Enterprise e administração, testes, implantação, manuais e preparação do pitch | 4.3, 5.1 a 5.6, 6.2, 6.3, 7.1 a 7.3, 8.1, 8.2 |

A Sprint 8 é a última do projeto. O backlog da v1.0 está no Jira, com uma tarefa por tela e funcionalidade, e as tarefas da Sprint 7 que não terminaram passam para ela.

## Questões em aberto

| ID | Questão | Encaminhamento |
|---|---|---|
| QA-01 | Data do pitch final | Confirmar com a coordenação e atualizar o M8 |
