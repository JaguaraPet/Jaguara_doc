# ADR-005 · Banco de dados

| Campo | Valor |
|---|---|
| Status | Aceita |
| Data | 01/11/2026 |
| Autores | Ricardo Guilhen |
| Tarefa Jira | JAG-38, JAG-39 |

## Contexto

O domínio é fortemente relacional (pets, responsáveis, agendamentos, pagamentos), exige integridade (RN01, RN14, RN29, RN39) e auditoria (RN31). O time já havia escolhido PostgreSQL no Duplo Diamante e na RACI.

## Decisão

**PostgreSQL 16** como banco único da v1.0. Regras que o banco consegue garantir ficam no banco: `UNIQUE`, `CHECK`, chaves estrangeiras e restrição de exclusão (`EXCLUDE USING gist`) contra sobreposição de agendamentos. O modelo está no [MOD-03](../../04-modelagem/MOD-03-modelo-de-dados.md). Arquivos (documentos, laudos, fotos) ficam em armazenamento de objetos compatível com S3, e o banco guarda apenas a URL.

## Alternativas consideradas

- MongoDB: esquema flexível, mas sem integridade referencial e com consultas relacionais (agenda, BI) mais difíceis.
- MySQL: relacional e conhecido, mas sem restrição de exclusão por intervalo nem tipos `ENUM` e vetores tão práticos.

## Consequências

- Positiva: integridade garantida mesmo com acessos concorrentes; consultas de BI com SQL.
- Negativa: mudanças de esquema exigem migrações versionadas (Prisma Migrate).

## Notas

Formaliza a decisão registrada no Duplo Diamante (agosto de 2026).
