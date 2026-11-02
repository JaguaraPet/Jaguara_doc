# ADR-007 · Stack do frontend web e mobile

| Campo | Valor |
|---|---|
| Status | Proposta |
| Data | 01/11/2026 |
| Autores | Ricardo Guilhen |
| Tarefa Jira | JAG-38, JAG-39 |

## Contexto

O tutor usa principalmente o celular (TAP); empresas e administradores usam o computador. RNF04 exige Android, iOS e navegadores. TypeScript é a linguagem principal do time.

## Decisão

**App mobile do tutor em React Native com Expo** (TypeScript, Expo Router, TanStack Query, notificações pelo Expo Notifications). **Aplicação web Enterprise e de administração em React com Vite** (TypeScript, React Router, TanStack Query, biblioteca de componentes acessível). Cliente da API gerado a partir do contrato OpenAPI da API, compartilhado pelos dois *frontends*.

## Alternativas consideradas

- Flutter: bom desempenho, mas em Dart, fora da linguagem principal do time.
- Aplicativos nativos (Kotlin e Swift): duas bases de código para um time pequeno.
- Next.js na web: renderização no servidor não é necessária em um painel autenticado.

## Consequências

- Positiva: React nas duas plataformas, mesma linguagem do backend e tipos gerados da API.
- Negativa: funcionalidades nativas específicas podem exigir módulos nativos do Expo.

## Notas

Proposta pela padronização; confirmar na discussão de ADRs (JAG-39).
