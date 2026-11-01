# REQ-01 · Especificação de Requisitos de Software (ERS)

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | REQ-01 · Especificação de Requisitos de Software |
| Versão | 3.0 |
| Status | Em revisão |
| Autores | Micaela Dorneles, Miguel Drozino, Nathan Rodrigues, Ricardo Guilhen |
| Data | 01/11/2026 |
| Tarefa Jira | JAG-5, JAG-17 (elaboração), JAG-58, JAG-59 (reestruturação) |
| Padrão de referência | ISO/IEC/IEEE 29148:2018; ISO/IEC 25010 para os requisitos não funcionais |
| Original | [REQ-01-documento-de-requisitos-original.pdf](../anexos/originais/REQ-01-documento-de-requisitos-original.pdf) |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 1.0 | 05/06/2026 | Equipe Jaguara | Escopo, atores, RF01 a RF32, RN01 a RN36 e RNF01 a RNF10. |
| 2.0 | 09/09/2026 | Equipe Jaguara | Requisitos adicionais RF33 a RF45 e RN37 a RN40 (JAG-5, JAG-17). |
| 3.0 | 01/11/2026 | Ricardo Guilhen | Reestruturação no modelo ISO/IEC/IEEE 29148: prioridades MoSCoW, ligação com casos de uso e RNF mensuráveis classificados pela ISO/IEC 25010. Texto dos RF e das RN mantido. |

## 1. Introdução

### 1.1 Propósito

Esta especificação descreve o que o Jaguara deve fazer (requisitos funcionais), as regras que restringem esse comportamento (regras de negócio) e as qualidades exigidas da solução (requisitos não funcionais). É a referência para a modelagem, a implementação e os testes da versão 1.0.

### 1.2 Escopo do produto

O Jaguara é uma plataforma web e mobile para o gerenciamento da rotina, da saúde e dos custos de animais de estimação. Os tutores controlam medicamentos, alimentação, vacinação, consultas, exames, cirurgias, banho e tosa, hospedagem, despesas e histórico médico, com calendário integrado, notificações automáticas e dashboards. A modalidade **Enterprise** atende clínicas veterinárias, pet shops, hotéis, creches e casas de cuidado animal com gestão de clientes e pets, catálogo de serviços, agenda, atendimentos, relatórios, BI, múltiplos usuários e permissões.

Fora do escopo da versão 1.0: venda de produtos (marketplace), integração com dispositivos inteligentes e recomendações clínicas automatizadas.

### 1.3 Definições

Os termos do domínio estão no [glossário (REQ-02)](REQ-02-glossario.md).

### 1.4 Referências

| ID | Documento |
|---|---|
| REF-01 | [GES-01 · Termo de Abertura](../01-gestao/GES-01-TAP.md) |
| REF-02 | [GES-08 · Pesquisa de mercado](../01-gestao/GES-08-pesquisa-de-mercado.md) (LGPD e CDC) |
| REF-03 | [REQ-04 · Especificação de casos de uso](REQ-04-especificacao-casos-de-uso.md) |
| REF-04 | ISO/IEC/IEEE 29148:2018, *Systems and software engineering: Life cycle processes, Requirements engineering* |
| REF-05 | ISO/IEC 25010:2023, *Product quality model* |
| REF-06 | Lei nº 13.709/2018 (LGPD) e Lei nº 8.078/1990 (CDC) |

## 2. Descrição geral

### 2.1 Perspectiva do produto

O Jaguara é um produto novo, composto por um aplicativo mobile (tutor), uma aplicação web (Enterprise e administração) e uma API compartilhada. Ele se integra a calendários externos, gateway de pagamento, serviços de e-mail e notificação *push* e a um provedor de inteligência artificial para o assistente virtual. A arquitetura está no [ARQ-01](../03-arquitetura/ARQ-01-arquitetura.md).

### 2.2 Classes de usuários

| Ator | Descrição | Canal principal |
|---|---|---|
| Tutor | Responsável pelo cadastro e gerenciamento de seus pets: informações médicas, alimentação, medicamentos, vacinação, calendário e controle financeiro | App mobile |
| Empresa Enterprise | Clínica veterinária, pet shop, hotel, creche ou casa de cuidado animal que gerencia clientes, pets, funcionários, atendimentos, serviços, agenda e relatórios | Web |
| Funcionário Enterprise | Usuário vinculado a uma empresa, que realiza atendimentos, atualiza informações dos pets e gerencia serviços conforme o perfil definido pela empresa | Web e app |
| Administrador | Responsável pela plataforma: usuários, monitoramento, permissões, suporte e integrações | Web |
| Sistema | Ator temporal que dispara notificações e rotinas agendadas | — |

### 2.3 Ambiente operacional

- App mobile para Android 10 ou superior e iOS 15 ou superior.
- Aplicação web para as duas versões mais recentes de Chrome, Edge, Firefox e Safari.
- API e banco de dados em nuvem, com acesso pela internet via HTTPS.

### 2.4 Restrições de projeto

- Linguagem principal TypeScript em todas as camadas ([ADR-004](../03-arquitetura/adr/ADR-004-stack-backend.md)).
- Banco de dados relacional PostgreSQL ([ADR-005](../03-arquitetura/adr/ADR-005-banco-de-dados.md)).
- Conformidade com a LGPD e o CDC.
- Orçamento de infraestrutura reduzido (risco R07 do [GES-05](../01-gestao/GES-05-registro-de-riscos.md)).

### 2.5 Premissas e dependências

- Os usuários têm dispositivo compatível e acesso à internet.
- Os serviços externos (pagamento, calendário, e-mail, *push*, IA) oferecem ambiente de testes (*sandbox*).
- Espécies, raças e categorias de despesa são cadastradas previamente pela administração.
- O conteúdo clínico é validado por veterinário parceiro (risco R01).

## 3. Requisitos funcionais

Prioridade MoSCoW: **Must** (indispensável na v1.0), **Should** (importante, entra se houver capacidade), **Could** (desejável, pode ficar para versão posterior).

| ID | Requisito | Descrição | Atores | Regras | Casos de uso | Prioridade |
|---|---|---|---|---|---|---|
| RF01 | Cadastro de usuário | Permite o cadastro de novos usuários na plataforma | Tutor, Empresa, Administrador | RN01, RN02 | UC-01, UC-32 | Must |
| RF02 | Autenticação de usuário | Permite acessar a plataforma com login e senha | Todos | RN03, RN04 | UC-02 | Must |
| RF03 | Recuperação de senha | Permite redefinir a senha pelo e-mail cadastrado | Todos | RN05, RN06 | UC-03 | Must |
| RF04 | Gerenciar pet | Permite cadastrar, editar, arquivar e remover pets; empresas e funcionários têm acesso parcial a dados operacionais e clínicos autorizados | Tutor (Empresa, Funcionário parcial) | RN07, RN08, RN30 | UC-04 | Must |
| RF05 | Vincular responsável ao pet | Permite associar responsáveis adicionais ao pet | Tutor | RN09 | UC-05 | Should |
| RF06 | Controlar despesas | Permite registrar despesas relacionadas ao pet | Tutor | RN10 | UC-06 | Should |
| RF07 | Emitir relatório de despesas | Permite gerar relatórios financeiros | Tutor | RN11 | UC-07 | Should |
| RF08 | Registrar alimentação | Permite registrar refeições e plano alimentar do pet | Tutor | RN12 | UC-08 | Should |
| RF09 | Sincronizar calendário externo | Permite integração com calendários externos | Tutor | RN13 | UC-09 | Could |
| RF10 | Gerenciar calendário | Permite cadastrar eventos, consultas e compromissos | Tutor | RN14 | UC-10 | Must |
| RF11 | Compartilhar perfil do pet | Permite compartilhar informações do pet com terceiros | Tutor | RN15 | UC-11 | Should |
| RF12 | Visualizar vacinação | Permite consultar o histórico vacinal do pet | Tutor | RN16 | UC-12 | Must |
| RF13 | Cadastrar vacinação | Permite registrar vacinas aplicadas | Tutor | RN17 | UC-13 | Must |
| RF14 | Gerenciar medicamentos | Permite cadastrar e acompanhar tratamentos medicamentosos | Tutor | RN18 | UC-14 | Must |
| RF15 | Gerenciar memorial do pet | Permite criar homenagens e registrar memórias do pet | Tutor | RN19 | UC-15 | Could |
| RF16 | Gerenciar permissões | Permite controlar permissões dos funcionários da empresa | Empresa | RN20 | UC-16 | Must |
| RF17 | Emitir BI | Permite visualizar indicadores e análises gerenciais | Empresa | RN21 | UC-17 | Could |
| RF18 | Emitir relatórios | Permite gerar relatórios operacionais e administrativos | Empresa | RN22 | UC-18 | Should |
| RF19 | Gerenciar funcionários | Permite cadastrar, editar e remover funcionários | Empresa | RN23 | UC-19 | Must |
| RF20 | Consultar pets vinculados | Permite consultar informações dos pets atendidos pela empresa | Empresa, Funcionário | RN24 | UC-20 | Should |
| RF21 | Gerenciar clientes | Permite cadastrar e atualizar informações dos clientes | Empresa, Funcionário | RN25 | UC-21 | Should |
| RF22 | Visualizar perfil do pet | Permite acessar o perfil e o histórico do pet | Empresa, Funcionário | RN26 | UC-22 | Should |
| RF23 | Registrar serviços e atendimentos | Permite registrar, em um único registro, os serviços realizados, os procedimentos executados e as observações clínicas | Empresa, Funcionário | RN27, RN28 | UC-23 | Must |
| RF24 | Registrar atendimentos | Descontinuado; incorporado ao RF23 | — | — | — | — |
| RF25 | Controlar agenda | Permite gerenciar horários e disponibilidade dos profissionais | Empresa, Funcionário | RN29 | UC-24 | Must |
| RF26 | Monitorar desempenho e logs | Permite acompanhar métricas e registros do sistema | Administrador | RN31 | UC-25 | Could |
| RF27 | Prestar suporte operacional | Permite auxiliar usuários e resolver incidentes | Administrador | RN32 | UC-26 | Could |
| RF28 | Gerenciar integrações | Permite configurar integrações externas | Administrador | RN33 | UC-27 | Could |
| RF29 | Gerenciar contas de usuários | Permite bloquear, suspender ou reativar contas | Administrador | RN34 | UC-28 | Should |
| RF30 | Gerenciar permissões globais | Permite administrar perfis e níveis de acesso da plataforma | Administrador | RN35 | UC-29 | Should |
| RF31 | Gerenciar webhooks | Permite configurar eventos e integrações baseadas em notificações | Administrador | RN36 | UC-30 | Could |
| RF32 | Disparar notificações automáticas | Envia notificações de eventos agendados, medicamentos, vacinas e demais atividades | Sistema | RN37 | UC-31 | Must |
| RF33 | Gerenciar documentos do pet | Permite cadastrar, consultar, atualizar e gerenciar documentos do pet | Tutor | RN15, RN25, RN26, RN31 | UC-34 | Should |
| RF34 | Consultar linha do tempo do pet | Permite consultar a linha do tempo e o histórico de eventos do pet | Tutor, Empresa autorizada | RN15, RN24, RN26, RN30, RN31 | UC-35 | Should |
| RF35 | Gerenciar exames do pet | Permite cadastrar, consultar e gerenciar exames do pet | Tutor, Empresa autorizada | RN15, RN24, RN25, RN26, RN30, RN31 | UC-36 | Should |
| RF36 | Gerenciar alergias e restrições | Permite cadastrar, consultar e gerenciar alergias e restrições do pet | Tutor, Empresa autorizada | RN15, RN24, RN25, RN26, RN30, RN31 | UC-37 | Should |
| RF37 | Gerenciar catálogo de serviços | Permite cadastrar, consultar, alterar e gerenciar os serviços oferecidos | Empresa | RN20, RN27, RN31 | UC-38 | Must |
| RF38 | Agendar serviço (empresa) | Permite agendar serviços para pets autorizados | Empresa | RN14, RN20, RN24, RN29, RN37 | UC-39 | Must |
| RF39 | Solicitar agendamento de serviço (tutor) | Permite ao tutor ver o catálogo das empresas e solicitar agendamento | Tutor | RN14, RN29, RN37, RN40 | UC-33, UC-40 | Must |
| RF40 | Gerenciar solicitações de serviço | Permite à empresa consultar, aceitar, atualizar, recusar e acompanhar solicitações | Empresa | RN20, RN24, RN31, RN38, RN40 | UC-41 | Must |
| RF41 | Consultar e acompanhar solicitações | Permite ao tutor consultar o status e o andamento de suas solicitações | Tutor | RN22, RN31, RN38 | UC-42 | Must |
| RF42 | Conversar em chat na plataforma | Permite a comunicação entre tutores e empresas e com o assistente virtual ([ADR-010](../03-arquitetura/adr/ADR-010-decisoes-de-dominio.md)) | Tutor, Empresa | RN25, RN31 | UC-43 | Could |
| RF43 | Realizar pagamento | Permite ao tutor pagar os serviços contratados | Tutor | RN25, RN31, RN39 | UC-44 | Should |
| RF44 | Gerenciar pagamentos | Permite consultar e gerenciar pagamentos realizados e recebidos | Tutor, Empresa | RN22, RN25, RN31, RN39 | UC-45 | Should |
| RF45 | Gerenciar privacidade e consentimentos | Permite gerenciar consentimentos, compartilhamentos e solicitações de privacidade, incluindo exclusão | Tutor, Empresa | RN15, RN25, RN26, RN31 | UC-46 | Must |

A especificação detalhada de cada requisito está no caso de uso correspondente do [REQ-04](REQ-04-especificacao-casos-de-uso.md). As prioridades são uma proposta da padronização e devem ser confirmadas pelo *Product Owner* no planejamento.

## 4. Regras de negócio

| ID | Regra | Descrição |
|---|---|---|
| RN01 | Unicidade de cadastro | CPF (tutor) e CNPJ (empresa) devem ser únicos no sistema |
| RN02 | Ativação de conta | O cadastro só é ativado após a confirmação do e-mail informado |
| RN03 | Bloqueio por tentativas de login | Após 5 tentativas consecutivas sem sucesso, a conta é bloqueada por 5 minutos |
| RN04 | Expiração de sessão | A sessão é encerrada após 4 horas de inatividade |
| RN05 | Validade do link de recuperação | O link de redefinição de senha vale no máximo 2 horas |
| RN06 | Reutilização de senhas | A nova senha não pode ser igual a nenhuma das três últimas |
| RN07 | Cadastro de espécies e raças | Espécie e raça são escolhidas de uma lista previamente cadastrada |
| RN08 | Exclusão de pets | Pets com histórico clínico ou financeiro não podem ser excluídos, apenas arquivados |
| RN09 | Responsável principal | Todo pet tem pelo menos um responsável principal |
| RN10 | Classificação de despesas | Toda despesa tem uma categoria previamente definida |
| RN11 | Exportação de relatórios | Relatórios financeiros podem ser exportados em PDF |
| RN12 | Controle alimentar | O tutor pode definir metas e limites diários de alimentação para cada pet |
| RN13 | Sincronização de calendários | Só calendários previamente autorizados pelo usuário são sincronizados |
| RN14 | Conflito de agendamentos | O sistema impede agendamentos conflitantes para o mesmo pet, profissional ou recurso |
| RN15 | Compartilhamento de perfil | As informações compartilhadas respeitam as permissões definidas pelo tutor |
| RN16 | Consulta de vacinação | Só registros de vacinação válidos e vinculados ao pet são exibidos |
| RN17 | Registro de vacinação | Toda vacinação tem data de aplicação e identificação do responsável pela aplicação |
| RN18 | Controle de medicamentos | Medicamentos ativos geram lembretes automáticos para os responsáveis do pet |
| RN19 | Memorial do pet | O memorial só é habilitado para pets com status "Falecido" |
| RN20 | Permissões empresariais | As permissões dos funcionários seguem os perfis definidos pela empresa |
| RN21 | Acesso ao BI | A empresa vê apenas informações da sua própria operação |
| RN22 | Acesso a relatórios | Os relatórios respeitam o nível de permissão do usuário autenticado |
| RN23 | Desligamento de funcionários | Ao remover um funcionário, todos os seus acessos ativos são revogados imediatamente |
| RN24 | Consulta de pets vinculados | Funcionários e empresas só veem pets vinculados a atendimentos ou relacionamentos autorizados |
| RN25 | Proteção de dados de clientes | Os dados dos clientes seguem as diretrizes da LGPD |
| RN26 | Acesso ao perfil do pet | Só usuários autorizados veem o perfil completo do pet |
| RN27 | Alteração de serviços | Mudanças de preço não afetam serviços já contratados |
| RN28 | Integridade dos atendimentos | Atendimentos finalizados só são alterados com processo de auditoria |
| RN29 | Controle de agenda | Não há agendamento simultâneo de um mesmo profissional, recurso ou pet |
| RN30 | Gerenciamento compartilhado de pets | Funcionários e empresas atualizam apenas informações operacionais e clínicas autorizadas; alterações cadastrais críticas são do tutor |
| RN31 | Monitoramento e auditoria | Logs críticos são armazenados para auditoria |
| RN32 | Registro de suporte | Toda ação da equipe de suporte é registrada |
| RN33 | Gerenciamento de integrações | Só administradores autorizados configuram integrações externas |
| RN34 | Administração de usuários | Toda suspensão, bloqueio ou reativação de conta é registrada |
| RN35 | Atualização de permissões globais | Alterações nas permissões globais valem imediatamente após a confirmação |
| RN36 | Segurança de webhooks | Webhooks usam autenticação e comunicação segura |
| RN37 | Notificações programadas | Notificações automáticas têm antecedência configurável para compromissos, medicamentos e atividades do pet |
| RN38 | Ciclo das solicitações | Toda solicitação de serviço tem status e histórico de alterações até a conclusão, o cancelamento ou o encerramento |
| RN39 | Integridade das transações financeiras | Toda transação registra valor, data, status (pendente, aceito, cancelado, recusado) e identificação da operação, e só é concluída com a confirmação do processamento |
| RN40 | Confirmação de agendamento pela empresa | O tutor escolhe um horário disponível; a empresa confirma ou recusa; o horário só é confirmado após a aprovação, e o tutor é notificado da decisão |

As restrições de integridade correspondentes no modelo de classes estão no [MOD-01](../04-modelagem/MOD-01-modelo-de-classes.md), seção 9.

## 5. Requisitos não funcionais

Os RNF originais (RNF01 a RNF10) foram mantidos e cada um recebeu métricas verificáveis, classificadas pela ISO/IEC 25010. Os valores-alvo são uma proposta da padronização, dimensionada para a v1.0 e para o orçamento do projeto; devem ser validados pelo time.

| ID | Característica (ISO 25010) | Requisito | Métrica e valor-alvo | Como medir |
|---|---|---|---|---|
| RNF01 | Segurança | O sistema protege as informações de usuários e empresas | Todo tráfego em HTTPS (TLS 1.2 ou superior); senhas com hash Argon2id; 100% dos endpoints com autenticação e autorização por perfil, exceto cadastro, login e recuperação; nenhuma vulnerabilidade crítica ou alta aberta no release | Varredura OWASP ZAP *baseline* e `npm audit` na CI; testes de autorização por perfil |
| RNF02 | Confiabilidade (disponibilidade) | O sistema permanece disponível na maior parte do tempo | Disponibilidade mensal ≥ 99,0% (indisponibilidade ≤ 7 h 18 min por mês) | Monitor externo de *health check* a cada 1 minuto |
| RNF03 | Eficiência de desempenho | O sistema responde rapidamente | API: p95 ≤ 500 ms em leituras e ≤ 1 s em escritas com 100 usuários simultâneos; web: LCP ≤ 2,5 s; app: abertura a frio ≤ 3 s | Teste de carga com k6; Lighthouse; medição no dispositivo de referência |
| RNF04 | Compatibilidade e portabilidade | O sistema funciona em diferentes dispositivos e navegadores | Android 10+ e iOS 15+; duas últimas versões de Chrome, Edge, Firefox e Safari; layout responsivo de 360 px a 1920 px | Matriz de testes de interface por dispositivo e navegador |
| RNF05 | Eficiência (capacidade) e manutenibilidade | O sistema suporta o crescimento de usuários e funcionalidades | Suporta 10.000 tutores, 500 empresas e 200 usuários simultâneos mantendo o RNF03; API sem estado, escalável horizontalmente | Teste de carga com volume sintético; revisão de arquitetura |
| RNF06 | Usabilidade | Interface intuitiva e de fácil utilização | SUS ≥ 70 com pelo menos 5 usuários; tarefas principais em até 3 toques a partir da tela inicial; conformidade WCAG 2.2 nível AA | Teste de usabilidade com tutores; auditoria de acessibilidade |
| RNF07 | Confiabilidade (recuperabilidade) | Backup automático e recuperação em caso de falha | Backup completo diário com retenção de 30 dias; RPO ≤ 24 h; RTO ≤ 4 h; teste de restauração mensal | Registro dos backups e dos testes de restauração |
| RNF08 | Eficiência (comportamento no tempo) | Informações sincronizadas entre dispositivos em tempo real | Alterações refletidas nos outros dispositivos conectados em ≤ 2 s (p95); mensagens de chat entregues em ≤ 1 s | Teste automatizado com dois clientes conectados |
| RNF09 | Manutenibilidade | Arquitetura que facilite manutenção e evolução | Cobertura de testes ≥ 70% nas regras de negócio; lint e build sem erros na CI; complexidade ciclomática ≤ 10 por função; todo código revisado por pull request | Relatório de cobertura e análise estática na CI |
| RNF10 | Compatibilidade (interoperabilidade) | Integração com serviços externos | API documentada em OpenAPI 3.1; cada integração atrás de um adaptador próprio; webhooks assinados com HMAC-SHA256 e até 5 tentativas com espera exponencial | Validação do `openapi.yaml` na CI; testes de contrato dos adaptadores |

A forma como a arquitetura atende a cada RNF está no [ARQ-01](../03-arquitetura/ARQ-01-arquitetura.md), seção 10.

## 6. Interfaces externas

| Interface | Finalidade | Requisitos |
|---|---|---|
| Calendários externos (Google Calendar, Microsoft Outlook) | Sincronização de eventos | RF09 |
| Gateway de pagamento | Cobrança por PIX, cartão e boleto | RF43, RF44 |
| Serviço de e-mail transacional | Confirmação de conta, recuperação de senha, notificações | RF01, RF03, RF32 |
| Serviço de notificação *push* | Lembretes no app | RF32 |
| Provedor de inteligência artificial | Assistente virtual do chat | RF42 |
| Webhooks de saída | Eventos para sistemas parceiros | RF31 |

Detalhes no [ARQ-03](../03-arquitetura/ARQ-03-integracoes.md).

## 7. Verificação

Cada RF é verificado pelos casos de teste das histórias correspondentes ([TST-02](../05-testes/TST-02-casos-de-teste.md)); cada RNF, pelo método da tabela da seção 5. A matriz completa está no [REQ-06](REQ-06-matriz-de-rastreabilidade.md).

## Questões em aberto

| ID | Questão | Encaminhamento |
|---|---|---|
| QA-01 | Confirmação das prioridades MoSCoW | *Product Owner* no planejamento da Sprint 7 |
| QA-02 | Validação dos valores-alvo dos RNF | Time, na revisão deste documento |
