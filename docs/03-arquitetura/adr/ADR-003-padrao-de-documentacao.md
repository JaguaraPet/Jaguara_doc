# ADR-003 · Padrão de documentação

| Campo | Valor |
|---|---|
| Status | Aceita |
| Data | 28/10/2026 |
| Autores | Ricardo Guilhen |
| Tarefa Jira | JAG-38, JAG-39 |

## Contexto

Os artefatos estavam espalhados em Google Docs, planilhas e Miro, cada um com formato próprio, e a avaliação do curso exige artefatos versionados em repositório, em Markdown e YAML.

## Decisão

A documentação segue *docs as code* no repositório `Jaguara_doc`, com os padrões: PMBOK (gestão), ISO/IEC/IEEE 29148 (requisitos), modelo Bússola com campos de Cockburn (casos de uso), Gherkin (critérios de aceitação), UML 2.5.1 em PlantUML (modelagem), arc42 e C4 (arquitetura), ADR de Nygard (decisões), OpenAPI 3.1 (API), ISO/IEC/IEEE 29119-3 (testes), ISO/IEC/IEEE 26514 (manuais) e ABNT NBR 14724 (monografia). Todo documento usa o [modelo padrão](../../_modelos/MODELO-documento.md) e cumpre a [DoD da documentação](../../_modelos/DoD-documentacao.md).

## Alternativas consideradas

- Manter Google Docs: colaboração fácil, mas sem versionamento junto ao código nem revisão por pull request.
- Ferramentas visuais de UML (Astah, StarUML, draw.io): boas para desenhar, mas geram arquivos binários difíceis de revisar e de manter consistentes.
- Mermaid: integrado ao GitHub, mas sem suporte a pacotes, classes de associação e restrições da UML.

## Consequências

- Positiva: documentação revisável, versionada e rastreável.
- Positiva: diagramas como texto permitem revisar mudanças linha a linha.
- Negativa: a equipe precisa aprender PlantUML e Markdown; os originais ficam como anexos para consulta.

## Notas

Aprovada pelo time em 28/10/2026, ao iniciar a padronização (JAG-27).
