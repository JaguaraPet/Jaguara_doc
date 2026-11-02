# UX-01 · Mapa de navegação

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | UX-01 · Mapa de navegação e fluxos de tela |
| Versão | 1.0 |
| Status | Em revisão |
| Autores | Ricardo Guilhen |
| Data | 01/11/2026 |
| Tarefa Jira | JAG-71 |
| Padrão de referência | Mapa de navegação (sitemap) e fluxos de usuário; WCAG 2.2 |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 1.0 | 01/11/2026 | Ricardo Guilhen | Telas do app do tutor e da web Enterprise e administração, ligadas aos casos de uso. |

## 1. Objetivo

Listar todas as telas da versão 1.0, como se navega entre elas e qual caso de uso cada uma atende. É a base para os protótipos do Figma ([UX-03](UX-03-prototipos.md)).

## 2. Princípios

- Tarefas principais do tutor em até 3 toques a partir da tela inicial (RNF06).
- Navegação por abas no app (Início, Pets, Agenda, Serviços, Perfil) e menu lateral na web.
- Toda tela de dados do pet mostra antes as alergias graves (UC-37).
- Ações destrutivas pedem confirmação; ações sem volta (excluir conta) pedem a senha.

## 3. App do tutor

```mermaid
flowchart LR
  A[Boas-vindas] --> B[Cadastro UC-01]
  A --> C[Login UC-02]
  C --> C1[Recuperar senha UC-03]
  C --> H((Início))
  H --> P[Pets]
  H --> AG[Agenda]
  H --> S[Serviços]
  H --> PF[Perfil]
  P --> P1[Novo pet UC-04]
  P --> P2[Perfil do pet UC-04]
  P2 --> V[Vacinas UC-12 / UC-13]
  P2 --> M[Medicamentos UC-14]
  P2 --> EX[Exames UC-36]
  P2 --> AL[Alergias UC-37]
  P2 --> DOC[Documentos UC-34]
  P2 --> LT[Linha do tempo UC-35]
  P2 --> ALI[Alimentação UC-08]
  P2 --> DESP[Despesas UC-06]
  DESP --> REL[Relatório UC-07]
  P2 --> RESP[Responsáveis UC-05]
  P2 --> COMP[Compartilhar UC-11]
  P2 --> MEM[Memorial UC-15]
  AG --> EV[Evento UC-10]
  AG --> CAL[Calendário externo UC-09]
  S --> CAT[Catálogo da empresa UC-33]
  CAT --> SOL[Solicitar agendamento UC-40]
  S --> MS[Minhas solicitações UC-42]
  MS --> PAG[Pagar UC-44]
  S --> CH[Chat UC-43]
  PF --> PG[Pagamentos UC-45]
  PF --> PRIV[Privacidade UC-46]
  PF --> NOT[Notificações UC-31]
```

| Tela | Caso de uso | Toques a partir do Início |
|---|---|---|
| Registrar vacina | UC-13 | 3 (Pets → pet → Vacinas) |
| Registrar medicamento | UC-14 | 3 |
| Criar evento | UC-10 | 2 (Agenda → novo) |
| Solicitar serviço | UC-40 | 3 (Serviços → empresa → serviço) |
| Acompanhar solicitação | UC-42 | 2 |

## 4. Web Enterprise

```mermaid
flowchart LR
  L[Login UC-02] --> D((Painel))
  CE[Cadastro da empresa UC-32] --> L
  D --> AGD[Agenda semanal UC-24]
  AGD --> NA[Novo agendamento UC-39]
  AGD --> AT[Registrar atendimento UC-23]
  D --> SO[Solicitações UC-41]
  D --> CA[Catálogo UC-38]
  D --> CL[Clientes UC-21]
  D --> PV[Pets vinculados UC-20]
  PV --> PP[Perfil do pet UC-22]
  PP --> LT[Linha do tempo UC-35]
  PP --> EX[Exames UC-36]
  PP --> AL[Alergias UC-37]
  D --> CH[Chat UC-43]
  D --> FN[Funcionários UC-19]
  FN --> PE[Perfis e permissões UC-16]
  D --> BI[Indicadores UC-17]
  D --> RE[Relatórios UC-18]
  D --> PG[Pagamentos recebidos UC-45]
  D --> PR[Privacidade UC-46]
```

Funcionários veem apenas os itens liberados pelo seu perfil (RN20).

## 5. Web de administração

```mermaid
flowchart LR
  L[Login UC-02] --> D((Painel admin))
  D --> MO[Monitoramento e logs UC-25]
  D --> SU[Chamados de suporte UC-26]
  D --> IN[Integrações UC-27]
  D --> CO[Contas de usuários UC-28]
  D --> PE[Permissões globais UC-29]
  D --> WH[Webhooks UC-30]
```

## 6. Inventário de telas

| Aplicação | Telas | Casos de uso cobertos |
|---|---|---|
| App do tutor | 31 | UC-01 a UC-15, UC-31, UC-33 a UC-37, UC-40, UC-42 a UC-46 |
| Web Enterprise | 20 | UC-02, UC-16 a UC-24, UC-32, UC-35 a UC-39, UC-41, UC-43, UC-45, UC-46 |
| Web de administração | 7 | UC-02, UC-25 a UC-30 |

Os 46 casos de uso têm pelo menos uma tela.
