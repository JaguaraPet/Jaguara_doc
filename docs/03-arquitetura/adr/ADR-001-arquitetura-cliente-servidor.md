# ADR-001 · Arquitetura cliente-servidor baseada em API

| Campo | Valor |
|---|---|
| Status | Aceita |
| Data | 18/08/2026 |
| Autores | Equipe Jaguara |
| Tarefa Jira | JAG-38, JAG-39 |

## Contexto

O Jaguara é uma plataforma web e mobile destinada ao gerenciamento da rotina, da saúde e das informações de animais de estimação. Os mesmos dados são usados por um aplicativo mobile (tutor), por uma aplicação web (Enterprise e administração) e, no futuro, por integrações de parceiros.

## Decisão

O Jaguara será desenvolvido em arquitetura cliente-servidor baseada em API, separando as aplicações de apresentação do backend, que concentra as regras de negócio e a persistência.

## Alternativas consideradas

- Aplicação monolítica com páginas renderizadas no servidor: mais simples, mas não atende o app mobile nem integrações.
- Cada cliente acessando o banco diretamente (*backend as a service*): rápido de começar, mas espalha as regras de negócio e fragiliza a segurança.

## Consequências

- Positiva: facilita diferentes níveis de acesso e reaproveita as mesmas regras em todos os clientes.
- Positiva: permite integrações por API e webhooks (RNF10).
- Negativa: exige mecanismos adequados de autenticação e autorização ([ADR-009](ADR-009-autenticacao-e-autorizacao.md)).

## Notas

Registrada originalmente na atividade de ADR de 18/08/2026.
