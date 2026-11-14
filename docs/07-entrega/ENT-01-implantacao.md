# ENT-01 · Guia de implantação e operação

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | ENT-01 · Guia de implantação e operação |
| Versão | 0.5 |
| Status | Rascunho |
| Autores | Ricardo Guilhen |
| Data | 01/11/2026 |
| Tarefa Jira | JAG-77 |
| Padrão de referência | arc42, seção 7 (visão de implantação) |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 0.5 | 01/11/2026 | Ricardo Guilhen | Procedimentos previstos a partir da ADR-006. Validar após a criação do CapRover (JAG-31) e da esteira (JAG-32, JAG-42). |

## 1. Objetivo

Descrever como colocar o Jaguara no ar, atualizar versões, fazer backup e restaurar, e monitorar a operação. Os comandos devem ser revisados quando a infraestrutura das tarefas JAG-31, JAG-32 e JAG-42 estiver pronta.

## 2. Pré-requisitos

| Item | Detalhe |
|---|---|
| VPS | Linux com Docker, 2 vCPU e 4 GB de RAM no mínimo |
| CapRover | Instalado na VPS, com domínio e certificado TLS automático |
| Domínios | `api.<dominio>`, `app.<dominio>` (web) e `homologacao.<dominio>` |
| PostgreSQL 16 e Redis 7 | Como *one-click apps* do CapRover ou serviço gerenciado |
| Armazenamento S3 | *Bucket* de arquivos e *bucket* de backups |
| Contas externas | Gateway de pagamento, e-mail, Expo (EAS) e provedor de IA, com chaves de teste e de produção |

## 3. Variáveis de ambiente da API e do worker

| Variável | Exemplo | Obrigatória |
|---|---|---|
| `DATABASE_URL` | `postgresql://jaguara:***@srv-captain--postgres:5432/jaguara` | Sim |
| `REDIS_URL` | `redis://srv-captain--redis:6379` | Sim |
| `JWT_SECRET` | segredo aleatório de 64 caracteres | Sim |
| `CHAVE_CRIPTOGRAFIA` | chave AES-256 em base64 para credenciais de integrações | Sim |
| `S3_ENDPOINT`, `S3_BUCKET`, `S3_ACCESS_KEY`, `S3_SECRET_KEY` | — | Sim |
| `EMAIL_API_KEY` | — | Sim |
| `URL_WEB`, `URL_APP` | origens liberadas no CORS | Sim |
| `NODE_ENV` | `production` | Sim |

Segredos ficam apenas nas variáveis do CapRover e nos *secrets* do GitHub, nunca no repositório.

## 4. Implantação

| Ambiente | Gatilho | Passos automatizados (GitHub Actions) |
|---|---|---|
| Homologação | Merge na `main` | Testes → build das imagens `api`, `worker` e `web` → `prisma migrate deploy` → deploy no app de homologação do CapRover |
| Produção | *Tag* `vX.Y.Z` | Mesmos passos, com aprovação manual do *Product Owner* antes do deploy |
| App mobile | *Tag* `vX.Y.Z` | `eas build` e `eas submit` (lojas) ou atualização *over the air* para correções sem mudança nativa |

Implantação manual de emergência: `caprover deploy -a api -i <registro>/jaguara-api:vX.Y.Z`.

## 5. Backup e recuperação (RNF07)

| Item | Procedimento |
|---|---|
| Backup | `pg_dump` diário às 03:00 (horário de Brasília), compactado e enviado ao *bucket* de backups; retenção de 30 dias |
| Teste de restauração | Mensal, em banco temporário, registrado no Jira |
| Restauração | 1. Parar API e worker; 2. criar banco vazio; 3. `pg_restore` do último backup; 4. `prisma migrate deploy`; 5. subir API e worker; 6. conferir `/health` |
| Metas | RPO ≤ 24 h e RTO ≤ 4 h |

## 6. Monitoramento

| Item | Ferramenta | Alerta |
|---|---|---|
| Disponibilidade (RNF02) | Monitor externo de `/health` a cada minuto | Duas falhas seguidas |
| Erros da API | Logs JSON do CapRover | Taxa de 5xx acima de 1% em 5 minutos |
| Fila de notificações | Painel do BullMQ | Jobs falhados acumulados |
| Disco e memória | Painel do CapRover | Uso acima de 80% |

## 7. Atualização de versões

1. Conferir as [notas de versão](ENT-04-notas-de-versao.md).
2. Criar a *tag* e acompanhar a esteira.
3. Validar `/health` e um fluxo crítico (login e consulta de pets).
4. Em caso de falha, reimplantar a *tag* anterior; migrações destrutivas exigem backup imediatamente antes.
