# UX-03 · Protótipos de alta fidelidade

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | UX-03 · Protótipos de alta fidelidade (Figma) |
| Versão | 0.5 |
| Status | Rascunho |
| Autores | Micaela Dorneles |
| Data | 01/11/2026 |
| Tarefa Jira | JAG-36 (e uma tarefa por tela, como JAG-83) |
| Padrão de referência | Protótipo navegável no Figma, a partir do [UX-01](UX-01-mapa-de-navegacao.md) e do [UX-02](UX-02-guia-de-estilo.md) |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 0.5 | 01/11/2026 | Ricardo Guilhen | Estrutura do documento, telas a prototipar e regras de exportação. Protótipos em andamento no Figma. |

## 1. Objetivo

Registrar os protótipos de alta fidelidade do Jaguara e manter no repositório a exportação de cada tela, como exige a avaliação de artefatos ("comitar o export do arquivo").

## 2. Arquivo Figma

| Item | Valor |
|---|---|
| Link do arquivo | A inserir pela responsável (JAG-36) |
| Página do app do tutor | A inserir |
| Página da web Enterprise | A inserir |

## 3. Telas e situação

| Tela | Caso de uso | Tarefa Jira | Situação |
|---|---|---|---|
| Catálogo de produtos/serviços (login de empresa) | UC-38 | JAG-83 | Em desenvolvimento |
| Demais telas do [UX-01](UX-01-mapa-de-navegacao.md), seção 6 | — | Uma tarefa por tela, a partir do JAG-36 | Pendente |

Prioridade de prototipação, pelos casos de uso *Must* do [REQ-01](../02-requisitos/REQ-01-ERS.md):

1. Cadastro, login e recuperação de senha (UC-01, UC-02, UC-03, UC-32).
2. Pets e perfil do pet com vacinas, medicamentos e alergias (UC-04, UC-12, UC-13, UC-14, UC-37).
3. Agenda do tutor e notificações (UC-10, UC-31).
4. Catálogo, solicitação e acompanhamento (UC-33, UC-40, UC-42).
5. Web Enterprise: catálogo, agenda, solicitações e atendimento (UC-38, UC-24, UC-41, UC-39, UC-23).
6. Funcionários e permissões (UC-19, UC-16) e privacidade (UC-46).

## 4. Exportação para o repositório

1. No Figma, selecione os *frames* finais de cada fluxo.
2. Exporte em **PNG 2x** (telas) e o arquivo completo em **PDF** (*File → Export frames to PDF*).
3. Salve em `docs/05-ux/prototipos/` com o nome `UX-03-<numero>-<tela>.png` (exemplo: `UX-03-01-login.png`) e o PDF como `UX-03-prototipos.pdf`.
4. Atualize a tabela da seção 3 com o link de cada imagem e faça o commit (`docs(ux): exporta protótipos de ...`).

## Questões em aberto

| ID | Questão | Encaminhamento |
|---|---|---|
| QA-01 | Link do Figma e exportação das telas prontas | Micaela Dorneles, JAG-36, antes da revisão da Sprint 7 |
