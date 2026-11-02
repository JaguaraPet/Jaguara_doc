# ADR-006 · Hospedagem e implantação

| Campo | Valor |
|---|---|
| Status | Aceita |
| Data | 01/11/2026 |
| Autores | Ricardo Guilhen |
| Tarefa Jira | JAG-38, JAG-39 |

## Contexto

O orçamento é reduzido (risco R07). O time avaliou o Microsoft Azure (JAG-7) e planejou um servidor com CapRover (JAG-31) e uma esteira de deploy (JAG-32, JAG-42). Os requisitos pedem disponibilidade de 99% (RNF02) e backup diário (RNF07).

## Decisão

Aplicações empacotadas em **contêineres Docker** e implantadas em uma **VPS gerenciada pelo CapRover** (API, *worker*, Redis e web), com **PostgreSQL** no mesmo provedor e backup diário automatizado em armazenamento externo. Dois ambientes: **homologação** (deploy automático a cada merge na `main`) e **produção** (deploy por *tag* de versão). O app mobile é distribuído pelo **Expo EAS** (builds de teste e lojas). O Azure fica como alternativa de crescimento, já que os contêineres rodam em qualquer provedor.

## Alternativas consideradas

- Azure App Service e Azure Database for PostgreSQL: serviços gerenciados e créditos para estudantes, mas custo recorrente maior depois dos créditos e mais configuração.
- Plataformas *serverless* (Vercel, Render): simples, mas com limites de *worker* em segundo plano e de conexões ao banco.

## Consequências

- Positiva: custo previsível e baixo; deploy com um comando a partir da CI.
- Positiva: portabilidade, pois os mesmos contêineres sobem localmente com Docker Compose.
- Negativa: o time administra a VPS (atualizações, monitoramento, backup).

## Notas

Proposta pela padronização; conferir com a avaliação de custos do JAG-7.

Aceita pelo time em 01/11/2026, na revisão das ADRs (JAG-39).
