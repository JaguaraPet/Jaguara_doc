# ARQ-03 · Integrações externas

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | ARQ-03 · Especificação das integrações externas |
| Versão | 1.0 |
| Status | Em revisão |
| Autores | Ricardo Guilhen |
| Data | 01/11/2026 |
| Tarefa Jira | JAG-70 |
| Padrão de referência | arc42 (contexto técnico), padrão portas e adaptadores |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 1.0 | 01/11/2026 | Ricardo Guilhen | Contratos, autenticação, eventos e tratamento de falhas de cada integração. |

## 1. Objetivo

Especificar cada integração do Jaguara com sistemas externos de forma que o provedor possa ser trocado sem alterar o domínio (RNF10). Toda integração é uma **porta** (interface TypeScript) com um **adaptador** por provedor, configurável pelo administrador (UC-27, RN33).

## 2. Visão geral

| Integração | Porta | Provedor sugerido para a v1.0 | Requisitos | Direção |
|---|---|---|---|---|
| Pagamento | `GatewayPagamento` | Mercado Pago (PIX, cartão e boleto, com ambiente de testes) | RF43, RF44, RN39 | Saída e webhook de entrada |
| Calendário | `CalendarioExterno` | Google Calendar API e Microsoft Graph | RF09, RN13 | Saída (OAuth 2.0) |
| E-mail | `EnvioEmail` | Serviço de e-mail transacional com API HTTP | RF01, RF03, RF32 | Saída |
| *Push* | `EnvioPush` | Expo Push Service (FCM e APNs) | RF32, RN37 | Saída |
| Assistente virtual | `AssistenteVirtual` | API de modelo de linguagem | RF42 | Saída |
| Arquivos | `ArmazenamentoArquivos` | Armazenamento compatível com S3 | RF33, RF35 | Saída (URL assinada) |
| Webhooks de saída | `PublicadorWebhook` | Implementação própria | RF31, RN36 | Saída |

Os provedores são sugestões da padronização; a escolha final é registrada em ADR quando a integração for implementada.

## 3. Especificações

### 3.1 Gateway de pagamento

| Item | Especificação |
|---|---|
| Operações | `criarCobranca(pagamento)`, `consultar(codigoTransacao)`, `estornar(pagamento, valor)` |
| Autenticação | Token de acesso do gateway, cifrado em `Integracao.credenciaisCifradas` |
| Idempotência | `pagamento.id` como chave de idempotência |
| Entrada | Webhook `POST /webhooks/pagamentos` com assinatura validada antes de qualquer processamento |
| Estados | Mapeamento do status do provedor para `StatusPagamento` (RN39): aprovado → ACEITO; rejeitado → RECUSADO; cancelado ou expirado → CANCELADO |
| Falhas | Gateway indisponível: pagamento permanece PENDENTE e o tutor tenta de novo; webhook perdido: reconciliação a cada hora por `consultar` |
| Testes | Ambiente de testes do provedor e cartões de teste |

### 3.2 Calendário externo

| Item | Especificação |
|---|---|
| Operações | `autorizar(usuario)`, `listarEventos(periodo)`, `criarEvento(evento)`, `revogar()` |
| Autenticação | OAuth 2.0 com escopo mínimo de calendário; tokens cifrados em `CalendarioExterno.tokenAutorizacao` |
| Regra | Só sincroniza com `autorizado = true` (RN13) |
| Execução | Job periódico no *worker* a cada 30 minutos e sob demanda |
| Conflitos | Evento externo alterado prevalece sobre a cópia local; eventos do Jaguara são marcados com `idExterno` |
| Falhas | Token expirado ou revogado: `autorizado = false` e notificação ao usuário |

### 3.3 E-mail transacional

| Item | Especificação |
|---|---|
| Mensagens | Confirmação de conta (RN02), recuperação de senha (RN05), notificações com canal EMAIL |
| Autenticação | Chave de API; domínio com SPF, DKIM e DMARC |
| Falhas | Até 5 tentativas com espera exponencial (DS-06) |

### 3.4 Notificação *push*

| Item | Especificação |
|---|---|
| Mensagens | Lembretes de medicamentos, vacinas, eventos e agendamentos; mudanças de status de solicitação |
| Registro | O app registra o token do dispositivo ao fazer login |
| Falhas | Token inválido é removido; demais erros seguem a política do DS-06 |

### 3.5 Assistente virtual

| Item | Especificação |
|---|---|
| Acesso | Só com assinatura PANTERA ativa ([ADR-010](adr/ADR-010-decisoes-de-dominio.md)) |
| Contexto enviado | Espécie, raça, idade e alergias do pet da conversa; nunca CPF, endereço ou dados de outros usuários |
| Salvaguardas | Instruções do sistema proíbem diagnóstico e prescrição; aviso fixo de que não substitui o veterinário (risco R08) |
| Limites | Limite de mensagens por dia por assinante para controlar custo |
| Falhas | Indisponibilidade informada na conversa, sem cobrança adicional |

### 3.6 Armazenamento de arquivos

| Item | Especificação |
|---|---|
| Fluxo | A API gera URL assinada de envio (5 min); o app envia direto ao armazenamento; a API registra o `arquivoUrl` |
| Restrições | PDF, JPEG e PNG; até 10 MB por arquivo |
| Acesso | URL assinada de leitura gerada apenas após verificar a permissão (RN15, RN26) |

### 3.7 Webhooks de saída

| Item | Especificação |
|---|---|
| Eventos | `solicitacao.criada`, `solicitacao.status_alterado`, `agendamento.criado`, `agendamento.cancelado`, `atendimento.finalizado`, `pagamento.confirmado` |
| Segurança | Somente HTTPS; cabeçalho `X-Jaguara-Assinatura` com HMAC-SHA256 do corpo e do carimbo de tempo (RN36) |
| Entrega | Pelo menos uma vez; até 5 tentativas com espera exponencial; identificador do evento para o destinatário descartar duplicatas |

## 4. Configuração

Credenciais e parâmetros ficam em `Integracao`, alterados apenas por administradores autorizados (RN33) e auditados (RN31). Nenhuma credencial fica no código ou no repositório.
