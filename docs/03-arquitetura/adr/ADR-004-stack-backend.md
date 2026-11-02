# ADR-004 · Linguagem e stack do backend

| Campo | Valor |
|---|---|
| Status | Proposta |
| Data | 01/11/2026 |
| Autores | Ricardo Guilhen |
| Tarefa Jira | JAG-38, JAG-39 |

## Contexto

O time já havia decidido construir as APIs em Node.js com TypeScript (Duplo Diamante e RACI, agosto de 2026), e TypeScript é a linguagem em que o desenvolvedor principal e *tech lead* é mais produtivo. Falta definir framework, ORM, validação e testes. A equipe tem quatro pessoas e prazo acadêmico; o domínio tem 56 classes e 45 requisitos.

## Decisão

Backend em **TypeScript (Node.js 20 LTS)** com **NestJS**, organizado como **monólito modular**: um módulo por pacote do domínio (acesso, pet, saúde, rotina, notificação, atendimento, financeiro, comunicação, privacidade, administração, relatórios). Persistência com **Prisma ORM** sobre PostgreSQL; validação de entrada com **class-validator** e **Zod** para configuração; documentação OpenAPI gerada pelo `@nestjs/swagger` e conferida contra o contrato OpenAPI do projeto; tarefas assíncronas com **BullMQ** sobre **Redis**; testes com **Jest** e **Supertest**.

## Alternativas consideradas

- Express ou Fastify puros: mais leves, mas o time teria de montar injeção de dependências, módulos, validação e documentação manualmente.
- Microsserviços (avaliados no JAG-7): isolamento e escala independentes, mas multiplicam infraestrutura, deploy e custo para um time de quatro pessoas, sem demanda que justifique.
- Outra linguagem (Java/Spring, C#/.NET): maduras, mas o time é mais produtivo em TypeScript e compartilharia tipos com o frontend.

## Consequências

- Positiva: uma só linguagem no backend, na web e no mobile, com tipos compartilhados.
- Positiva: módulos do NestJS espelham os pacotes do MOD-01; um módulo pode virar serviço separado no futuro sem reescrever o domínio.
- Negativa: NestJS tem curva de aprendizado (decorators, injeção de dependências).
- Negativa: monólito escala como um todo; aceitável para a carga do RNF05.

## Notas

Proposta pela padronização da documentação; confirmar na discussão de ADRs (JAG-39).
