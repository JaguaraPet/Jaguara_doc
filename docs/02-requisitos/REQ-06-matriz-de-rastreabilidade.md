# REQ-06 · Matriz de rastreabilidade

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | REQ-06 · Matriz de rastreabilidade |
| Versão | 1.0 |
| Status | Em revisão |
| Autores | Micaela Dorneles, Miguel Drozino, Nathan Rodrigues, Ricardo Guilhen |
| Data | 01/11/2026 |
| Tarefa Jira | JAG-64 |
| Padrão de referência | ISO/IEC/IEEE 29148, rastreabilidade bidirecional |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 1.0 | 01/11/2026 | Ricardo Guilhen | Matriz inicial ligando RF, RN, UC, US, classes e casos de teste. |

## 1. Objetivo

Garantir que todo requisito tenha caso de uso, história, classes e testes, e que todo artefato de projeto ou de teste aponte para um requisito. A matriz é atualizada sempre que um desses itens muda ([DoD da documentação](../_modelos/DoD-documentacao.md)).

## 2. Requisito → artefatos

| RF | Requisito | Regras | Casos de uso | Histórias | Classes (MOD-01) | Casos de teste |
|---|---|---|---|---|---|---|
| RF01 | Cadastro de usuário | RN01, RN02 | UC-01, UC-32 | US-01, US-32 | EmpresaEnterprise, Endereco, TokenAcesso; Usuario, Tutor, TokenAcesso | CT-01-01, CT-01-02, CT-32-01, CT-32-02 |
| RF02 | Autenticação de usuário | RN03, RN04 | UC-02 | US-02 | Usuario, Sessao | CT-02-01, CT-02-02 |
| RF03 | Recuperação de senha | RN05, RN06 | UC-03 | US-03 | Usuario, TokenAcesso, HistoricoSenha | CT-03-01, CT-03-02 |
| RF04 | Gerenciar pet | RN07, RN08, RN30 | UC-04 | US-04 | Pet, Especie, Raca, ResponsavelPet | CT-04-01, CT-04-02 |
| RF05 | Vincular responsável ao pet | RN09 | UC-05 | US-05 | Pet, Tutor, ResponsavelPet | CT-05-01, CT-05-02 |
| RF06 | Controlar despesas | RN10 | UC-06 | US-06 | Despesa, CategoriaDespesa, Pet | CT-06-01, CT-06-02 |
| RF07 | Emitir relatório de despesas | RN11 | UC-07 | US-07 | Relatorio, Despesa | CT-07-01, CT-07-02 |
| RF08 | Registrar alimentação | RN12 | UC-08 | US-08 | PlanoAlimentar, RegistroAlimentacao | CT-08-01, CT-08-02 |
| RF09 | Sincronizar calendário externo | RN13 | UC-09 | US-09 | CalendarioExterno, EventoCalendario | CT-09-01, CT-09-02 |
| RF10 | Gerenciar calendário | RN14 | UC-10 | US-10 | EventoCalendario, Notificacao | CT-10-01, CT-10-02 |
| RF11 | Compartilhar perfil do pet | RN15 | UC-11 | US-11 | CompartilhamentoPet | CT-11-01, CT-11-02 |
| RF12 | Visualizar vacinação | RN16 | UC-12 | US-12 | Vacinacao | CT-12-01, CT-12-02 |
| RF13 | Cadastrar vacinação | RN17 | UC-13 | US-13 | Vacinacao, Notificacao | CT-13-01, CT-13-02 |
| RF14 | Gerenciar medicamentos | RN18 | UC-14 | US-14 | TratamentoMedicamentoso, Notificacao | CT-14-01, CT-14-02 |
| RF15 | Gerenciar memorial do pet | RN19 | UC-15 | US-15 | Memorial, ItemMemorial, Pet | CT-15-01, CT-15-02 |
| RF16 | Gerenciar permissões | RN20 | UC-16 | US-16 | PerfilAcesso, Permissao, FuncionarioEnterprise | CT-16-01, CT-16-02 |
| RF17 | Emitir BI | RN21 | UC-17 | US-17 | Agendamento, Atendimento, Pagamento | CT-17-01, CT-17-02 |
| RF18 | Emitir relatórios | RN22 | UC-18 | US-18 | Relatorio | CT-18-01, CT-18-02 |
| RF19 | Gerenciar funcionários | RN23 | UC-19 | US-19 | FuncionarioEnterprise, PerfilAcesso, Sessao | CT-19-01, CT-19-02 |
| RF20 | Consultar pets vinculados | RN24 | UC-20 | US-20 | Pet, CompartilhamentoPet, Agendamento | CT-20-01, CT-20-02 |
| RF21 | Gerenciar clientes | RN25 | UC-21 | US-21 | Cliente, Tutor | CT-21-01, CT-21-02 |
| RF22 | Visualizar perfil do pet | RN26 | UC-22 | US-22 | Pet, CompartilhamentoPet | CT-22-01, CT-22-02 |
| RF23 | Registrar serviços e atendimentos | RN27, RN28 | UC-23 | US-23 | Atendimento, ItemAtendimento, Agendamento, Servico | CT-23-01, CT-23-02 |
| RF24 | Registrar atendimentos (descontinuado, incorporado ao RF23) | – | UC-23 | US-23 | – | – |
| RF25 | Controlar agenda | RN29 | UC-24 | US-24 | Agendamento, HorarioAtuacao, Recurso, FuncionarioEnterprise | CT-24-01, CT-24-02 |
| RF26 | Monitorar desempenho e logs | RN31 | UC-25 | US-25 | LogAuditoria | CT-25-01, CT-25-02 |
| RF27 | Prestar suporte operacional | RN32 | UC-26 | US-26 | ChamadoSuporte, IntervencaoSuporte, LogAuditoria | CT-26-01, CT-26-02 |
| RF28 | Gerenciar integrações | RN33 | UC-27 | US-27 | Integracao | CT-27-01, CT-27-02 |
| RF29 | Gerenciar contas de usuários | RN34 | UC-28 | US-28 | Usuario, LogAuditoria | CT-28-01, CT-28-02 |
| RF30 | Gerenciar permissões globais | RN35 | UC-29 | US-29 | PerfilAcesso, Permissao | CT-29-01, CT-29-02 |
| RF31 | Gerenciar webhooks | RN36 | UC-30 | US-30 | Webhook, Integracao | CT-30-01, CT-30-02 |
| RF32 | Disparar notificações automáticas | RN37 | UC-31 | US-31 | Notificacao, ConfiguracaoNotificacao, Notificavel | CT-31-01, CT-31-02 |
| RF33 | Gerenciar documentos do pet | RN15, RN25, RN26, RN31 | UC-34 | US-34 | DocumentoPet | CT-34-01, CT-34-02 |
| RF34 | Consultar linha do tempo do pet | RN15, RN24, RN26, RN30, RN31 | UC-35 | US-35 | RegistroClinico, EventoCalendario, Atendimento | CT-35-01, CT-35-02 |
| RF35 | Gerenciar exames do pet | RN15, RN24, RN25, RN26, RN30, RN31 | UC-36 | US-36 | Exame | CT-36-01, CT-36-02 |
| RF36 | Gerenciar alergias e restrições | RN15, RN24, RN25, RN26, RN30, RN31 | UC-37 | US-37 | AlergiaRestricao | CT-37-01, CT-37-02 |
| RF37 | Gerenciar catálogo de serviços | RN20, RN27, RN31 | UC-38 | US-38 | Servico | CT-38-01, CT-38-02 |
| RF38 | Agendar serviço (empresa) | RN14, RN20, RN24, RN29, RN37 | UC-39 | US-39 | Agendamento, EventoCalendario, Notificacao | CT-39-01, CT-39-02 |
| RF39 | Solicitar agendamento de serviço (tutor) | RN14, RN29, RN37, RN40 | UC-33, UC-40 | US-33, US-40 | Servico, EmpresaEnterprise; SolicitacaoServico, HistoricoSolicitacao, Servico, Pet | CT-33-01, CT-33-02, CT-40-01, CT-40-02 |
| RF40 | Gerenciar solicitações de serviço | RN20, RN24, RN31, RN38, RN40 | UC-41 | US-41 | SolicitacaoServico, Agendamento, HistoricoSolicitacao | CT-41-01, CT-41-02 |
| RF41 | Consultar e acompanhar solicitações | RN22, RN31, RN38 | UC-42 | US-42 | SolicitacaoServico, HistoricoSolicitacao | CT-42-01, CT-42-02 |
| RF42 | Conversar em chat na plataforma | RN25, RN31 | UC-43 | US-43 | Conversa, Mensagem, Assinatura | CT-43-01, CT-43-02 |
| RF43 | Realizar pagamento | RN25, RN31, RN39 | UC-44 | US-44 | Pagamento | CT-44-01, CT-44-02 |
| RF44 | Gerenciar pagamentos | RN22, RN25, RN31, RN39 | UC-45 | US-45 | Pagamento, SolicitacaoReembolso | CT-45-01, CT-45-02 |
| RF45 | Gerenciar privacidade e consentimentos | RN15, RN25, RN26, RN31 | UC-46 | US-46 | Consentimento, TermoUso, SolicitacaoPrivacidade | CT-46-01, CT-46-02 |

## 3. Regra de negócio → casos de uso

| Regra | Casos de uso que a aplicam |
|---|---|
| RN01 | UC-01, UC-32 |
| RN02 | UC-01, UC-19, UC-32 |
| RN03 | UC-02 |
| RN04 | UC-02 |
| RN05 | UC-03 |
| RN06 | UC-03 |
| RN07 | UC-04 |
| RN08 | UC-04 |
| RN09 | UC-05 |
| RN10 | UC-06 |
| RN11 | UC-07 |
| RN12 | UC-08 |
| RN13 | UC-09 |
| RN14 | UC-10, UC-24, UC-33, UC-39, UC-40 |
| RN15 | UC-11, UC-34, UC-35, UC-36, UC-37, UC-46 |
| RN16 | UC-12 |
| RN17 | UC-13 |
| RN18 | UC-14 |
| RN19 | UC-15 |
| RN20 | UC-16, UC-19, UC-23, UC-24, UC-38, UC-39, UC-41 |
| RN21 | UC-17 |
| RN22 | UC-18, UC-42, UC-45 |
| RN23 | UC-16, UC-19 |
| RN24 | UC-20, UC-35, UC-36, UC-37, UC-39, UC-41 |
| RN25 | UC-21, UC-34, UC-36, UC-37, UC-43, UC-44, UC-45, UC-46 |
| RN26 | UC-22, UC-23, UC-34, UC-35, UC-36, UC-37, UC-46 |
| RN27 | UC-23, UC-33, UC-38 |
| RN28 | UC-23 |
| RN29 | UC-24, UC-33, UC-39, UC-40 |
| RN30 | UC-04, UC-23, UC-35, UC-36, UC-37 |
| RN31 | UC-25, UC-34, UC-35, UC-36, UC-37, UC-38, UC-41, UC-42, UC-43, UC-44, UC-45, UC-46 |
| RN32 | UC-26 |
| RN33 | UC-27 |
| RN34 | UC-28 |
| RN35 | UC-29 |
| RN36 | UC-30 |
| RN37 | UC-31, UC-33, UC-39, UC-40 |
| RN38 | UC-24, UC-40, UC-41, UC-42 |
| RN39 | UC-44, UC-45 |
| RN40 | UC-33, UC-40, UC-41 |

## 4. Verificações

- Todo RF ativo (RF01 a RF45, exceto o RF24 descontinuado) tem ao menos um caso de uso, uma história e dois casos de teste.
- Toda regra de negócio (RN01 a RN40) é aplicada por ao menos um caso de uso.
- RF17 (BI) e RF34 (linha do tempo) são consultas sobre classes existentes e não têm classe própria ([MOD-01](../04-modelagem/MOD-01-modelo-de-classes.md), seção 10).
- A rastreabilidade de requisitos não funcionais para decisões de arquitetura está no [ARQ-01](../03-arquitetura/ARQ-01-arquitetura.md), seção 10.
