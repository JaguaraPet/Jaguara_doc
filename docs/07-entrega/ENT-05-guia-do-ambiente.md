# ENT-05 · Guia do ambiente de desenvolvimento

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | ENT-05 · Guia do ambiente de desenvolvimento |
| Versão | 1.0 |
| Status | Em revisão |
| Autores | Micaela Dorneles |
| Revisor | Ricardo Guilhen |
| Data | 18/11/2026 |
| Tarefa Jira | JAG-75 |
| Padrão de referência | Docs as code |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 1.0 | 18/11/2026 | Micaela Dorneles | Repositórios, pré-requisitos, passo a passo do zero e problemas comuns. |

## 1. Objetivo

Permitir que um novo integrante clone os repositórios do Jaguara, suba o ambiente e rode a API, a web e o app no próprio computador seguindo só este guia e os README de cada repositório.

## 2. Escopo

Ambiente local de desenvolvimento. A implantação em homologação e produção está no [ENT-01](ENT-01-implantacao.md); o processo de trabalho (branches, commits e pull requests), no [CONTRIBUTING](../../CONTRIBUTING.md).

## 3. Referências

| ID | Documento |
|---|---|
| REF-01 | [ARQ-01 · Arquitetura](../03-arquitetura/ARQ-01-arquitetura.md), seções 5 e 7 |
| REF-02 | [ADR-004 · Stack do backend](../03-arquitetura/adr/ADR-004-stack-backend.md) e [ADR-007 · Stack do frontend](../03-arquitetura/adr/ADR-007-stack-frontend.md) |
| REF-03 | [TST-01 · Plano de testes](../06-testes/TST-01-plano-de-testes.md) |

## 4. Repositórios

| Repositório | Conteúdo | Tecnologia |
|---|---|---|
| [Jaguara_backend](https://github.com/JaguaraPet/Jaguara_backend) | API REST e WebSocket e worker de filas | NestJS, Prisma, PostgreSQL 16, Redis 7, BullMQ |
| [Jaguara_frontend_tutor](https://github.com/JaguaraPet/Jaguara_frontend_tutor) | App do tutor | React Native com Expo e Expo Router |
| [Jaguara_frontend_enterprise](https://github.com/JaguaraPet/Jaguara_frontend_enterprise) | Web Enterprise e administração | React com Vite e React Router |
| [Jaguara_doc](https://github.com/JaguaraPet/Jaguara_doc) | Documentação, ADRs e contrato OpenAPI | Markdown, PlantUML, OpenAPI 3.1 |

O contrato da API (`docs/03-arquitetura/api/openapi.yaml`) é a fonte dos tipos usados pelo app e pela web: cada repositório tem uma cópia e um script para atualizá-la.

## 5. Pré-requisitos

| Ferramenta | Versão | Para quê |
|---|---|---|
| Git | 2.40 ou maior | Clonar e versionar |
| Node.js | 24 LTS (arquivo `.nvmrc` de cada repositório) | Backend, web e app |
| npm | 11 ou maior | Dependências (com `package-lock.json`) |
| Docker Desktop | Atual | PostgreSQL, Redis, armazenamento S3 e Mailpit; também usado pelos testes de integração |
| Expo Go | Atual, no celular | Abrir o app do tutor sem gerar build |

## 6. Passo a passo do zero

1. Clone os três repositórios de código na mesma pasta:

   ```bash
   git clone https://github.com/JaguaraPet/Jaguara_backend.git
   git clone https://github.com/JaguaraPet/Jaguara_frontend_enterprise.git
   git clone https://github.com/JaguaraPet/Jaguara_frontend_tutor.git
   ```

2. Suba a API com dados de teste:

   ```bash
   cd Jaguara_backend
   cp .env.example .env
   docker compose up -d
   npm install
   npm run prisma:deploy
   npm run prisma:seed
   npm run start:dev
   ```

   A API responde em http://localhost:3000/v1/health e o Swagger fica em http://localhost:3000/v1/docs. Em outro terminal, `npm run start:worker:dev` sobe o worker que envia os e-mails; eles aparecem no Mailpit, em http://localhost:8025.

3. Suba a web Enterprise:

   ```bash
   cd Jaguara_frontend_enterprise
   npm install
   npm run dev
   ```

   Abra http://localhost:5173 e entre com `clinica.patas@exemplo.com`. A administração fica em http://localhost:5173/admin, com `admin@jaguara.exemplo.com`. Todos os usuários do seed usam a senha `Jaguara@2026`.

4. Suba o app do tutor:

   ```bash
   cd Jaguara_frontend_tutor
   npm install
   npm start
   ```

   Leia o código QR com o Expo Go, no celular conectado à mesma rede Wi-Fi do computador. Para o app falar com a API, crie um `.env` com `EXPO_PUBLIC_API_URL=http://<IP do computador>:3000/v1`. Os tutores do seed são `ana.tutora@exemplo.com`, `bruno.tutor@exemplo.com` e `carla.tutora@exemplo.com`.

## 7. Antes de abrir um pull request

Rode no repositório alterado o mesmo que o CI roda:

| Repositório | Comandos |
|---|---|
| Backend | `npm run lint`, `npm run typecheck`, `npm run test:cov`, `npm run test:e2e`, `npm run build` |
| Web | `npm run lint`, `npm run typecheck`, `npm test`, `npm run build` |
| App | `npm run lint`, `npm run typecheck`, `npm test` |

A cobertura mínima é de 70% das linhas no domínio e na aplicação do backend ([TST-01](../06-testes/TST-01-plano-de-testes.md)). Os testes de integração sobem bancos descartáveis com Testcontainers, por isso precisam do Docker ligado.

## 8. Problemas comuns

| Sintoma | Causa | Solução |
|---|---|---|
| O Docker Desktop fecha com "Não é possível o acesso ao arquivo pelo sistema" em `Docker\run` ou `docker-secrets-engine` | Arquivos de socket antigos que o Windows não consegue apagar | Feche o Docker, renomeie as pastas `%LOCALAPPDATA%\Docker\run` e `%LOCALAPPDATA%\docker-secrets-engine` e abra o Docker de novo |
| A API não sobe e lista "Variáveis de ambiente inválidas" | Falta o `.env` ou alguma variável | `cp .env.example .env` e confira os valores |
| Porta 5432, 6379 ou 3000 em uso | Outro PostgreSQL, Redis ou API rodando | Pare o outro serviço ou mude a porta no `docker-compose.yml` e no `.env` |
| `npm install` avisa sobre "install scripts" | O npm 11 só roda scripts de instalação aprovados | Os aprovados estão em `allowScripts` no `package.json`; aprove um novo com `npm install-scripts approve <pacote>` só se ele for necessário |
| O app no celular não acessa a API | `localhost` no celular é o próprio celular | Use o IP do computador em `EXPO_PUBLIC_API_URL` e a mesma rede Wi-Fi |
| `npm run test:e2e` falha ao iniciar | Docker desligado | Ligue o Docker; os testes sobem PostgreSQL e Redis próprios |
| A web mostra "Não foi possível entrar agora" | A API não está rodando ou ainda está compilando | Confira http://localhost:3000/v1/health |

## Questões em aberto

Nenhuma.
