# ADR-011 · Tempo real e tarefas assíncronas

| Campo | Valor |
|---|---|
| Status | Proposta |
| Data | 01/11/2026 |
| Autores | Ricardo Guilhen |
| Tarefa Jira | JAG-38, JAG-39 |

## Contexto

RNF08 exige alterações refletidas em até 2 segundos entre dispositivos e o chat (RF42) precisa de entrega imediata. As notificações (RF32, RN37) e as tentativas de webhook (RN36) precisam rodar fora da requisição do usuário.

## Decisão

**WebSocket com Socket.IO** (*gateway* do NestJS) para chat e eventos de atualização, com salas por usuário, por pet e por empresa e autenticação pelo access token. **BullMQ sobre Redis** para jobs atrasados e repetitivos (notificações, sincronização de calendário, reenvio de webhooks, expiração de tokens), processados por um *worker* separado da API.

## Alternativas consideradas

- Consultas periódicas (*polling*): simples, mas não atinge 2 s sem carga alta no servidor.
- Serviços gerenciados de mensageria (Pusher, Firebase): menos código, mas custo e dependência externa.

## Consequências

- Positiva: atende RNF08 e mantém a API sem estado (RNF05), já que o estado das filas fica no Redis.
- Negativa: mais um componente para operar (Redis).

## Notas

Proposta pela padronização.
