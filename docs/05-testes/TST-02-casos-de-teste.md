# TST-02 · Casos de teste

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | TST-02 · Casos de teste |
| Versão | 1.0 |
| Status | Em revisão |
| Autores | Micaela Dorneles, Miguel Drozino, Nathan Rodrigues, Ricardo Guilhen |
| Data | 01/11/2026 |
| Tarefa Jira | JAG-73 |
| Padrão de referência | ISO/IEC/IEEE 29119-3, especificação de casos de teste |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 1.0 | 01/11/2026 | Ricardo Guilhen | Casos de teste derivados dos cenários Gherkin do REQ-05. |

## 1. Objetivo

Especificar os casos de teste de sistema e de aceitação do Jaguara. Cada caso deriva de um cenário Gherkin do [REQ-05](../02-requisitos/REQ-05-historias-de-usuario.md); a estratégia e os critérios de entrada e saída estão no [TST-01](TST-01-plano-de-testes.md).

## 2. Convenções

- `CT-nn-01` é o cenário de sucesso da história `US-nn`; `CT-nn-02` é o cenário de exceção.
- **Prioridade** herda a prioridade MoSCoW do requisito: casos *Must* entram na regressão de toda sprint.
- **Nível:** sistema (API e interface integradas); os mesmos cenários são automatizados em testes de API (Jest + Supertest) e, nos fluxos críticos, em testes de ponta a ponta.
- O resultado de cada execução é registrado no [TST-03](TST-03-relatorio-de-testes.md).

## 3. Casos de teste

| ID | História | Regra | Prioridade | Tipo | Pré-condição | Ação | Resultado esperado |
|---|---|---|---|---|---|---|---|
| CT-01-01 | US-01 | RN01 | Must | Positivo | Não existe conta com o cpf informado | O visitante informa os dados obrigatórios e confirma o e-mail recebido | A conta do tutor fica com status ativa |
| CT-01-02 | US-01 | RN01 | Must | Negativo | Já existe um tutor com o cpf informado | O visitante tenta concluir o cadastro | O sistema recusa o cadastro e informa que o cpf já está em uso |
| CT-02-01 | US-02 | RN03 | Must | Positivo | O usuário possui conta ativa | Informa e-mail e senha corretos | O sistema cria a sessão e exibe a tela inicial do perfil do usuário |
| CT-02-02 | US-02 | RN03 | Must | Negativo | O usuário errou a senha quatro vezes seguidas | Informa a senha errada pela quinta vez | A conta fica bloqueada por 5 minutos |
| CT-03-01 | US-03 | RN05 | Must | Positivo | O usuário recebeu o link de recuperação há menos de 2 horas | Define uma senha diferente das três últimas | A nova senha passa a valer e o link deixa de funcionar |
| CT-03-02 | US-03 | RN05 | Must | Negativo | O link de recuperação foi emitido há mais de 2 horas | O usuário tenta redefinir a senha | O sistema recusa e orienta a solicitar um novo link |
| CT-04-01 | US-04 | RN07 | Must | Positivo | O tutor está autenticado | Cadastra um pet escolhendo espécie e raça da lista | O pet é criado com o tutor como responsável principal |
| CT-04-02 | US-04 | RN08 | Must | Negativo | O pet possui vacinação registrada | O tutor solicita a exclusão definitiva | O sistema impede a exclusão e oferece o arquivamento |
| CT-05-01 | US-05 | RN09 | Should | Positivo | O pet tem um responsável principal | O tutor adiciona outro tutor cadastrado como responsável adicional | O novo vínculo fica ativo e o convidado passa a ver o pet |
| CT-05-02 | US-05 | RN09 | Should | Negativo | O pet tem um único responsável principal | Esse responsável tenta remover o próprio vínculo | O sistema impede a remoção |
| CT-06-01 | US-06 | RN10 | Should | Positivo | O tutor tem um pet cadastrado | Registra valor, data e categoria da despesa | A despesa aparece no histórico financeiro do pet |
| CT-06-02 | US-06 | RN10 | Should | Negativo | O tutor está no cadastro de despesa | Tenta salvar sem informar a categoria | O sistema não salva e pede a categoria |
| CT-07-01 | US-07 | RN11 | Should | Positivo | O pet tem despesas no período escolhido | O tutor gera o relatório e escolhe exportar em pdf | O sistema gera um pdf com as despesas e o total por categoria |
| CT-07-02 | US-07 | RN11 | Should | Negativo | O pet não tem despesas no período escolhido | O tutor gera o relatório | O sistema informa que não há dados para o período |
| CT-08-01 | US-08 | RN12 | Should | Positivo | O pet tem plano com limite diário de 300 g e nenhum consumo no dia | O tutor registra uma refeição de 200 g | A refeição é registrada e o consumo do dia passa a ser 200 g |
| CT-08-02 | US-08 | RN12 | Should | Negativo | O pet já consumiu 250 g de um limite diário de 300 g | O tutor registra uma refeição de 100 g | A refeição é registrada e o sistema alerta que o limite foi excedido |
| CT-09-01 | US-09 | RN13 | Could | Positivo | O tutor tem conta google | Autoriza o acesso ao calendário externo | Os eventos são sincronizados com o calendário do aplicativo |
| CT-09-02 | US-09 | RN13 | Could | Negativo | O tutor iniciou a sincronização | Nega o acesso no provedor do calendário | A sincronização é cancelada e nada é importado |
| CT-10-01 | US-10 | RN14 | Must | Positivo | O pet não tem compromisso às 10h de sábado | O tutor cria uma consulta para esse horário | O evento é criado e o lembrete é agendado |
| CT-10-02 | US-10 | RN14 | Must | Negativo | O pet já tem um compromisso às 10h de sábado | O tutor cria outro evento no mesmo horário | O sistema impede o cadastro por conflito de agenda |
| CT-11-01 | US-11 | RN15 | Should | Positivo | O tutor está no perfil do pet | Compartilha apenas vacinas e alergias com um e-mail | O destinatário recebe acesso somente a vacinas e alergias |
| CT-11-02 | US-11 | RN15 | Should | Negativo | Um compartilhamento libera apenas vacinas | O destinatário tenta abrir os exames do pet | O sistema nega o acesso |
| CT-12-01 | US-12 | RN16 | Must | Positivo | O pet tem três vacinações válidas | O tutor abre o histórico de vacinação | O sistema lista as três vacinações em ordem de aplicação |
| CT-12-02 | US-12 | RN16 | Must | Negativo | Uma das vacinações foi marcada como inválida | O tutor abre o histórico de vacinação | A vacinação inválida não é exibida |
| CT-13-01 | US-13 | RN17 | Must | Positivo | O tutor está no cadastro de vacinação | Informa vacina, data de aplicação, responsável e próxima dose | A vacinação é registrada e o lembrete da próxima dose é agendado |
| CT-13-02 | US-13 | RN17 | Must | Negativo | O tutor está no cadastro de vacinação | Tenta salvar sem informar o responsável pela aplicação | O sistema rejeita o cadastro |
| CT-14-01 | US-14 | RN18 | Must | Positivo | O tutor cadastra um medicamento de 8 em 8 horas | Salva o tratamento | O sistema agenda os lembretes para os responsáveis do pet |
| CT-14-02 | US-14 | RN18 | Must | Negativo | O tratamento tem lembretes futuros | O tutor finaliza o tratamento | Os lembretes pendentes são cancelados |
| CT-15-01 | US-15 | RN19 | Could | Positivo | O pet tem status falecido | O tutor cria o memorial com uma foto e um texto | O memorial é salvo e exibido no perfil do pet |
| CT-15-02 | US-15 | RN19 | Could | Negativo | O pet tem status ativo | O tutor tenta criar o memorial | O sistema bloqueia o memorial |
| CT-16-01 | US-16 | RN20 | Must | Positivo | A empresa tem o perfil atendente definido | Atribui esse perfil a um funcionário | As permissões do perfil passam a valer para o funcionário |
| CT-16-02 | US-16 | RN20 | Must | Negativo | A empresa não definiu o perfil gerente | Tenta atribuir esse perfil | O sistema recusa a alteração |
| CT-17-01 | US-17 | RN21 | Could | Positivo | A empresa tem atendimentos no mês | Seleciona os indicadores de atendimento e faturamento | O sistema exibe os dashboards só com os dados da empresa |
| CT-17-02 | US-17 | RN21 | Could | Negativo | A empresa está no módulo de bi | Tenta consultar indicadores de outra empresa | O sistema bloqueia o acesso |
| CT-18-01 | US-18 | RN22 | Should | Positivo | O usuário tem permissão de relatórios | Gera o relatório de atendimentos do mês | O relatório é exibido |
| CT-18-02 | US-18 | RN22 | Should | Negativo | O funcionário não tem permissão de relatórios | Tenta gerar um relatório | O sistema bloqueia a ação |
| CT-19-01 | US-19 | RN23 | Must | Positivo | A empresa tem perfis de acesso definidos | Cadastra um funcionário com perfil válido e ele confirma o e-mail | O funcionário fica ativo com o perfil escolhido |
| CT-19-02 | US-19 | RN23 | Must | Negativo | O funcionário está com sessão ativa | A empresa remove o funcionário | Todas as sessões dele são revogadas imediatamente |
| CT-20-01 | US-20 | RN24 | Should | Positivo | A empresa tem pets com agendamento ou compartilhamento ativo | O funcionário abre a lista de pets vinculados | O sistema lista somente esses pets |
| CT-20-02 | US-20 | RN24 | Should | Negativo | O pet não tem atendimento nem compartilhamento com a empresa | O funcionário tenta abrir os dados do pet | O sistema nega o acesso |
| CT-21-01 | US-21 | RN25 | Should | Positivo | O tutor consentiu o tratamento dos dados | A empresa cadastra o tutor como cliente | O cliente é salvo com a data do consentimento |
| CT-21-02 | US-21 | RN25 | Should | Negativo | Não há consentimento do tutor | A empresa tenta salvar o cliente | O sistema bloqueia a gravação |
| CT-22-01 | US-22 | RN26 | Should | Positivo | A empresa tem compartilhamento ativo com o pet | O funcionário abre o perfil do pet | O sistema exibe as seções liberadas pelo tutor |
| CT-22-02 | US-22 | RN26 | Should | Negativo | A empresa não tem autorização sobre o pet | O funcionário tenta abrir o perfil completo | O sistema nega o acesso |
| CT-23-01 | US-23 | RN27 | Must | Positivo | O agendamento de banho foi contratado por r$ 60,00 e o preço atual é r$ 70,00 | O funcionário registra o atendimento | O item é cobrado por r$ 60,00 |
| CT-23-02 | US-23 | RN28 | Must | Negativo | O atendimento está finalizado | O funcionário tenta alterar as observações sem justificativa | O sistema bloqueia e exige alteração com auditoria |
| CT-24-01 | US-24 | RN29 | Must | Positivo | O profissional não tem horário às segundas pela manhã | A empresa cadastra o horário das 8h às 12h | O horário de atuação é registrado |
| CT-24-02 | US-24 | RN29 | Must | Negativo | O profissional já tem atendimento às 14h | A empresa remarca outro agendamento para 14h com o mesmo profissional | O sistema bloqueia a alteração por conflito |
| CT-25-01 | US-25 | RN31 | Could | Positivo | Existem logs críticos na última semana | O administrador filtra os logs por nível critico | O sistema lista os registros do período |
| CT-25-02 | US-25 | RN31 | Could | Negativo | Não há logs para o filtro | O administrador consulta | O sistema informa que não há registros |
| CT-26-01 | US-26 | RN32 | Could | Positivo | Há um chamado aberto com informações suficientes | O administrador executa a correção | A intervenção é registrada no chamado e na auditoria |
| CT-26-02 | US-26 | RN32 | Could | Negativo | O chamado não tem informações suficientes | O administrador analisa o chamado | O status passa a aguardando_informacao e o solicitante é notificado |
| CT-27-01 | US-27 | RN33 | Could | Positivo | O administrador tem permissão de integrações | Cadastra uma integração com parâmetros válidos | A integração é salva e testada |
| CT-27-02 | US-27 | RN33 | Could | Negativo | O administrador não tem permissão de integrações | Tenta criar uma integração | O sistema bloqueia a operação |
| CT-28-01 | US-28 | RN34 | Should | Positivo | A conta do usuário está ativa | O administrador suspende a conta informando o motivo | A conta fica suspensa e a ação é auditada |
| CT-28-02 | US-28 | RN34 | Should | Negativo | O registro de auditoria está indisponível | O administrador tenta bloquear uma conta | A operação é cancelada sem alterar o status |
| CT-29-01 | US-29 | RN35 | Should | Positivo | O perfil tutor não tem a permissão de exportar dados | O administrador concede a permissão | A permissão vale a partir da próxima requisição dos tutores |
| CT-29-02 | US-29 | RN35 | Should | Negativo | O administrador edita um perfil global | Tenta salvar o perfil sem nenhuma permissão | O sistema rejeita a alteração |
| CT-30-01 | US-30 | RN36 | Could | Positivo | O administrador está em gerenciar webhooks | Cadastra uma url https com segredo de assinatura | O webhook é salvo |
| CT-30-02 | US-30 | RN36 | Could | Negativo | O administrador está em gerenciar webhooks | Cadastra uma url http sem autenticação | O sistema bloqueia o cadastro e informa o motivo |
| CT-31-01 | US-31 | RN37 | Must | Positivo | O tutor configurou antecedência de 30 minutos para medicamentos | Chega a dose das 20h | O tutor recebe a notificação às 19h30 |
| CT-31-02 | US-31 | RN37 | Must | Negativo | O serviço de push está indisponível | O sistema tenta enviar uma notificação | A falha é registrada e uma nova tentativa é agendada |
| CT-32-01 | US-32 | RN01 | Must | Positivo | Não existe empresa com o cnpj informado | A empresa informa cnpj, e-mail e senha e confirma o e-mail | A conta da empresa fica ativa |
| CT-32-02 | US-32 | RN01 | Must | Negativo | Já existe empresa com o cnpj informado | Outra conta tenta se cadastrar com esse cnpj | O sistema recusa e informa que o cnpj já está em uso |
| CT-33-01 | US-33 | RN14 | Must | Positivo | A empresa tem serviços ativos | O tutor abre o catálogo da empresa | O sistema lista nome, descrição, valor e duração de cada serviço |
| CT-33-02 | US-33 | RN27 | Must | Negativo | A empresa não tem serviços ativos | O tutor abre o catálogo | O sistema informa que não há serviços disponíveis no momento |
| CT-34-01 | US-34 | RN15 | Should | Positivo | O tutor está nos documentos do pet | Envia o pdf de um laudo com título e tipo | O documento fica disponível no perfil do pet |
| CT-34-02 | US-34 | RN15 | Should | Negativo | O documento não está em nenhum escopo compartilhado | Um destinatário de compartilhamento tenta abri-lo | O sistema nega o acesso |
| CT-35-01 | US-35 | RN15 | Should | Positivo | O pet tem vacinas, exames e atendimentos | O tutor abre a linha do tempo | Os eventos aparecem em ordem cronológica |
| CT-35-02 | US-35 | RN26 | Should | Negativo | A empresa não tem o escopo linha_do_tempo | O funcionário tenta abrir a linha do tempo | O sistema nega o acesso |
| CT-36-01 | US-36 | RN15 | Should | Positivo | O tutor está nos exames do pet | Registra um hemograma com o laudo anexado | O exame aparece no histórico clínico |
| CT-36-02 | US-36 | RN30 | Should | Negativo | O compartilhamento da empresa não inclui exames | O funcionário tenta registrar um exame | O sistema nega a operação |
| CT-37-01 | US-37 | RN15 | Should | Positivo | O tutor está nas alergias do pet | Registra alergia grave a dipirona | A alergia aparece em destaque no perfil do pet |
| CT-37-02 | US-37 | RN30 | Should | Negativo | O perfil do funcionário não permite alterar dados clínicos | Ele tenta excluir uma alergia | O sistema nega a operação |
| CT-38-01 | US-38 | RN20 | Must | Positivo | A empresa está no catálogo | Cadastra banho com preço e duração de 60 minutos | O serviço fica ativo no catálogo |
| CT-38-02 | US-38 | RN27 | Must | Negativo | Existe agendamento de banho contratado por r$ 60,00 | A empresa altera o preço para r$ 70,00 | O agendamento existente mantém r$ 60,00 |
| CT-39-01 | US-39 | RN14 | Must | Positivo | O profissional e o pet estão livres às 9h | A empresa agenda um serviço para as 9h | O agendamento é criado e o tutor é notificado |
| CT-39-02 | US-39 | RN29 | Must | Negativo | A sala de banho está ocupada às 9h | A empresa agenda outro serviço na mesma sala às 9h | O sistema recusa por conflito de recurso |
| CT-40-01 | US-40 | RN14 | Must | Positivo | O serviço tem horário disponível às 15h | O tutor solicita o agendamento para o seu pet às 15h | A solicitação fica pendente com a primeira entrada no histórico |
| CT-40-02 | US-40 | RN14 | Must | Negativo | O horário das 15h foi ocupado enquanto o tutor preenchia | O tutor envia a solicitação | O sistema informa o conflito e atualiza os horários disponíveis |
| CT-41-01 | US-41 | RN20 | Must | Positivo | Há uma solicitação pendente | A empresa aceita a solicitação | A solicitação fica aceita, o agendamento é criado e o tutor é notificado |
| CT-41-02 | US-41 | RN40 | Must | Negativo | Há uma solicitação pendente | A empresa tenta recusar sem informar o motivo | O sistema exige o motivo da recusa |
| CT-42-01 | US-42 | RN22 | Must | Positivo | O tutor tem uma solicitação aceita | Abre os detalhes da solicitação | O sistema exibe o status atual e o histórico de alterações |
| CT-42-02 | US-42 | RN38 | Must | Negativo | O horário da solicitação já passou | O tutor tenta cancelar | O sistema bloqueia o cancelamento e informa o motivo |
| CT-43-01 | US-43 | RN25 | Could | Positivo | O tutor tem agendamento com a empresa | Envia uma mensagem no chat da empresa | A mensagem é entregue à empresa |
| CT-43-02 | US-43 | RN25 | Could | Negativo | O tutor não tem assinatura pantera ativa | Abre o chat com o assistente virtual | O sistema bloqueia o acesso e oferece a assinatura |
| CT-44-01 | US-44 | RN25 | Should | Positivo | O tutor tem um serviço aceito para pagar | Paga com pix e o gateway confirma | O pagamento fica aceito com a data de confirmação |
| CT-44-02 | US-44 | RN39 | Should | Negativo | O tutor escolheu cartão de crédito | O gateway recusa a transação | O pagamento fica recusado e o tutor pode tentar outro meio |
| CT-45-01 | US-45 | RN22 | Should | Positivo | O tutor tem pagamentos no mês | Filtra os pagamentos do mês | O sistema lista os pagamentos com valor, data e status |
| CT-45-02 | US-45 | RN39 | Should | Negativo | O pagamento está pendente | O tutor solicita reembolso | O sistema não permite o reembolso |
| CT-46-01 | US-46 | RN15 | Must | Positivo | O tutor consentiu o compartilhamento opcional de dados | Revoga esse consentimento | O consentimento fica revogado com data e a ação é auditada |
| CT-46-02 | US-46 | RN25 | Must | Negativo | O termo de uso é obrigatório | O tutor tenta revogá-lo | O sistema alerta que o serviço não pode ser prestado e oferece a exclusão da conta |

## 4. Cobertura das regras de negócio

| Regra | Casos de teste |
|---|---|
| RN01 | CT-01-02, CT-32-02 |
| RN02 | Coberta indiretamente; ver REQ-06 |
| RN03 | CT-02-02 |
| RN04 | Coberta indiretamente; ver REQ-06 |
| RN05 | CT-03-02 |
| RN06 | Coberta indiretamente; ver REQ-06 |
| RN07 | Coberta indiretamente; ver REQ-06 |
| RN08 | CT-04-02 |
| RN09 | CT-05-02 |
| RN10 | CT-06-02 |
| RN11 | CT-07-02 |
| RN12 | CT-08-02 |
| RN13 | CT-09-02 |
| RN14 | CT-10-02, CT-40-02 |
| RN15 | CT-11-02, CT-34-02 |
| RN16 | CT-12-02 |
| RN17 | CT-13-02 |
| RN18 | CT-14-02 |
| RN19 | CT-15-02 |
| RN20 | CT-16-02 |
| RN21 | CT-17-02 |
| RN22 | CT-18-02 |
| RN23 | CT-19-02 |
| RN24 | CT-20-02 |
| RN25 | CT-21-02, CT-43-02, CT-46-02 |
| RN26 | CT-22-02, CT-35-02 |
| RN27 | CT-33-02, CT-38-02 |
| RN28 | CT-23-02 |
| RN29 | CT-24-02, CT-39-02 |
| RN30 | CT-36-02, CT-37-02 |
| RN31 | CT-25-02 |
| RN32 | CT-26-02 |
| RN33 | CT-27-02 |
| RN34 | CT-28-02 |
| RN35 | CT-29-02 |
| RN36 | CT-30-02 |
| RN37 | CT-31-02 |
| RN38 | CT-42-02 |
| RN39 | CT-44-02, CT-45-02 |
| RN40 | CT-41-02 |