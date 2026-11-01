# ADR-008 · Processo de desenvolvimento (branches, revisão, CI e DoD)

| Campo | Valor |
|---|---|
| Status | Proposta |
| Data | 01/11/2026 |
| Autores | Ricardo Guilhen |
| Tarefa Jira | JAG-38, JAG-39 |

## Contexto

A avaliação pede o processo de desenvolvimento da equipe justificado via ADR: fluxo de trabalho, estratégia de branches, integração contínua e *definition of done*. O time trabalha em sprints de duas semanas no Jira ([GES-06](../../01-gestao/GES-06-processo-do-time.md)).

## Decisão

**GitHub Flow**: a `main` é sempre implantável; todo trabalho acontece em branch curta `tipo/JAG-nn-descricao` (ex.: `feat/JAG-58-ers`) e entra por **pull request** com pelo menos uma aprovação de outro integrante. Commits no padrão **Conventional Commits** com a chave do Jira. **CI no GitHub Actions** em todo pull request: lint, verificação de tipos, testes com cobertura, `npm audit` e validação do OpenAPI; na documentação, validação de YAML e renderização do PlantUML. *Merge* por *squash*. Versões com **SemVer** e *tags* `vX.Y.Z`. A *Definition of Done* é a do [GES-06](../../01-gestao/GES-06-processo-do-time.md). Detalhes no [CONTRIBUTING](../../../CONTRIBUTING.md).

## Alternativas consideradas

- Git Flow (branches `develop`, `release`, `hotfix`): adequado a releases agendados, mas pesado para um time de quatro pessoas com entrega contínua.
- Commit direto na `main`: rápido, mas sem revisão e com risco de quebrar o ambiente de homologação.

## Consequências

- Positiva: toda mudança é revisada e testada antes de entrar; histórico legível e ligado ao Jira.
- Negativa: pull requests exigem disponibilidade de revisores; o time combina revisar em até um dia útil.

## Notas

Atende ao item "processo de desenvolvimento da equipe" da avaliação de artefatos.
