# REQ-02 · Glossário

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | REQ-02 · Glossário do domínio |
| Versão | 1.0 |
| Status | Em revisão |
| Autores | Ricardo Guilhen |
| Data | 01/11/2026 |
| Tarefa Jira | JAG-60 |
| Padrão de referência | ISO/IEC/IEEE 29148 (definições) |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 1.0 | 01/11/2026 | Ricardo Guilhen | Termos usados nos requisitos, casos de uso e modelo de classes. |

## 1. Objetivo

Definir os termos do negócio com um único significado em todos os documentos. Entre parênteses, a classe correspondente no [modelo de classes (MOD-01)](../04-modelagem/MOD-01-modelo-de-classes.md).

## 2. Termos

| Termo | Definição |
|---|---|
| Administrador | Operador da plataforma Jaguara: gerencia contas, permissões globais, integrações, webhooks e suporte (`Administrador`). |
| Agendamento | Horário confirmado de um serviço para um pet, com profissional e recurso opcionais e preço contratado congelado (`Agendamento`). |
| Assinatura | Contratação de um plano pago pelo tutor (`Assinatura`). |
| Assistente virtual | Interlocutor automático do chat, baseado em inteligência artificial, disponível para assinantes do plano PANTERA. Orienta, mas não diagnostica. |
| Atendimento | Registro único do serviço efetivamente prestado ao pet: procedimentos, observações clínicas e itens cobrados (`Atendimento`). Substitui o antigo "registrar atendimento" (RF24). |
| Auditoria | Registro imutável de ações relevantes, com autor, data e detalhe (`LogAuditoria`). |
| Catálogo de serviços | Conjunto de serviços ativos que uma empresa oferece, com preço e duração (`Servico`). |
| Cliente | Tutor vinculado a uma empresa, com consentimento LGPD registrado (`Cliente`). |
| Compartilhamento | Autorização dada pelo tutor para que uma pessoa ou empresa veja partes do perfil do pet, delimitadas por escopos (`CompartilhamentoPet`). |
| Consentimento | Aceite ou revogação de um termo de uso ou de um tratamento de dados (`Consentimento`). |
| Empresa Enterprise | Pessoa jurídica do setor pet (clínica, pet shop, hotel, creche, casa de cuidado) que usa o módulo Enterprise (`EmpresaEnterprise`). Também chamada de usuário-empresa. |
| Escopo de acesso | Parte do perfil do pet que um compartilhamento libera: perfil básico, vacinas, exames, medicamentos, alergias, documentos, linha do tempo ou edição clínica (`EscopoAcesso`). |
| Evento | Compromisso no calendário do pet (consulta, vacina, banho etc.) (`EventoCalendario`). |
| Funcionário Enterprise | Pessoa vinculada a uma empresa, com acesso definido pelo perfil que a empresa atribui (`FuncionarioEnterprise`). Também chamado de usuário-funcionário. |
| Horário de atuação | Janela semanal em que um profissional ou um recurso está disponível para agendamentos (`HorarioAtuacao`). |
| Linha do tempo | Visão cronológica de tudo que aconteceu com o pet: registros clínicos, eventos e atendimentos. Não é armazenada; é uma consulta. |
| Memorial | Página de homenagem a um pet falecido (`Memorial`). |
| Notificação | Mensagem enviada por *push*, e-mail ou SMS a partir de um evento, tratamento, vacinação, agendamento ou solicitação (`Notificacao`). |
| Perfil de acesso | Conjunto nomeado de permissões. Perfis globais são mantidos pelo administrador; perfis de empresa, pela própria empresa (`PerfilAcesso`). |
| Pet | Animal de estimação acompanhado pela plataforma (`Pet`). |
| Plano PANTERA | Plano pago do tutor que libera o assistente virtual no chat ([ADR-010](../03-arquitetura/adr/ADR-010-decisoes-de-dominio.md)). |
| Plano alimentar | Meta e limite diário de alimentação definidos pelo tutor para um pet (`PlanoAlimentar`). |
| Preço contratado | Preço do serviço no momento do agendamento; não muda se a empresa alterar o catálogo (RN27). |
| Recurso | Sala, equipamento, baia ou veículo da empresa que pode ser reservado (`Recurso`). |
| Registro clínico | Vacinação, exame ou tratamento que compõe o histórico clínico do pet (`RegistroClinico`). |
| Responsável principal | Tutor com responsabilidade principal pelo pet; todo pet tem ao menos um (RN09, `ResponsavelPet`). |
| Responsável adicional | Tutor que compartilha os cuidados do pet sem ser o principal (`ResponsavelPet`). |
| Sessão | Período autenticado de um usuário em um dispositivo; expira após 4 horas de inatividade (RN04, `Sessao`). |
| Solicitação de serviço | Pedido de agendamento feito pelo tutor, que fica pendente até a empresa aceitar ou recusar (RN40, `SolicitacaoServico`). |
| Tutor | Dono ou responsável por pets; usuário principal do app mobile (`Tutor`). Também chamado de usuário-tutor. |
| Usuário | Qualquer conta da plataforma: tutor, empresa, funcionário ou administrador (`Usuario`). |
| Webhook | Endereço externo notificado automaticamente quando ocorrem eventos da plataforma (`Webhook`). |

## 3. Siglas

| Sigla | Significado |
|---|---|
| ADR | *Architecture Decision Record*, registro de decisão de arquitetura |
| BI | *Business Intelligence* |
| CDC | Código de Defesa do Consumidor (Lei nº 8.078/1990) |
| DER | Diagrama Entidade-Relacionamento |
| ERS | Especificação de Requisitos de Software |
| LGPD | Lei Geral de Proteção de Dados (Lei nº 13.709/2018) |
| MoSCoW | Priorização *Must, Should, Could, Won't* |
| MVP | *Minimum Viable Product*, produto mínimo viável |
| RBAC | *Role-Based Access Control*, controle de acesso baseado em papéis |
| RF, RN, RNF | Requisito funcional, regra de negócio, requisito não funcional |
| RIPD | Relatório de Impacto à Proteção de Dados Pessoais |
| UC, US, CT | Caso de uso, história de usuário, caso de teste |
