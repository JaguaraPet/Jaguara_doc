# REQ-04 · Especificação de casos de uso

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | REQ-04 · Especificação de casos de uso |
| Versão | 2.1 |
| Status | Em revisão |
| Autores | Micaela Dorneles, Miguel Drozino, Nathan Rodrigues, Ricardo Guilhen |
| Data | 01/11/2026 |
| Tarefa Jira | JAG-35, JAG-62 |
| Padrão de referência | Modelo Bússola (curso) com campos do modelo *fully dressed* de Cockburn |
| Original | [REQ-04-especificacao-casos-de-uso-original.xlsx](../anexos/originais/REQ-04-especificacao-casos-de-uso-original.xlsx) |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 1.0 | 30/09/2026 | Equipe Jaguara | Especificação dos casos de uso JGR001 a JGR047 na planilha do modelo Bússola (JAG-1, JAG-6). |
| 1.1 | 30/10/2026 | Equipe Jaguara | Reescrita de JGR002 a JGR008 e demais ajustes; JGR024 incorporado ao JGR023 e renumeração para JGR001 a JGR046 (JAG-35). |
| 2.0 | 01/11/2026 | Ricardo Guilhen | Migração para o repositório com campos padronizados: identificador UC, requisito, regras de negócio, prioridade, pós-condição e classes envolvidas (JAG-62). Fluxos mantidos como escritos pelo time. |
| 2.1 | 01/11/2026 | Ricardo Guilhen | UC-21 atende clientes sem conta no Jaguara (ADR-010, item 3). Histórias de usuário retiradas desta versão do repositório. |

## 1. Objetivo

Especificar o comportamento de cada caso de uso do Jaguara, com os mesmos campos para todos, de forma que cada um possa ser implementado e testado de maneira independente.

## 2. Convenções

- **Identificador:** `UC-nn`, igual ao número da planilha atual (`JGRnnn`). O número antigo da planilha aparece no campo Identificador de cada caso de uso.
- **Prioridade:** MoSCoW (*Must*, *Should*, *Could*), a mesma do requisito no [REQ-01](REQ-01-ERS.md).
- **Regras de negócio:** as citadas nos fluxos mais as do requisito de origem.
- **Classes envolvidas:** nomes do [modelo de classes (MOD-01)](../04-modelagem/MOD-01-modelo-de-classes.md).
- **Fluxos:** numerados pelo passo; fluxos alternativos (`FAnn`) indicam o passo do fluxo principal em que ramificam.
- **Atores:** o diagrama está no [REQ-03](REQ-03-diagrama-casos-de-uso.md).

## 3. Índice

| UC | Caso de uso | RF | Prioridade |
|---|---|---|---|
| [UC-01](#uc-01) | Cadastrar usuário | RF01 | Must |
| [UC-02](#uc-02) | Autenticar usuário | RF02 | Must |
| [UC-03](#uc-03) | Recuperar senha | RF03 | Must |
| [UC-04](#uc-04) | Gerenciar Pet | RF04 | Must |
| [UC-05](#uc-05) | Vincular responsável ao pet | RF05 | Should |
| [UC-06](#uc-06) | Controlar despesas | RF06 | Should |
| [UC-07](#uc-07) | Emitir relatório de despesas | RF07 | Should |
| [UC-08](#uc-08) | Registrar alimentação | RF08 | Should |
| [UC-09](#uc-09) | Sincronizar calendário externo | RF09 | Could |
| [UC-10](#uc-10) | Gerenciar calendário | RF10 | Must |
| [UC-11](#uc-11) | Compartilhar perfil do pet | RF11 | Should |
| [UC-12](#uc-12) | Visualizar vacinação | RF12 | Must |
| [UC-13](#uc-13) | Cadastrar vacinação | RF13 | Must |
| [UC-14](#uc-14) | Gerenciar medicamentos | RF14 | Must |
| [UC-15](#uc-15) | Gerenciar memorial de pet | RF15 | Could |
| [UC-16](#uc-16) | Gerenciar permissões dos funcionários | RF16 | Must |
| [UC-17](#uc-17) | Emitir BI | RF17 | Could |
| [UC-18](#uc-18) | Emitir Relatórios | RF18 | Should |
| [UC-19](#uc-19) | Gerenciar Funcionários | RF19 | Must |
| [UC-20](#uc-20) | Consultar Pets Vinculados | RF20 | Should |
| [UC-21](#uc-21) | Gerenciar Clientes | RF21 | Should |
| [UC-22](#uc-22) | Visualizar Perfil do Pet | RF22 | Should |
| [UC-23](#uc-23) | Registrar Serviços e Atendimentos | RF23 | Must |
| [UC-24](#uc-24) | Controlar agenda | RF25 | Must |
| [UC-25](#uc-25) | Monitorar Desempenho e Logs | RF26 | Could |
| [UC-26](#uc-26) | Prestar Suporte Operacional | RF27 | Could |
| [UC-27](#uc-27) | Gerenciar Integrações | RF28 | Could |
| [UC-28](#uc-28) | Gerenciar Contas de Usuários | RF29 | Should |
| [UC-29](#uc-29) | Gerenciar Permissões Globais | RF30 | Should |
| [UC-30](#uc-30) | Gerenciar Webhooks | RF31 | Could |
| [UC-31](#uc-31) | Disparar notificações automáticas | RF32 | Must |
| [UC-32](#uc-32) | Cadastrar usuário enterprise | RF01 | Must |
| [UC-33](#uc-33) | Visualizar catálogo de serviços | RF39 | Must |
| [UC-34](#uc-34) | Gerenciar documentos do pet | RF33 | Should |
| [UC-35](#uc-35) | Consultar Linha do Tempo do Pet | RF34 | Should |
| [UC-36](#uc-36) | Gerenciar Exames do Pet | RF35 | Should |
| [UC-37](#uc-37) | Gerenciar Alergias e Restrições | RF36 | Should |
| [UC-38](#uc-38) | Gerenciar Catálogo de Serviços | RF37 | Must |
| [UC-39](#uc-39) | Agendar Serviço (empresa) | RF38 | Must |
| [UC-40](#uc-40) | Solicitar Agendamento de Serviço (tutor) | RF39 | Must |
| [UC-41](#uc-41) | Gerenciar Solicitações de Serviço | RF40 | Must |
| [UC-42](#uc-42) | Consultar e Acompanhar Solicitações (tutor) | RF41 | Must |
| [UC-43](#uc-43) | Conversar em Chat na Plataforma | RF42 | Could |
| [UC-44](#uc-44) | Realizar Pagamento (tutor) | RF43 | Should |
| [UC-45](#uc-45) | Gerenciar Pagamentos | RF44 | Should |
| [UC-46](#uc-46) | Gerenciar Privacidade e Consentimentos | RF45 | Must |

## 4. Especificações

<a id="uc-01"></a>

### UC-01 · Cadastrar usuário

| Campo | Valor |
|---|---|
| Identificador | UC-01 (planilha: JGR001) |
| Requisito | RF01 |
| Regras de negócio | RN01, RN02 |
| Prioridade | Must |
| Objetivo | Permitir que um novo usuário-tutor realize seu cadastro na plataforma, com conta ativada após a confirmação do e-mail. |
| Atores | Usuário-tutor, sistema |
| Pré-condições | O usuário-tutor não deve possuir cadastro ativo na plataforma e deve estar na tela de cadastro. |
| Pós-condições (garantia de sucesso) | Conta do tutor criada com status PENDENTE_CONFIRMACAO e ativada (ATIVA) após a confirmação do e-mail. |
| Classes envolvidas | Usuario, Tutor, TokenAcesso |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário-tutor acessa a tela de cadastro. |  |
| 2 |  | O sistema solicita os dados cadastrais. |
| 3 | O usuário-tutor informa os dados obrigatórios. |  |
| 4 |  | O sistema valida os dados preenchidos. |
| 5 |  | O sistema verifica a unicidade do CPF (RN01). |
| 6 |  | O sistema registra o cadastro. |
| 7 |  | O sistema envia o e-mail de confirmação. |
| 8 | O usuário-tutor confirma o e-mail recebido. |  |
| 9 |  | O sistema ativa a conta (RN02). |
| 10 |  | A operação é finalizada. |

**Fluxo Alternativo FA1. Dados inválidos, obrigatórios ausentes ou CPF já existente (ramifica nos passos 4 e 5)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário-tutor corrige os dados. |  |
| 2 |  | O sistema identifica falhas nos campos (dados inválidos/ausentes) ou que o CPF já existe na base de dados. |
| 3 |  | O sistema exibe mensagem de erro orientando a correção. |
| 4 |  | O fluxo retorna ao passo 3 do fluxo principal. |

**FA2. E-mail não confirmado (ramifica no passo 8)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário-tutor não confirma o e-mail recebido. |  |
| 2 |  | O sistema mantém a conta inativa. |
| 3 |  | A operação é finalizada. |

<a id="uc-02"></a>

### UC-02 · Autenticar usuário

| Campo | Valor |
|---|---|
| Identificador | UC-02 (planilha: JGR002) |
| Requisito | RF02 |
| Regras de negócio | RN03, RN04 |
| Prioridade | Must |
| Objetivo | Permite que o usuário acesse o sistema utilizando login e senha, iniciando uma sessão autenticada. |
| Atores | Todos os usuários (Usuário-tutor, usuário-empresa, usuário-funcionário), sistema |
| Pré-condições | O usuário deve estar cadastrado e com a conta ativa, e se encontrar na tela de login. |
| Pós-condições (garantia de sucesso) | Sessão autenticada criada e contador de falhas de login zerado. |
| Classes envolvidas | Usuario, Sessao |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário acessa a tela de login |  |
| 2 |  | O sistema solicita as credenciais |
| 3 | O usuário informa login e senha |  |
| 4 |  | O sistema valida as credenciais |
| 5 |  | O sistema autentica o usuário |
| 6 |  | O sistema cria a sessão |
| 7 | O usuário acessa o sistema |  |

**Fluxos alternativos**

| Passo | Ator | Sistema |
|---|---|---|
| FA01-1 |  | O sistema identifica credenciais incorretas |
| FA01-2 |  | O sistema incrementa o contador de tentativas |
| FA01-3 |  | O sistema retorna ao passo 3 do fluxo principal |
| FA02-1 | O usuário atinge 5 tentativas inválidas |  |
| FA02-2 |  | O sistema bloqueia a conta por 5 minutos (RN03) |
| FA03-1 | O usuário permanece inativo por período superior ao permitido |  |
| FA03-2 |  | O sistema encerra a sessão (RN04) |
| FA03-3 | O usuário deve se autenticar novamente |  |

<a id="uc-03"></a>

### UC-03 · Recuperar senha

| Campo | Valor |
|---|---|
| Identificador | UC-03 (planilha: JGR003) |
| Requisito | RF03 |
| Regras de negócio | RN05, RN06 |
| Prioridade | Must |
| Objetivo | Permite que o usuário redefina a sua senha de acesso por meio de um link de recuperação enviado por e-mail. |
| Atores | Todos os usuários (Usuário-tutor, usuário-empresa, usuário-funcionário), sistema |
| Pré-condições | O usuário deve estar cadastrado na plataforma e se encontrar na tela de login. |
| Pós-condições (garantia de sucesso) | Senha redefinida, token marcado como utilizado e senha anterior registrada no histórico. |
| Classes envolvidas | Usuario, TokenAcesso, HistoricoSenha |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário seleciona a opção "Esqueci minha senha" |  |
| 2 |  | O sistema solicita o e-mail |
| 3 | O usuário informa o e-mail cadastrado |  |
| 4 |  | O sistema gera o link de recuperação |
| 5 |  | O sistema envia o link por e-mail |
| 6 | O usuário acessa o link recebido |  |
| 7 |  | O sistema valida o prazo de validade do link |
| 8 | O usuário informa a nova senha |  |
| 9 |  | O sistema valida a senha |
| 10 |  | O sistema atualiza a senha |

**Fluxos alternativos**

| Passo | Ator | Sistema |
|---|---|---|
| FA01-1 |  | O sistema identifica que o link foi gerado há mais de 2 horas (RN05) |
| FA01-2 |  | O sistema invalida o link |
| FA01-3 | O usuário solicita um novo link |  |
| FA02-1 |  | O sistema identifica que a senha informada está entre as três últimas utilizadas (RN06) |
| FA02-2 |  | O sistema exibe mensagem de erro |
| FA02-3 |  | O sistema retorna ao passo 8 do fluxo principal |

<a id="uc-04"></a>

### UC-04 · Gerenciar Pet

| Campo | Valor |
|---|---|
| Identificador | UC-04 (planilha: JGR004) |
| Requisito | RF04 |
| Regras de negócio | RN07, RN08, RN30 |
| Prioridade | Must |
| Objetivo | Permite cadastrar, editar, arquivar e remover pets, mantendo os dados cadastrais atualizados. |
| Atores | Usuário-tutor, usuário-empresa (parcial), usuário-funcionário (parcial), sistema |
| Pré-condições | O usuário deve estar autenticado e possuir permissão sobre o pet. |
| Pós-condições (garantia de sucesso) | Pet cadastrado, alterado ou arquivado, com o tutor criador como responsável principal. |
| Classes envolvidas | Pet, Especie, Raca, ResponsavelPet |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário acessa o módulo de pets |  |
| 2 |  | O sistema apresenta as opções disponíveis |
| 3 | O usuário escolhe cadastrar, editar, arquivar ou remover |  |
| 4 |  | O sistema solicita os dados do pet |
| 5 | O usuário informa os dados |  |
| 6 |  | O sistema valida espécie e raça (RN07) |
| 7 |  | O sistema salva as alterações |

**Fluxos alternativos**

| Passo | Ator | Sistema |
|---|---|---|
| FA01-1 |  | O sistema identifica espécie ou raça não cadastrada |
| FA01-2 |  | O sistema exibe mensagem de erro |
| FA01-3 |  | O sistema retorna ao passo 5 do fluxo principal |
| FA02-1 | O usuário solicita a exclusão de um pet |  |
| FA02-2 |  | O sistema verifica a existência de histórico clínico ou financeiro |
| FA02-3 |  | O sistema impede a exclusão permanente e arquiva o pet (RN08) |
| FA03-1 | O Funcionário Enterprise tenta alterar dados cadastrais críticos |  |
| FA03-2 |  | O sistema bloqueia a operação (RN30) |

<a id="uc-05"></a>

### UC-05 · Vincular responsável ao pet

| Campo | Valor |
|---|---|
| Identificador | UC-05 (planilha: JGR005) |
| Requisito | RF05 |
| Regras de negócio | RN09 |
| Prioridade | Should |
| Objetivo | Permite que o tutor adicione ou remova responsáveis associados ao pet, mantendo sempre um responsável principal. |
| Atores | Usuário-tutor, sistema |
| Pré-condições | O tutor deve estar autenticado e possuir um pet cadastrado. |
| Pós-condições (garantia de sucesso) | Vínculo de responsável criado ou removido, mantendo ao menos um responsável principal ativo. |
| Classes envolvidas | Pet, Tutor, ResponsavelPet |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O tutor acessa o cadastro do pet |  |
| 2 | O tutor seleciona "Gerenciar Responsáveis" |  |
| 3 |  | O sistema exibe os responsáveis vinculados |
| 4 | O tutor adiciona ou remove responsáveis |  |
| 5 |  | O sistema valida a operação |
| 6 |  | O sistema salva as alterações |

**Fluxos alternativos**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O tutor solicita a remoção que deixaria o pet sem responsável principal |  |
| 2 |  | O sistema impede a operação (RN09) |
| 3 |  | O sistema retorna ao passo 4 do fluxo principal |

<a id="uc-06"></a>

### UC-06 · Controlar despesas

| Campo | Valor |
|---|---|
| Identificador | UC-06 (planilha: JGR006) |
| Requisito | RF06 |
| Regras de negócio | RN10 |
| Prioridade | Should |
| Objetivo | Permite que o tutor registre as despesas relacionadas ao pet, classificadas por categoria. |
| Atores | Usuário-tutor, sistema |
| Pré-condições | O tutor deve estar autenticado e possuir um pet cadastrado. |
| Pós-condições (garantia de sucesso) | Despesa registrada, vinculada ao pet e a uma categoria. |
| Classes envolvidas | Despesa, CategoriaDespesa, Pet |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O tutor acessa o módulo financeiro |  |
| 2 | O tutor seleciona "Nova Despesa" |  |
| 3 | O tutor informa valor, data e categoria |  |
| 4 |  | O sistema valida os dados |
| 5 |  | O sistema registra a despesa |

**Fluxos alternativos**

| Passo | Ator | Sistema |
|---|---|---|
| 1 |  | O sistema identifica a ausência da categoria |
| 2 |  | O sistema exibe mensagem de erro (RN10) |
| 3 |  | O sistema retorna ao passo 3 do fluxo principal |

<a id="uc-07"></a>

### UC-07 · Emitir relatório de despesas

| Campo | Valor |
|---|---|
| Identificador | UC-07 (planilha: JGR007) |
| Requisito | RF07 |
| Regras de negócio | RN11 |
| Prioridade | Should |
| Objetivo | Permite que o tutor gere e exporte relatórios financeiros das despesas do pet por período. |
| Atores | Usuário-tutor, sistema |
| Pré-condições | O tutor deve estar autenticado e possuir despesas registradas. |
| Pós-condições (garantia de sucesso) | Relatório do período gerado e, quando solicitado, exportado em PDF. |
| Classes envolvidas | Relatorio, Despesa |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O tutor acessa os relatórios financeiros |  |
| 2 | O tutor seleciona o período desejado |  |
| 3 |  | O sistema gera o relatório |
| 4 |  | O sistema exibe os resultados |
| 5 | O tutor escolhe exportar o relatório |  |
| 6 |  | O sistema gera o arquivo em PDF (RN11) |

**Fluxos alternativos**

| Passo | Ator | Sistema |
|---|---|---|
| 1 |  | O sistema não encontra registros para o período informado |
| 2 |  | O sistema exibe mensagem informativa e encerra o caso de uso |

<a id="uc-08"></a>

### UC-08 · Registrar alimentação

| Campo | Valor |
|---|---|
| Identificador | UC-08 (planilha: JGR008) |
| Requisito | RF08 |
| Regras de negócio | RN12 |
| Prioridade | Should |
| Objetivo | Permite que o tutor registre as refeições e os planos alimentares do pet. |
| Atores | Usuário-tutor, sistema |
| Pré-condições | O tutor deve estar autenticado e possuir um pet cadastrado. |
| Pós-condições (garantia de sucesso) | Refeição ou plano alimentar registrado; alerta emitido quando o limite diário é excedido. |
| Classes envolvidas | PlanoAlimentar, RegistroAlimentacao |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O tutor acessa o módulo de alimentação |  |
| 2 | O tutor seleciona registrar refeição |  |
| 3 | O tutor informa quantidade, horário e observações |  |
| 4 |  | O sistema registra a alimentação |

**Fluxos alternativos**

| Passo | Ator | Sistema |
|---|---|---|
| 1 |  | O sistema identifica que o limite diário de alimentação foi ultrapassado |
| 2 |  | O sistema exibe alerta ao tutor (RN12) |
| 3 | O tutor confirma ou cancela o registro |  |

<a id="uc-09"></a>

### UC-09 · Sincronizar calendário externo

| Campo | Valor |
|---|---|
| Identificador | UC-09 (planilha: JGR009) |
| Requisito | RF09 |
| Regras de negócio | RN13 |
| Prioridade | Could |
| Objetivo | Permite que o usuário sincronize o calendário externo ao aplicativo e combine seus compromissos com o calendário do aplicativo. |
| Atores | Usuário-tutor |
| Pré-condições | O usuário deve estar autenticado ("logado") como usuário "Tutor", através do menu principal seleciona a opção de "Calendário" e encontra na tela a opção de "Sincronizar calendário". |
| Pós-condições (garantia de sucesso) | Calendário externo autorizado e eventos sincronizados com o calendário do aplicativo. |
| Classes envolvidas | CalendarioExterno, EventoCalendario |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O tutor acessa as configurações de calendário. |  |
| 2 | Seleciona a opção de sincronização. |  |
| 3 |  | O sistema apresenta os calendários disponíveis. |
| 4 | O tutor autoriza o acesso ao calendário externo. |  |
| 5 |  | O sistema valida a autorização. |
| 6 |  | O sistema sincroniza os eventos. |
| 7 |  | O sistema confirma a sincronização. |

**Fluxos alternativos**

| Passo | Ator | Sistema |
|---|---|---|
| 1 |  | O sistema identifica ausência de autorização. |
| 2 |  | A sincronização é cancelada. |
| 3 |  | O sistema informa o usuário. |

<a id="uc-10"></a>

### UC-10 · Gerenciar calendário

| Campo | Valor |
|---|---|
| Identificador | UC-10 (planilha: JGR010) |
| Requisito | RF10 |
| Regras de negócio | RN14 |
| Prioridade | Must |
| Objetivo | Permitir o cadastro e gerenciamento de eventos e compromissos. |
| Atores | Usuário-tutor |
| Pré-condições | O usuário deve estar autenticado ("logado") como usuário "Tutor", através do menu principal seleciona a opção de "Calendário" e seleciona a opção "Gerenciar calendário". |
| Pós-condições (garantia de sucesso) | Evento registrado no calendário do pet e notificações agendadas. |
| Classes envolvidas | EventoCalendario, Notificacao |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O tutor acessa o calendário |  |
| 2 | Seleciona criar ou editar evento. |  |
| 3 | Informa os dados do compromisso. |  |
| 4 |  | O sistema valida disponibilidade. |
| 5 |  | O sistema registra o evento. |
| 6 |  | O sistema agenda notificações automáticas. |

**Fluxos alternativos**

| Passo | Ator | Sistema |
|---|---|---|
| 1 |  | O sistema identifica conflito nas agendas. |
| 2 |  | O sistema impede o cadastro. |
| 3 |  | Retorna ao passo 3 (fluxo principal). |

<a id="uc-11"></a>

### UC-11 · Compartilhar perfil do pet

| Campo | Valor |
|---|---|
| Identificador | UC-11 (planilha: JGR011) |
| Requisito | RF11 |
| Regras de negócio | RN15 |
| Prioridade | Should |
| Objetivo | Permite que o usuário compartilhe informações do pet com terceiros. |
| Atores | Usuário-tutor |
| Pré-condições | O usuário deve estar autenticado ("logado") com o perfil de "tutor", através do menu principal seleciona a opção de "Perfil do pet" e se encontrar na tela de "Compartilhar perfil" |
| Pós-condições (garantia de sucesso) | Compartilhamento ativo, com escopos definidos pelo tutor. |
| Classes envolvidas | CompartilhamentoPet |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O tutor acessa o perfil do pet. |  |
| 2 | Seleciona compartilhar perfil. |  |
| 3 | Define as permissões de acesso. |  |
| 4 | Informa o destinatário. |  |
| 5 |  | O sistema gera o compartilhamento. |

**Fluxos alternativos**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O compartilhamento viola as permissões definidas. |  |
| 2 |  | O sistema impede a operação. |

<a id="uc-12"></a>

### UC-12 · Visualizar vacinação

| Campo | Valor |
|---|---|
| Identificador | UC-12 (planilha: JGR012) |
| Requisito | RF12 |
| Regras de negócio | RN16 |
| Prioridade | Must |
| Objetivo | Permitir a consulta do histórico vacinal do pet cadastrado. |
| Atores | Usuário-tutor |
| Pré-condições | O usuário deve estar autenticado ("logado") com o perfil de "tutor", se encontra no menu principal e na opção de "Vacinação" e se encontra na tela de "Histórico de vacinas" |
| Pós-condições (garantia de sucesso) | Nenhum dado alterado; histórico vacinal exibido. |
| Classes envolvidas | Vacinacao |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O tutor acessa o perfil do pet. |  |
| 2 | Seleciona histórico de vacinação. |  |
| 3 |  | O sistema recupera os registros. |
| 4 |  | O sistema exibe o histórico. |

**Fluxos alternativos**

| Passo | Ator | Sistema |
|---|---|---|
|  |  | O sistema identifica registro inválido. |
|  |  | O registro não é exibido. |

<a id="uc-13"></a>

### UC-13 · Cadastrar vacinação

| Campo | Valor |
|---|---|
| Identificador | UC-13 (planilha: JGR013) |
| Requisito | RF13 |
| Regras de negócio | RN17 |
| Prioridade | Must |
| Objetivo | Permite que o tutor registre vacinas aplicadas no pet. |
| Atores | Usuário-tutor |
| Pré-condições | O usuário deve estar autenticado ("logado") com o perfil de "tutor", através do menu principal seleciona a opção de "Vacinação" e se encontrar na tela de "Cadastrar vacinação" |
| Pós-condições (garantia de sucesso) | Vacinação registrada e lembrete da próxima dose agendado, quando informada. |
| Classes envolvidas | Vacinacao, Notificacao |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O tutor acessa vacinação. |  |
| 2 | Seleciona nova vacina. |  |
| 3 | Informa vacina, data e responsável. |  |
| 4 |  | O sistema valida os dados. |
| 5 |  | O sistema registra a vacinação. |

**Fluxos alternativos**

| Passo | Ator | Sistema |
|---|---|---|
| 1 |  | O sistema identifica ausência da data ou responsável. |
| 2 |  | O cadastro é rejeitado. |

<a id="uc-14"></a>

### UC-14 · Gerenciar medicamentos

| Campo | Valor |
|---|---|
| Identificador | UC-14 (planilha: JGR014) |
| Requisito | RF14 |
| Regras de negócio | RN18 |
| Prioridade | Must |
| Objetivo | Permite o cadastro e acompanhamento de tratamentos medicamentosos de um pet. |
| Atores | Usuário-tutor |
| Pré-condições | O usuário deve estar autenticado ("logado") com o perfil de "tutor", através do menu principal seleciona a opção de "Medicamentos" e se encontrar na tela de "Gerenciar medicamentos" |
| Pós-condições (garantia de sucesso) | Tratamento ativo com lembretes agendados; ao finalizar, lembretes pendentes cancelados. |
| Classes envolvidas | TratamentoMedicamentoso, Notificacao |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O tutor acessa medicamentos. |  |
| 2 | Seleciona cadastrar tratamento. |  |
| 3 | Informa medicamento e posologia. |  |
| 4 |  | O sistema registra o tratamento. |
| 5 |  | O sistema agenda lembretes. |

**Fluxos alternativos**

| Passo | Ator | Sistema |
|---|---|---|
| 1 |  | O tratamento é finalizado. |
| 2 |  | O sistema cancela os lembretes automáticos. |

<a id="uc-15"></a>

### UC-15 · Gerenciar memorial de pet

| Campo | Valor |
|---|---|
| Identificador | UC-15 (planilha: JGR015) |
| Requisito | RF15 |
| Regras de negócio | RN19 |
| Prioridade | Could |
| Objetivo | Permite o registro de homenagens e memórias do pet. |
| Atores | Usuário-tutor |
| Pré-condições | O usuário deve estar autenticado ("logado") com o perfil de "tutor", através do menu principal seleciona a opção de "Memorial do pet" e se encontrar na tela de "Gerenciar memorial" |
| Pós-condições (garantia de sucesso) | Memorial criado com fotos, textos e homenagens. |
| Classes envolvidas | Memorial, ItemMemorial, Pet |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O tutor acessa o perfil do pet. |  |
| 2 | Seleciona memorial. |  |
| 3 | Adiciona fotos, textos e homenagens. |  |
| 4 |  | O sistema salva o conteúdo. |

**Fluxos alternativos**

| Passo | Ator | Sistema |
|---|---|---|
| 1 |  | O sistema verifica o status do pet. |
| 2 |  | O memorial é bloqueado. |

<a id="uc-16"></a>

### UC-16 · Gerenciar permissões dos funcionários

| Campo | Valor |
|---|---|
| Identificador | UC-16 (planilha: JGR016) |
| Requisito | RF16 |
| Regras de negócio | RN20, RN23 |
| Prioridade | Must |
| Objetivo | Permitir que o usuário-empresa defina e altere o perfil de acesso dos seus funcionários. |
| Atores | Usuário-empresa (veterinária) |
| Pré-condições | A empresa está autenticada com perfil de Empresa Enterprise. A empresa possui ao menos um funcionário cadastrado (JGR019). Existem perfis de acesso definidos pela organização (RN20). |
| Pós-condições (garantia de sucesso) | Perfil de acesso do funcionário alterado, com as novas permissões valendo imediatamente. |
| Classes envolvidas | PerfilAcesso, Permissao, FuncionarioEnterprise |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | A empresa acessa gerenciamento de permissões. |  |
| 2 |  | O sistema exibe a lista de funcionários com o perfil de acesso atual de cada um |
| 3 | A empresa seleciona um funcionário |  |
| 4 |  | O sistema exibe o perfil atual e os perfis de acesso disponíveis (RN20) |
| 5 | A empresa define o novo perfil de acesso |  |
| 6 |  | O sistema valida o perfil escolhido (RN20) |
| 7 |  | O sistema salva a alteração e aplica as novas permissões ao funcionário |
| 8 |  | O sistema exibe a confirmação da alteração |
| 9 |  | A operação é finalizada |

**Fluxo Alternativo 1 - sem funcionários cadastrados**

| Passo | Ator | Sistema |
|---|---|---|
| 1 |  | 1. O sistema identifica que a empresa não possui funcionários cadastrados |
| 1 |  | 2. O sistema exibe a mensagem "Nenhum funcionário cadastrado" e oferece o acesso ao cadastro de funcionários (JGR019) |
| 1 |  | 3. A operação é finalizada e retorna a última tela. |

**Fluxo Alternativo 2 - Empresa cancela a alteração**

| Passo | Ator | Sistema |
|---|---|---|
| 2 | 1. A empresa cancela a alteração |  |
| 2 |  | 2. O sistema descarta as modificações, mantendo as permissões atuais |
| 2 |  | 3. A operação é finalizada |

**Fluxo Alternativo 3 - Funcionário removido durante a operação**

| Passo | Ator | Sistema |
|---|---|---|
| 3 |  | 1. O sistema identifica que o funcionário selecionado foi removido (RN23) |
| 3 |  | 2. O sistema rejeita a alteração e informa que o funcionário não está mais ativo |
| 3 |  | 3. O fluxo retorna ao passo 2 do fluxo principal |

<a id="uc-17"></a>

### UC-17 · Emitir BI

| Campo | Valor |
|---|---|
| Identificador | UC-17 (planilha: JGR017) |
| Requisito | RF17 |
| Regras de negócio | RN21 |
| Prioridade | Could |
| Objetivo | Permitir ao usuário-empresa visualizar indicadores e dashboards estratégicos, com base nos dados disponibilizados pelo sistema, garantindo que o acesso às informações seja restrito aos dados da própria empresa. |
| Atores | Usuário-empresa |
| Pré-condições | O usuário deve estar autenticado no sistema com perfil de Empresa Enterprise e possuir acesso ao módulo de BI. |
| Pós-condições (garantia de sucesso) | Nenhum dado alterado; indicadores calculados apenas com dados da própria empresa. |
| Classes envolvidas | Agendamento, Atendimento, Pagamento |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 |  | O sistema apresenta o módulo de BI e os indicadores disponíveis para consulta. |
| 2 | A Empresa Enterprise seleciona os indicadores desejados. |  |
| 3 |  | O sistema processa os dados correspondentes aos indicadores selecionados. |
| 4 |  | O sistema apresenta os dashboards com os indicadores selecionados. |
| 5 | A Empresa Enterprise visualiza os dashboards apresentados. |  |
| 6 |  | O sistema mantém os dashboards disponíveis para consulta ou para alterar os indicadores desejados. |

**Fluxos alternativos**

| Passo | Ator | Sistema |
|---|---|---|
| 1 |  | O sistema apresenta o módulo de BI e os indicadores disponíveis para consulta. |
| 2 | A Empresa Enterprise seleciona os indicadores desejados mas de outra empresa. |  |
| 3 |  | O sistema verifica a permissão de acesso aos dados solicitados. |
| 4 |  | O sistema identifica que os dados pertencem a outra empresa. |
| 5 |  | O sistema bloqueia o acesso aos dados e apresenta uma mensagem de acesso não permitido, conforme a RN21 – Acesso ao BI. |

<a id="uc-18"></a>

### UC-18 · Emitir Relatórios

| Campo | Valor |
|---|---|
| Identificador | UC-18 (planilha: JGR018) |
| Requisito | RF18 |
| Regras de negócio | RN22 |
| Prioridade | Should |
| Objetivo | Permite gerar relatórios operacionais e gerenciais. |
| Atores | Usuário-empresa |
| Pré-condições | O usuário deve estar autenticado no sistema com perfil de Empresa Enterprise e possuir permissão para emissão de relatórios. |
| Pós-condições (garantia de sucesso) | Relatório operacional ou gerencial gerado conforme as permissões do usuário. |
| Classes envolvidas | Relatorio |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 |  | O sistema apresenta a interface de relatórios e os filtros disponíveis. |
| 2 | A Empresa Enterprise seleciona os filtros desejados. |  |
| 3 |  | O sistema processa os dados e gera o relatório. |
| 4 |  | O sistema exibe os resultados na tela. |

**Fluxos alternativos**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário tenta acessar ou gerar um relatório. |  |
| 2 |  | O sistema verifica a restrição de acesso. |
| 3 |  | O sistema bloqueia a ação e o relatório não é exibido (RN22 – Acesso a Relatórios). |

<a id="uc-19"></a>

### UC-19 · Gerenciar Funcionários

| Campo | Valor |
|---|---|
| Identificador | UC-19 (planilha: JGR019) |
| Requisito | RF19 |
| Regras de negócio | RN02, RN20, RN23 |
| Prioridade | Must |
| Objetivo | Permitir cadastrar, editar e remover funcionários controlando o acesso da equipe (que é feito pelo caso 016) |
| Atores | Usuário-empresa, usuário-funcionário, sistema |
| Pré-condições | Existem perfis de acesso definidos pela organização (RN20). |
| Pós-condições (garantia de sucesso) | Funcionário cadastrado e ativo após confirmar o e-mail; funcionário removido sem nenhum acesso ativo. |
| Classes envolvidas | FuncionarioEnterprise, PerfilAcesso, Sessao |

**Fluxo principal 1 - Cadastrar funcionário**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário-empresa acessa o módulo de funcionários. |  |
| 2 |  | O sistema exibe a lista de funcionários e as opções de cadastrar, editar e remover |
| 3 | O usuário-empresa seleciona a opção de cadastrar |  |
| 4 |  | O sistema solicita os dados do funcionário |
| 5 | O usuário-empresa informa os dados obrigatórios (ex.: nome, CPF, e-mail e perfil de acesso) |  |
| 6 |  | O sistema valida os dados e o perfil de acesso escolhido (RN20) |
| 7 |  | O sistema verifica se o funcionário já está cadastrado |
| 8 |  | O sistema registra o funcionário vinculado à empresa |
| 9 |  | O sistema envia o e-mail de confirmação ao funcionário |
| 10 | O funcionário confirma o e-mail recebido |  |
| 11 |  | O sistema ativa a conta do funcionário (RN02) |
| 12 |  | A operação é finalizada |

**Fluxo Alternativo 1 - Editar funcionário (ramifica no passo 3)**

| Passo | Ator | Sistema |
|---|---|---|
| FA01.1 | A empresa seleciona a opção de editar e escolhe o funcionário |  |
| FA01.2 |  | O sistema exibe os dados atuais do funcionário |
| FA01.3 | A empresa altera os dados |  |
| FA01.4 |  | O sistema valida os dados e o perfil de acesso (RN20) |
| FA01.5 |  | O sistema salva as alterações e exibe a confirmação |
| FA01.6 |  | A operação é finalizada. |

**Fluxo Alternativo 2 - Remover funcionário (ramifica no passo 3)**

| Passo | Ator | Sistema |
|---|---|---|
| FA02.1 | A empresa seleciona a opção de remover e escolhe o funcionário |  |
| FA02.2 |  | O sistema solicita a confirmação da remoção |
| FA02.3 | A empresa confirma a remoção |  |
| FA02.4 |  | O sistema remove o funcionário e revoga imediatamente todos os seus acessos ativos (RN23) |
| FA02.5 |  | O sistema exibe a confirmação da remoção |
| FA02.6 |  | Operação é finalizada pelo sistema. |

**Fluxo Alternativo 3 - Remoção cancelada (ramifica no FA02, passo 3)**

| Passo | Ator | Sistema |
|---|---|---|
| FA03.1 | A empresa cancela a remoção |  |
| FA03.2 |  | O sistema mantém o funcionário e seus acessos inalterados |
| FA03.3 |  | A operação é finalizada |

**Fluxo Alternativo 4 - Dados inválidos, campos obrigatórios ausentes ou perfil não previsto (ramifica no passo 6 e no FA01, passo 4)**

| Passo | Ator | Sistema |
|---|---|---|
| FA04.1 |  | O sistema identifica dados inválidos, campos obrigatórios não preenchidos ou perfil de acesso não previsto pela organização (RN20) |
| FA04.2 |  | O sistema exibe mensagem de erro indicando o que deve ser corrigido |
| FA04.3 | A empresa corrige os dados |  |
| FA04.4 |  | O fluxo retorna ao passo 6 do fluxo principal (ou ao passo 4 do FA01, se for edição) |

**Fluxo alternativo 5 - Funcionário já cadastrado (ramifica no passo 7)**

| Passo | Ator | Sistema |
|---|---|---|
| FA05.1 |  | O sistema identifica que o funcionário já possui cadastro |
| FA05.2 |  | O sistema exibe mensagem de erro |
| FA05.3 | A empresa corrige os dados |  |
| FA05.4 |  | O fluxo retorna ao passo 5 do fluxo principal |

**Fluxo alternativo 6 - E-mail não confirmado (ramifica no passo 10)**

| Passo | Ator | Sistema |
|---|---|---|
| FA06.1 | O funcionário não confirma o e-mail recebido |  |
| FA06.2 |  | O sistema mantém a conta do funcionário inativa (RN02) |
| FA06.3 |  | A operação é finalizada |

<a id="uc-20"></a>

### UC-20 · Consultar Pets Vinculados

| Campo | Valor |
|---|---|
| Identificador | UC-20 (planilha: JGR020) |
| Requisito | RF20 |
| Regras de negócio | RN24 |
| Prioridade | Should |
| Objetivo | Permitir consultar informações dos pets vinculados à empresa. |
| Atores | Usuário-empresa, usuário-funcionário |
| Pré-condições | O usuário deve estar autenticado no sistema |
| Pós-condições (garantia de sucesso) | Nenhum dado alterado; somente pets vinculados exibidos. |
| Classes envolvidas | Pet, CompartilhamentoPet, Agendamento |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário acessa a tela de pets vinculados. |  |
| 2 |  | O sistema recupera os registros autorizados. |
| 3 |  | O sistema exibe a lista de pets. |

**Fluxos alternativos**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário tenta visualizar os dados de um pet específico. |  |
| 2 |  | O sistema verifica a ausência de vínculo com o pet. |
| 3 |  | O acesso às informações é negado (RN24 – Consulta de Pets Vinculados). |

<a id="uc-21"></a>

### UC-21 · Gerenciar Clientes

| Campo | Valor |
|---|---|
| Identificador | UC-21 (planilha: JGR021) |
| Requisito | RF21 |
| Regras de negócio | RN25 |
| Prioridade | Should |
| Objetivo | Permitir cadastrar e atualizar dados de clientes, com ou sem conta no Jaguara. |
| Atores | Usuário-empresa, Usuário-funcionário |
| Pré-condições | O usuário deve estar autenticado no sistema |
| Pós-condições (garantia de sucesso) | Cliente vinculado à empresa com consentimento LGPD registrado; se o cliente tem conta, o cadastro fica ligado ao tutor. |
| Classes envolvidas | Cliente, Tutor, Pet |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário acessa o módulo de clientes. |  |
| 2 | O usuário seleciona cadastrar, visualizar, editar ou excluir e informa os dados. |  |
| 3 |  | O sistema valida as informações e os consentimentos e procura uma conta de tutor com o CPF ou o e-mail informado. |
| 4 |  | O sistema salva o cadastro, ligado à conta do tutor quando ela existe. |

**Fluxos alternativos**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário insere e envia os dados do cliente. |  |
| 2 |  | O sistema identifica dados inválidos ou sem o devido consentimento. |
| 3 |  | O sistema bloqueia a gravação do cadastro (RN25 – Proteção de Dados de Clientes). |

**Fluxo alternativo: cliente sem conta no Jaguara**

| Passo | Ator | Sistema |
|---|---|---|
| 3a |  | O sistema não encontra conta de tutor e salva o cliente com os dados de contato informados. |
| 3b | O usuário cadastra os pets atendidos desse cliente. |  |
| 3c |  | Se houver e-mail, o sistema envia convite para o cliente criar conta; ao criar, o tutor assume os pets como responsável principal (ADR-010). |

<a id="uc-22"></a>

### UC-22 · Visualizar Perfil do Pet

| Campo | Valor |
|---|---|
| Identificador | UC-22 (planilha: JGR022) |
| Requisito | RF22 |
| Regras de negócio | RN26 |
| Prioridade | Should |
| Objetivo | Permitir consultar o histórico e informações completas do pet |
| Atores | Usuário-empresa, Usuário-funcionário |
| Pré-condições | O usuário deve estar autenticado no sistema |
| Pós-condições (garantia de sucesso) | Nenhum dado alterado; acesso ao perfil registrado em auditoria. |
| Classes envolvidas | Pet, CompartilhamentoPet |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário seleciona um pet na listagem. |  |
| 2 |  | O sistema verifica a autorização de acesso ao perfil. |
| 3 |  | O sistema exibe o perfil completo do pet. |

**Fluxos alternativos**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário seleciona um pet na listagem. |  |
| 2 |  | O sistema identifica que o usuário não tem permissão para aquele pet. |
| 3 |  | O sistema nega o acesso ao perfil (RN26 – Acesso ao Perfil do Pet). |

<a id="uc-23"></a>

### UC-23 · Registrar Serviços e Atendimentos

| Campo | Valor |
|---|---|
| Identificador | UC-23 (planilha: JGR023) |
| Requisito | RF23 |
| Regras de negócio | RN20, RN26, RN27, RN28, RN30 |
| Prioridade | Must |
| Objetivo | Permitir que o usuário-enterprise ou seus funcionários registrem, em uma única operação unificada nascida de um agendamento ocorrido (JGR024), os serviços prestados e atendimentos clínicos aos pets, incluindo procedimentos, valor, observações clínicas e finalização com auditoria. |
| Atores | Usuário-empresa, usuário-funcionário, sistema |
| Pré-condições | O usuário deve estar autenticado com perfil de empresa ou funcionário enterprise e possuir permissão ativa para registrar serviços e atendimentos (RN20, RN26, RN30). |
| Pós-condições (garantia de sucesso) | Atendimento registrado com itens cobrados pelo preço contratado; atendimento finalizado só muda com auditoria. |
| Classes envolvidas | Atendimento, ItemAtendimento, Agendamento, Servico |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário seleciona um agendamento já ocorrido a partir da agenda (JGR024). |  |
| 2 |  | O sistema abre o formulário de registro preenchendo automaticamente os dados do serviço, do pet e da data. |
| 3 | O usuário preenche o valor realizado, observações, procedimentos e observações clínicas pertinentes, e aciona a opção de "Finalizar registro". |  |
| 4 |  | O sistema valida os campos obrigatórios e as permissões de preenchimento clínico (RN26, RN30). |
| 5 |  | O sistema grava o registro de atendimento vinculado ao pet, aplica o bloqueio de alteração sem auditoria (RN28) e finaliza a operação. |

**Fluxo Alternativo FA1. Dados inválidos ou ausentes (ramifica no passo 4)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário preenche o formulário com dados incorretos ou campos obrigatórios vazios e tenta finalizar. |  |
| 2 |  | O sistema identifica as falhas ou ausências, exibe mensagem de erro orientando a correção e bloqueia a gravação. |

**FA2. Agendamento não encontrado ou já registrado (ramifica no passo 2)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário tenta acessar um agendamento inexistente ou que já possui atendimento registrado. |  |
| 2 |  | O sistema detecta a inconsistência, exibe um alerta informando que o registro já foi efetuado ou que o agendamento não é válido, e encerra a operação. |

**FA3. Usuário sem permissão para preenchimento clínico (ramifica no passo 4)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O operador sem privilégios clínicos tenta salvar dados restritos de atendimento médico. |  |
| 2 |  | O sistema valida os papéis (RN26, RN30), identifica a falta de permissão, bloqueia os campos clínicos e exibe aviso de restrição de acesso. |

**FA4. Sessão expirada (ramifica em qualquer etapa)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário tenta concluir o registro com a sessão inativa. |  |
| 2 |  | O sistema detecta a expiração do token de acesso e redireciona para a tela de autenticação (JGR002). |

<a id="uc-24"></a>

### UC-24 · Controlar agenda

| Campo | Valor |
|---|---|
| Identificador | UC-24 (planilha: JGR024) |
| Requisito | RF25 |
| Regras de negócio | RN14, RN20, RN29, RN38 |
| Prioridade | Must |
| Objetivo | Permitir que a empresa e os funcionários visualizem a agenda semanal com os serviços agendados e as solicitações pendentes, e gerenciem agendamentos e horários de atuação. |
| Atores | Usuário-empresa, usuário-funcionário, sistema |
| Pré-condições | O usuário está autenticado como empresa ou funcionário enterprise, com permissão para acessar a agenda (RN20). |
| Pós-condições (garantia de sucesso) | Agenda e horários de atuação atualizados sem sobreposição. |
| Classes envolvidas | Agendamento, HorarioAtuacao, Recurso, FuncionarioEnterprise |

**Fluxo principal (visualizar agenda)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário acessa a agenda. |  |
| 2 |  | O sistema exibe a semana atual, com cada dia em uma coluna, mostrando os horários de atuação, os cards dos serviços agendados (serviço, pet, horário, profissional e recurso) e a indicação de solicitações pendentes por horário. |
| 3 | O usuário navega entre as semanas e, se desejar, filtra por profissional ou recurso. |  |
| 4 |  | O sistema atualiza a visualização da agenda. |
| 5 | O usuário seleciona um card de serviço agendado. |  |
| 6 |  | O sistema exibe os detalhes do agendamento e, conforme o horário, as opções de editar e cancelar (agendamento futuro) ou de registrar o atendimento (agendamento já ocorrido). |
| 7 |  | A operação é finalizada. |

**FA1. Agendar novo horário (ramifica no passo 2)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário seleciona "agendar novo horário". |  |
| 2 |  | O sistema direciona o usuário para o agendamento de serviço (JGR039), com o formulário vazio. |
| 3 |  | Após a conclusão do agendamento, o sistema atualiza a agenda e retorna ao passo 2 do fluxo principal. |

**FA2. Consultar solicitação pendente (ramifica no passo 2)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário seleciona a indicação de solicitação pendente em um horário. |  |
| 2 |  | O sistema direciona o usuário para a tela de solicitações de serviço (JGR041). |
| 3 |  | A operação é finalizada. |

**FA3. Editar agendamento (ramifica no passo 6)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário seleciona "editar". |  |
| 2 |  | O sistema verifica se o agendamento ainda está ativo e habilita a edição de horário, profissional e recurso. |
| 3 | O usuário altera os dados e confirma. |  |
| 4 |  | O sistema verifica conflitos de agenda (RN14, RN29). |
| 5 |  | O sistema atualiza o agendamento e notifica o tutor (JGR031). |
| 6 |  | O fluxo retorna ao passo 2 do fluxo principal. |

**FA4. Conflito na edição (ramifica no FA3, passo 4)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário altera os dados. |  |
| 2 |  | O sistema identifica conflito para o pet, o profissional ou o recurso (RN14, RN29). |
| 3 |  | O sistema bloqueia a alteração e informa o conflito. |
| 4 |  | O fluxo retorna ao passo 4 do FA3. |

**FA5. Cancelar agendamento (ramifica no passo 6)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário seleciona "cancelar agendamento". |  |
| 2 |  | O sistema verifica se o agendamento ainda está ativo e solicita a confirmação. |
| 3 | O usuário confirma o cancelamento. |  |
| 4 |  | O sistema libera o horário na agenda. |
| 5 |  | Se o agendamento veio de uma solicitação, o sistema atualiza o status dela para "cancelado" e registra no histórico com a empresa como autora do cancelamento (RN38). |
| 6 |  | O sistema notifica o tutor (JGR031). |
| 7 |  | O fluxo retorna ao passo 2 do fluxo principal. |

**FA6. Cancelamento não confirmado (ramifica no FA5, passo 3)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário desiste do cancelamento. |  |
| 2 |  | O sistema mantém o agendamento inalterado. |
| 3 |  | A operação é finalizada. |

**FA7. Cadastrar horário de atuação (ramifica no passo 2)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário seleciona "novo horário de atuação". |  |
| 2 | O usuário define profissional ou recurso, dias e período. |  |
| 3 |  | O sistema valida os dados e verifica sobreposição (RN29). |
| 4 |  | O sistema registra o horário de atuação. |
| 5 |  | O fluxo retorna ao passo 2 do fluxo principal. |

**FA8. Editar horário de atuação (ramifica no passo 2)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário seleciona um horário de atuação e clica em "editar". |  |
| 2 | O usuário altera os dados. |  |
| 3 |  | O sistema valida os dados, verifica sobreposição e checa se há agendamentos já existentes no período (RN29). |
| 4 |  | O sistema atualiza o horário de atuação. |
| 5 |  | O fluxo retorna ao passo 2 do fluxo principal. |

**FA9. Excluir horário de atuação (ramifica no passo 2)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário seleciona um horário de atuação e clica em "excluir". |  |
| 2 |  | O sistema verifica agendamentos existentes no período antes de pedir confirmação. |
| 3 | O usuário confirma a exclusão. |  |
| 4 |  | O sistema remove o horário de atuação. |
| 5 |  | O fluxo retorna ao passo 2 do fluxo principal. |

**FA10. Registrar atendimento (ramifica no passo 6)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário seleciona "registrar o atendimento" em um agendamento já ocorrido. |  |
| 2 |  | O sistema direciona o usuário para o caso de uso de registrar atendimento (JGR023) com os dados do agendamento preenchidos. |
| 3 |  | A operação é finalizada. |

**FA11. Agendamento já cancelado (ramifica no passo 6)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário seleciona um agendamento que já se encontra cancelado (ex.: cancelado pelo tutor no JGR042). |  |
| 2 |  | O sistema exibe o aviso de que o agendamento está cancelado e desabilita as ações de edição. |
| 3 |  | A operação é finalizada. |

**FA12. Sessão expirada (ramifica em qualquer etapa)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário tenta realizar uma ação com a sessão expirada. |  |
| 2 |  | O sistema detecta a inatividade e redireciona para a tela de autenticação (JGR002). |

**FA13. Sobreposição ou agendamentos existentes no período (ramifica nos FA7, FA8 e FA9)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O sistema identifica sobreposição de horários ou agendamentos afetados (RN29). |  |
| 2 |  | O sistema bloqueia a ação e informa o motivo. |
| 3 | O usuário ajusta os dados, remarca ou cancela os agendamentos correspondentes (FA3, FA5). |  |
| 4 |  | O fluxo retorna ao passo 2 do fluxo principal. |

**FA14. Agenda sem horários de atuação (ramifica no passo 2)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O sistema identifica que não há horários de atuação cadastrados para o período. |  |
| 2 |  | O sistema exibe a mensagem "Nenhum horário de atuação cadastrado" e oferece a opção de cadastro (FA7). |
| 3 |  | A operação é finalizada. |

**Fluxo Alternativo 10 – Sobreposição ou agendamentos existentes no período (ramifica nos FA07, FA08 e FA09)**

| Passo | Ator | Sistema |
|---|---|---|
| FA10-1 |  | O sistema identifica sobreposição de horários ou agendamentos no período afetado (RN29) |
| FA10-2 |  | O sistema bloqueia a ação e informa o motivo |
| FA10-3 | O usuário ajusta os dados ou remarca ou cancela os agendamentos (FA03, FA05) |  |
| FA10-4 |  | O fluxo retorna ao passo 2 do fluxo principal |

**Fluxo Alternativo 11 – Agenda sem horários de atuação (ramifica no passo 2)**

| Passo | Ator | Sistema |
|---|---|---|
| FA11-1 |  | O sistema identifica que não há horários de atuação cadastrados |
| FA11-2 |  | O sistema exibe a mensagem "Nenhum horário de atuação cadastrado" e oferece o cadastro (FA07) |
| FA11-3 |  | A operação é finalizada |

<a id="uc-25"></a>

### UC-25 · Monitorar Desempenho e Logs

| Campo | Valor |
|---|---|
| Identificador | UC-25 (planilha: JGR025) |
| Requisito | RF26 |
| Regras de negócio | RN31 |
| Prioridade | Could |
| Objetivo | Permitir a visualização das métricas de desempenho do sistema, dashboards e logs. |
| Atores | Administrador |
| Pré-condições | O administrador deve estar autenticado e posicionado na tela de monitoramento de desempenho. |
| Pós-condições (garantia de sucesso) | Nenhum dado alterado; métricas e logs exibidos. |
| Classes envolvidas | LogAuditoria |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O administrador acessa a tela de monitoramento. |  |
| 2 |  | O sistema exibe as métricas de desempenho e dashboards. |
| 3 | O administrador seleciona um log específico para consulta. |  |
| 4 |  | O sistema localiza e apresenta os registros de log correspondentes. |
| 5 |  | A operação é finalizada. |

**Fluxo Alternativo FA1. Log solicitado não existe (ramifica no passo 3)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O administrador busca por um log inexistente ou fora do período. |  |
| 2 |  | O sistema identifica que o registro não existe. |
| 3 |  | O sistema exibe uma mensagem informando a ausência do registro e encerra a operação. |

**FA2. Sessão expirada (ramifica no passo 1)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O administrador tenta acessar o monitoramento com a sessão inativa. |  |
| 2 |  | O sistema detecta a expiração do token e redireciona para a tela de autenticação (JGR002). |

<a id="uc-26"></a>

### UC-26 · Prestar Suporte Operacional

| Campo | Valor |
|---|---|
| Identificador | UC-26 (planilha: JGR026) |
| Requisito | RF27 |
| Regras de negócio | RN32 |
| Prioridade | Could |
| Objetivo | Permitir que o administrador execute ações corretivas em solicitações de suporte e chamados. |
| Atores | Administrador |
| Pré-condições | O administrador deve estar autenticado e na tela de suporte operacional. |
| Pós-condições (garantia de sucesso) | Intervenção registrada no chamado e na auditoria. |
| Classes envolvidas | ChamadoSuporte, IntervencaoSuporte, LogAuditoria |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O administrador acessa a central e seleciona uma solicitação de suporte. |  |
| 2 |  | O sistema exibe os detalhes do chamado. |
| 3 | O administrador analisa o problema e executa a ação corretiva necessária. |  |
| 4 |  | O sistema valida e registra a intervenção realizada no histórico. |
| 5 |  | A operação é finalizada. |

**Fluxo Alternativo FA1. Chamado com informações insuficientes (ramifica no passo 3)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O administrador identifica que o chamado carece de dados essenciais para a correção. |  |
| 2 |  | O sistema exibe a opção e dispara o pedido de complementação de informações ao solicitante. |
| 3 |  | A operação é pausada aguardando retorno. |

**FA2. Sessão expirada (ramifica no passo 1)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O administrador tenta interagir com o suporte com a sessão inativa. |  |
| 2 |  | O sistema detecta a expiração do token e redireciona para a tela de autenticação (JGR002). |

**Fluxos alternativos**

| Passo | Ator | Sistema |
|---|---|---|
| 2a |  | O chamado não possui informações suficientes. |
| 2b |  | O sistema solicita complementação. |

<a id="uc-27"></a>

### UC-27 · Gerenciar Integrações

| Campo | Valor |
|---|---|
| Identificador | UC-27 (planilha: JGR027) |
| Requisito | RF28 |
| Regras de negócio | RN33 |
| Prioridade | Could |
| Objetivo | Permitir que o administrador crie, edite e exclua integrações de serviços externos. |
| Atores | Administrador |
| Pré-condições | O administrador deve estar autenticado e na tela de integrações. |
| Pós-condições (garantia de sucesso) | Integração criada, alterada ou excluída e validada. |
| Classes envolvidas | Integracao |

**Fluxo principal (Criar Integração)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O administrador acessa as integrações e seleciona "Criar integração". |  |
| 2 |  | O sistema exibe o formulário de configuração. |
| 3 | O administrador configura os parâmetros necessários e confirma. |  |
| 4 |  | O sistema valida os dados da integração. |
| 5 |  | O sistema salva a nova integração. |
| 6 |  | O sistema exibe a integração criada na listagem e finaliza a operação. |

**Fluxo principal (Editar Integração)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O administrador seleciona uma integração existente e clica em "Editar". |  |
| 2 |  | O sistema exibe os dados atuais da integração. |
| 3 | O administrador altera os parâmetros e confirma. |  |
| 4 |  | O sistema valida as novas informações. |
| 5 |  | O sistema salva as alterações. |
| 6 |  | O sistema atualiza e exibe a integração atualizada, finalizando a operação. |

**Fluxo principal (Excluir Integração)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O administrador seleciona uma integração e clica em "Excluir". |  |
| 2 |  | O sistema exibe uma janela de confirmação de exclusão. |
| 3 | O administrador confirma a exclusão. |  |
| 4 |  | O sistema remove a integração da base de dados e finaliza a operação. |

**Fluxo Alternativo FA1. Ausência de permissão na criação/edição (ramifica nos fluxos principais)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O administrador tenta salvar a integração sem privilégios suficientes. |  |
| 2 |  | O sistema identifica a restrição de perfil, bloqueia a operação (RN33) e exibe uma mensagem de erro. |

**FA2. Dados inválidos ou configuração incompatível (ramifica na edição/criação)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O administrador preenche parâmetros incorretos. |  |
| 2 |  | O sistema detecta a incompatibilidade, bloqueia a gravação e solicita a correção dos dados. |

**FA3. Cancelamento da exclusão (ramifica na exclusão)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O administrador clica em cancelar na confirmação de exclusão. |  |
| 2 |  | O sistema mantém a integração cadastrada inalterada e encerra a operação. |

<a id="uc-28"></a>

### UC-28 · Gerenciar Contas de Usuários

| Campo | Valor |
|---|---|
| Identificador | UC-28 (planilha: JGR028) |
| Requisito | RF29 |
| Regras de negócio | RN34 |
| Prioridade | Should |
| Objetivo | Permitir que o administrador suspenda, bloqueie ou reative contas de usuários da plataforma. |
| Atores | Administrador |
| Pré-condições | O administrador deve estar autenticado e na tela de gestão de contas. |
| Pós-condições (garantia de sucesso) | Status da conta alterado e registrado em auditoria. |
| Classes envolvidas | Usuario, LogAuditoria |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O administrador acessa a gestão de contas e seleciona um usuário. |  |
| 2 |  | O sistema exibe o perfil e o status atual da conta. |
| 3 | O administrador escolhe a ação de bloquear, suspender ou reativar e confirma. |  |
| 4 |  | O sistema executa a alteração de status da conta. |
| 5 |  | O sistema registra o evento na auditoria do sistema. |
| 6 |  | A operação é finalizada com sucesso. |

**Fluxo Alternativo FA1. Falha na execução da ação (ramifica no passo 4)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O administrador tenta aplicar o bloqueio/suspensão. |  |
| 2 |  | O sistema identifica uma inconsistência na base de dados e não conclui o registro. |
| 3 |  | O sistema exibe um aviso de falha e cancela a operação com segurança. |

**FA2. Sessão expirada (ramifica no passo 1)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O administrador tenta gerenciar contas com a sessão inativa. |  |
| 2 |  | O sistema detecta a expiração do token e redireciona para a tela de autenticação (JGR002). |

<a id="uc-29"></a>

### UC-29 · Gerenciar Permissões Globais

| Campo | Valor |
|---|---|
| Identificador | UC-29 (planilha: JGR029) |
| Requisito | RF30 |
| Regras de negócio | RN35 |
| Prioridade | Should |
| Objetivo | Permitir que o administrador altere as permissões de acesso do sistema para os diferentes perfis de usuários. |
| Atores | Administrador |
| Pré-condições | O administrador deve estar autenticado e na tela de permissões globais. |
| Pós-condições (garantia de sucesso) | Perfil global alterado, com efeito imediato. |
| Classes envolvidas | PerfilAcesso, Permissao |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O administrador acessa permissões globais e seleciona um perfil ou regra. |  |
| 2 |  | O sistema exibe a matriz de acesso atual do perfil selecionado. |
| 3 | O administrador realiza as alterações desejadas e confirma. |  |
| 4 |  | O sistema valida e confirma a alteração na matriz de acesso. |
| 5 |  | O sistema aplica as mudanças em vigor imediatamente. |
| 6 |  | A operação é finalizada. |

**Fluxo Alternativo FA1. Inconsistência na regra de permissão (ramifica no passo 4)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O administrador submete uma alteração com conflito hierárquico ou estrutural. |  |
| 2 |  | O sistema identifica a inconsistência lógica, rejeita a modificação e exibe um alerta explicativo. |
| 3 |  | O fluxo retorna à tela de edição de permissões. |

<a id="uc-30"></a>

### UC-30 · Gerenciar Webhooks

| Campo | Valor |
|---|---|
| Identificador | UC-30 (planilha: JGR030) |
| Requisito | RF31 |
| Regras de negócio | RN36 |
| Prioridade | Could |
| Objetivo | Permitir que o administrador visualize, crie, edite e exclua webhooks de integração do sistema. |
| Atores | Administrador |
| Pré-condições | O administrador deve estar autenticado e na tela de gerenciamento de webhooks. |
| Pós-condições (garantia de sucesso) | Webhook salvo com URL segura e autenticação. |
| Classes envolvidas | Webhook, Integracao |

**Fluxo principal (Visualizar)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O administrador acessa a tela de webhooks. |  |
| 2 |  | O sistema apresenta a listagem de webhooks cadastrados. |
| 3 | O administrador seleciona um webhook para ver detalhes. |  |
| 4 |  | O sistema exibe os detalhes e encerra a operação. |

**Fluxo principal (Criar)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O administrador seleciona "Criar webhook". |  |
| 2 |  | O sistema solicita a URL e parâmetros de autenticação. |
| 3 | O administrador configura e confirma. |  |
| 4 |  | O sistema valida a configuração e o endpoint. |
| 5 |  | O sistema salva o webhook e exibe o cadastro concluído, encerrando a operação. |

**Fluxo principal (Editar)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O administrador seleciona um webhook e clica em "Editar". |  |
| 2 |  | O sistema exibe os parâmetros atuais do webhook. |
| 3 | O administrador altera os dados e confirma. |  |
| 4 |  | O sistema valida a nova configuração. |
| 5 |  | O sistema salva as alterações e atualiza a listagem, encerrando a operação. |

**Fluxo principal (Excluir)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O administrador seleciona um webhook e clica em "Excluir". |  |
| 2 |  | O sistema solicita confirmação de exclusão. |
| 3 | O administrador confirma a exclusão. |  |
| 4 |  | O sistema remove o webhook da base de dados e encerra a operação. |

**Fluxo Alternativo FA1. Configuração de webhook insegura (ramifica na criação/edição)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O administrador insere uma URL sem suporte a HTTPS ou parâmetros inválidos. |  |
| 2 |  | O sistema identifica a falha de segurança, bloqueia o cadastro/edição (RN36) e informa o motivo do bloqueio. |

**FA2. Cancelamento da exclusão (ramifica na exclusão)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O administrador cancela a exclusão na janela de confirmação. |  |
| 2 |  | O sistema mantém o webhook cadastrado inalterado e encerra a operação. |

<a id="uc-31"></a>

### UC-31 · Disparar notificações automáticas

| Campo | Valor |
|---|---|
| Identificador | UC-31 (planilha: JGR031) |
| Requisito | RF32 |
| Regras de negócio | RN37 |
| Prioridade | Must |
| Objetivo | Notificar o usuário sobre seus compromissos e atividades |
| Atores | Sistema |
| Pré-condições | O usuário deve ter autorizado que o sistema envie notificações |
| Pós-condições (garantia de sucesso) | Notificação enviada ou, em caso de falha, registrada e reagendada. |
| Classes envolvidas | Notificacao, ConfiguracaoNotificacao, Notificavel |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 |  | O sistema identifica um evento programado. |
| 2 |  | O sistema verifica as configurações de notificação. |
| 3 |  | O sistema calcula a antecedência definida. |
| 4 |  | O sistema gera a notificação. |
| 5 |  | O sistema envia a notificação aos responsáveis. |
| 6 |  | O sistema registra o envio. |
| 7 |  | Caso de uso encerrado. |

**Fluxos alternativos**

| Passo | Ator | Sistema |
|---|---|---|
| 5a |  | O envio falha. |
| 5b |  | O sistema registra a falha. |
| 5c |  | O sistema agenda nova tentativa. |

<a id="uc-32"></a>

### UC-32 · Cadastrar usuário enterprise

| Campo | Valor |
|---|---|
| Identificador | UC-32 (planilha: JGR032) |
| Requisito | RF01 |
| Regras de negócio | RN01, RN02 |
| Prioridade | Must |
| Objetivo | Permitir o cadastro de um usuário-empresa na plataforma, com conta ativada após a confirmação do e-mail. |
| Atores | Sistema, usuário-empresa |
| Pré-condições | A empresa não possui cadastro ativo na plataforma e está na tela de cadastro enterprise. |
| Pós-condições (garantia de sucesso) | Conta da empresa criada e ativada após a confirmação do e-mail. |
| Classes envolvidas | EmpresaEnterprise, Endereco, TokenAcesso |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | A empresa acessa a tela de cadastro enterprise |  |
| 2 |  | O sistema solicita os dados cadastrais |
| 3 | O usuário informa os dados obrigatórios (CNPJ, email e senha) |  |
| 4 |  | O sistema valida os dados preenchidos |
| 5 |  | O sistema verifica a unicidade do CNPJ (RN01) |
| 6 |  | O sistema registra o cadastro |
| 7 |  | O sistema envia o e-mail de confirmação |
| 8 | O usuário confirma o e-mail recebido |  |
| 9 |  | O sistema ativa a conta (RN02) |
| 10 |  | A operação é finalizada |

**Fluxo Alternativo 1 - Dados inválidos ou não preenchidos**

| Passo | Ator | Sistema |
|---|---|---|
| 1 |  | 1. O sistema identifica dados inválidos, não preenchidos ou CNPJ cadastrado |
| 1 |  | 2. O sistema exibe mensagem de erro e o que corrigir |
| 1 | 3. O usuário corrige os dados |  |
| 1 |  | 4. O sistema retorna ao passo 3 do fluxo principal |

**Fluxo Alternativo 2 - E-mail não confirmado**

| Passo | Ator | Sistema |
|---|---|---|
| 2 | 1. O usuário não confirma o e-mail recebido |  |
| 2 |  | 2. O sistema mantém a conta inativa |
| 2 |  | 3. Operação é finalizada. |

<a id="uc-33"></a>

### UC-33 · Visualizar catálogo de serviços

| Campo | Valor |
|---|---|
| Identificador | UC-33 (planilha: JGR033) |
| Requisito | RF39 |
| Regras de negócio | RN14, RN27, RN29, RN37, RN40 |
| Prioridade | Must |
| Objetivo | Permitir que o usuário-tutor visualize os serviços disponíveis pelas empresas prestadoras. |
| Atores | Sistema, usuário-tutor |
| Pré-condições | Usuário autenticado, o usuário-tutor está visualizando o perfil da empresa. |
| Pós-condições (garantia de sucesso) | Nenhum dado alterado; catálogo exibido. |
| Classes envolvidas | Servico, EmpresaEnterprise |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário-tutor acessa o catálogo. |  |
| 2 |  | O sistema disponibiliza todos os serviços ativos ofertados (nome, descrição e valor). |
| 3 | O usuário-tutor seleciona um dos serviços. |  |
| 4 |  | O sistema exibe os detalhes e oferece a opção de agendar. |
| 5 | O usuário-tutor opta por solicitar. |  |
| 6 |  | O sistema direciona para a solicitação de agendamento (JGR040). |
| 7 |  | Caso encerrado. |

**Fluxo Alternativo FA1. Catálogo vazio (ramifica no passo 1)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário-tutor acessa o catálogo. |  |
| 2 |  | O sistema identifica que a empresa não tem serviços ativos. |
| 3 |  | O sistema exibe a mensagem "Esta empresa não possui serviços disponíveis no momento". |
| 4 |  | Caso encerrado. |

**FA2. Serviço removido ou desativado (ramifica no passo 3)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário-tutor seleciona um serviço que foi recentemente removido ou desativado pela empresa. |  |
| 2 |  | O sistema detecta a indisponibilidade do item, exibe mensagem informando que o serviço não está mais ativo e retorna à listagem do catálogo. |

**FA3. Sessão expirada (ramifica no passo 1)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário-tutor seleciona o catálogo. |  |
| 2 |  | O sistema identifica sessão inválida. |
| 3 |  | O usuário é redirecionado para autenticação (JGR002). |
| 4 | O usuário-tutor se autentica. |  |
| 5 |  | Retorna ao passo 1 do fluxo principal. |

**FA4. Tutor encerra sem solicitar (ramifica no passo 3)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário-tutor visualiza os detalhes do serviço. |  |
| 2 | O usuário-tutor não solicita agendamento e sai da tela. |  |
| 3 |  | Operação é finalizada. |

<a id="uc-34"></a>

### UC-34 · Gerenciar documentos do pet

| Campo | Valor |
|---|---|
| Identificador | UC-34 (planilha: JGR034) |
| Requisito | RF33 |
| Regras de negócio | RN15, RN25, RN26, RN31 |
| Prioridade | Should |
| Objetivo | Permitir o gerenciamento geral dos documentos dos pets (consultar, cadastrar, atualizar e gerenciar arquivos em PDF ou imagem). |
| Atores | Usuário-tutor, sistema |
| Pré-condições | O pet precisa estar cadastrado e válido no sistema. |
| Pós-condições (garantia de sucesso) | Documento armazenado e vinculado ao pet. |
| Classes envolvidas | DocumentoPet |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário-tutor acessa a aba de documentos do pet. |  |
| 2 |  | O sistema verifica se há documentos cadastrados para o pet. |
| 3 |  | O sistema exibe a listagem dos documentos disponíveis. |
| 4 | O usuário-tutor seleciona a opção de cadastrar um novo documento e envia o arquivo. |  |
| 5 |  | O sistema valida o formato e tamanho do arquivo, armazena o documento com sucesso e atualiza a listagem. |
| 6 |  | A operação é finalizada. |

**Fluxo Alternativo FA1. Nenhum documento cadastrado (ramifica no passo 2)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário-tutor acessa a aba de documentos de um pet sem arquivos. |  |
| 2 |  | O sistema identifica a ausência de registros e exibe a mensagem "Nenhum documento cadastrado", oferecendo o botão de cadastro. |

**FA2. Arquivo em formato inválido ou corrompido (ramifica no passo 5)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário-tutor tenta enviar um documento em formato não suportado. |  |
| 2 |  | O sistema detecta a falha, exibe mensagem de erro informando os formatos permitidos (ex: PDF, PNG, JPG) e bloqueia o upload. |

**FA3. Sessão expirada (ramifica em qualquer etapa)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário tenta interagir com os documentos com a sessão inativa. |  |
| 2 |  | O sistema detecta a expiração do token de acesso e redireciona para a tela de autenticação (JGR002). |

<a id="uc-35"></a>

### UC-35 · Consultar Linha do Tempo do Pet

| Campo | Valor |
|---|---|
| Identificador | UC-35 (planilha: JGR035) |
| Requisito | RF34 |
| Regras de negócio | RN15, RN24, RN26, RN30, RN31 |
| Prioridade | Should |
| Objetivo | Disponibilizar avaliação de eventos passados e a linha do tempo unificada do pet a partir dos registros de resultados (JGR023). |
| Atores | Usuário-tutor, usuário-empresa, sistema |
| Pré-condições | O pet deve estar cadastrado no sistema. |
| Pós-condições (garantia de sucesso) | Nenhum dado alterado; linha do tempo exibida. |
| Classes envolvidas | RegistroClinico, EventoCalendario, Atendimento |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário-tutor ou usuário-empresa acessa a aba de linha do tempo. |  |
| 2 | O usuário-tutor ou usuário-empresa seleciona um pet para visualizar. |  |
| 3 |  | O sistema lê e consolida os registros de resultado (JGR023) gerados por agendamentos e atendimentos passados, exibindo o histórico cronológico de eventos do pet. |
| 4 | O usuário-tutor ou usuário-empresa consulta os detalhes da linha do tempo. |  |
| 5 |  | A operação é finalizada. |

**Fluxo Alternativo FA1. Nenhum pet cadastrado (ramifica no passo 2)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário não possui pets cadastrados na base. |  |
| 2 |  | O sistema mostra mensagem de zero resultados. |
| 3 |  | O sistema impossibilita o usuário de consultar a linha do tempo do pet. |

**FA2. Sessão expirada (ramifica no passo 1)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário tenta acessar a linha do tempo com a sessão inativa. |  |
| 2 |  | O sistema detecta a inatividade e redireciona para a tela de autenticação (JGR002). |

<a id="uc-36"></a>

### UC-36 · Gerenciar Exames do Pet

| Campo | Valor |
|---|---|
| Identificador | UC-36 (planilha: JGR036) |
| Requisito | RF35 |
| Regras de negócio | RN15, RN24, RN25, RN26, RN30, RN31 |
| Prioridade | Should |
| Objetivo | Cadastro e gerenciamento de exames avulsos realizados no pet (como radiografias e exames laboratoriais), sem exigir agendamento prévio. |
| Atores | Usuário-tutor, usuário-empresa, sistema |
| Pré-condições | O pet deve estar cadastrado no sistema e ter um perfil ativo. |
| Pós-condições (garantia de sucesso) | Exame registrado no histórico clínico do pet. |
| Classes envolvidas | Exame |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário-tutor ou usuário-empresa acessa a aba de exames. |  |
| 2 | O usuário-tutor ou usuário-empresa seleciona um pet. |  |
| 3 |  | O sistema disponibiliza o histórico dos exames avulsos realizados no pet. |
| 4 |  | O sistema disponibiliza as opções de cadastrar um novo exame. |
| 5 |  | O sistema disponibiliza as opções de editar um exame para o usuário-empresa. |
| 6 |  | O sistema disponibiliza as opções de excluir um exame para o usuário-empresa. |
| 7 | O usuário-tutor ou usuário-empresa seleciona uma opção. |  |
| 8 |  | O sistema realiza a operação correspondente e atualiza a listagem de exames. |
| 9 |  | A operação é finalizada. |

**Fluxo Alternativo FA1. Nenhum pet cadastrado (ramifica no passo 2)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário acessa a aba sem possuir pets cadastrados. |  |
| 2 |  | O sistema exibe zero resultados encontrados e direciona para a página de cadastro de pet. |

**FA2. Histórico de exames vazio (ramifica no passo 3)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário seleciona um pet que não possui exames registrados. |  |
| 2 |  | O sistema exibe o aviso de nenhum exame encontrado na base. |

**FA3. Sessão expirada (ramifica em qualquer etapa)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário tenta gerenciar exames com a sessão expirada. |  |
| 2 |  | O sistema detecta o token inválido e redireciona para a tela de autenticação (JGR002). |

<a id="uc-37"></a>

### UC-37 · Gerenciar Alergias e Restrições

| Campo | Valor |
|---|---|
| Identificador | UC-37 (planilha: JGR037) |
| Requisito | RF36 |
| Regras de negócio | RN15, RN24, RN25, RN26, RN30, RN31 |
| Prioridade | Should |
| Objetivo | Cadastro e gerenciamento de alergias e restrições de um pet |
| Atores | Usuário-tutor, usuário-empresa, sistema |
| Pré-condições | Pet deve estar cadastrado previamente |
| Pós-condições (garantia de sucesso) | Alergia ou restrição registrada e visível para os autorizados. |
| Classes envolvidas | AlergiaRestricao |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | Usuário acessa aba de restrições |  |
| 2 | Usuário seleciona um pet |  |
| 3 |  | O sistema disponibiliza todos os cadastros de alergias e restrições do pet selecionado |
| 4 |  | O sistema disponibiliza a consulta de uma restrição ou alergia |
| 5 |  | O sistema disponibiliza a opção de cadastrar uma restrição ou alergia |
| 6 |  | O sistema disponibiliza opção de editar uma restrição ou alergia |
| 7 |  | O sistema disponibiliza opção de excluir uma restrição ou alergia |
| 8 | Usuário seleciona uma das opções |  |
| 9 |  | O sistema finaliza a operação |

**Fluxos alternativos**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | Usuário acessa aba de restrições |  |
| 2 |  | O sistema reconhece usuário não autorizado |
| 3 |  | O sistema impede o acesso |
| 4 |  | Usuário retorna a página inicial |

<a id="uc-38"></a>

### UC-38 · Gerenciar Catálogo de Serviços

| Campo | Valor |
|---|---|
| Identificador | UC-38 (planilha: JGR038) |
| Requisito | RF37 |
| Regras de negócio | RN20, RN27, RN31 |
| Prioridade | Must |
| Objetivo | Permitir que o usuário-empresa ou usuário-funcionário gerencie o catálogo de serviços ofertados, incluindo cadastro (com duração estimada), consulta, edição (respeitando a RN27) e exclusão com validação. |
| Atores | Usuário-empresa, usuário-funcionário enterprise, sistema |
| Pré-condições | O usuário deve estar autenticado com perfil de empresa ou funcionário enterprise e possuir permissão ativa (RN20). |
| Pós-condições (garantia de sucesso) | Serviço salvo no catálogo; mudança de preço não altera agendamentos existentes. |
| Classes envolvidas | Servico |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário acessa a aba de catálogo de serviços. |  |
| 2 |  | O sistema exibe a listagem de serviços ativos cadastrados com suas respectivas durações, valores e descrições. |
| 3 | O usuário seleciona a opção de "Cadastrar novo serviço". |  |
| 4 |  | O sistema solicita os dados do serviço (nome, descrição, valor e duração estimada). |
| 5 | O usuário preenche os campos obrigatórios (incluindo a duração estimada) e confirma o cadastro. |  |
| 6 |  | O sistema valida os dados preenchidos, registra o novo serviço no catálogo da empresa e atualiza a listagem. |
| 7 |  | A operação é finalizada. |

**Fluxo Alternativo FA1. Editar serviço existente (ramifica no passo 2)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário seleciona um serviço da lista e clica em "Editar". |  |
| 2 |  | O sistema exibe o formulário preenchido com os dados atuais do serviço. |
| 3 | O usuário altera os dados (como nome, valor ou duração estimada) e confirma. |  |
| 4 |  | O sistema valida os novos dados informados. |
| 5 |  | O sistema atualiza o serviço no catálogo. Conforme a regra RN27, a alteração de preço não afeta os serviços que já foram contratados anteriormente. |
| 6 |  | O fluxo retorna à listagem do catálogo. |

**FA2. Excluir serviço (ramifica no passo 2)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário seleciona um serviço e clica em "Excluir". |  |
| 2 |  | O sistema exibe uma janela de confirmação de exclusão. |
| 3 | O usuário confirma a exclusão. |  |
| 4 |  | O sistema remove o serviço do catálogo ativo e atualiza a listagem. |
| 5 |  | A operação é finalizada. |

**FA3. Desistência da exclusão (ramifica no FA2, passo 2)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário clica em cancelar na janela de confirmação. |  |
| 2 |  | O sistema descarta a ação de exclusão, mantém o serviço inalterado e retorna à listagem. |

**FA4. Dados inválidos ou ausentes no cadastro/edição (ramifica nos FA1 ou Passo 5)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário tenta salvar o serviço com campos obrigatórios vazios ou duração inválida. |  |
| 2 |  | O sistema identifica as falhas, exibe mensagem de erro orientando a correção e bloqueia a gravação. |

**FA5. Acesso não autorizado (ramifica no passo 1)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | Um usuário sem permissão enterprise tenta acessar o catálogo. |  |
| 2 |  | O sistema detecta a ausência de privilégios, bloqueia o acesso, exibe mensagem de restrição e redireciona para a página inicial. |

**FA6. Sessão expirada (ramifica em qualquer etapa)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário tenta interagir com o catálogo com a sessão inativa. |  |
| 2 |  | O sistema detecta a expiração do token de acesso e redireciona para a tela de autenticação (JGR002). |

<a id="uc-39"></a>

### UC-39 · Agendar Serviço (empresa)

| Campo | Valor |
|---|---|
| Identificador | UC-39 (planilha: JGR039) |
| Requisito | RF38 |
| Regras de negócio | RN14, RN20, RN24, RN29, RN37 |
| Prioridade | Must |
| Objetivo | Organizar, validar e registrar o agendamento de um serviço prestado pela empresa para um pet autorizado, seja de forma direta pela agenda ou a partir da conversão de uma solicitação aceita. |
| Atores | Usuário-empresa, usuário-funcionário, sistema |
| Pré-condições | O usuário-empresa ou funcionário deve estar autenticado e com permissão ativa (RN20); o serviço deve estar ativo no catálogo (JGR038); e os horários de atuação e recursos devem estar cadastrados na agenda. |
| Pós-condições (garantia de sucesso) | Agendamento criado sem conflitos e tutor notificado. |
| Classes envolvidas | Agendamento, EventoCalendario, Notificacao |

**Fluxo principal (Entrada 1: Agendamento Direto pela Agenda)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário-empresa/funcionário acessa a agenda e clica em "Agendar novo horário". |  |
| 2 |  | O sistema exibe o formulário de agendamento vazio. |
| 3 | O usuário seleciona o serviço, o profissional/recurso, a data, o horário e o pet do tutor. |  |
| 4 | O usuário revisa os dados preenchidos e confirma o agendamento. |  |
| 5 |  | O sistema valida se os campos estão preenchidos corretamente, se o horário está dentro do horário de atuação e se há conflitos de agenda para o pet, profissional ou recurso (RN14 e RN29). |
| 6 |  | O sistema registra o agendamento direto na agenda (JGR024) com status definitivo, bloqueia o horário, notifica o tutor (JGR031) e adiciona o evento no calendário do tutor (JGR010). |
| 7 |  | A operação é finalizada. |

**Fluxo principal (Entrada 2: Conversão de Solicitação Aceita)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário-empresa/funcionário clica em "Aceitar" em uma solicitação pendente (JGR041). |  |
| 2 |  | O sistema redireciona para o JGR039 com o formulário pré-preenchido com os dados enviados pelo tutor (serviço, pet e horário escolhido). |
| 3 | O usuário ajusta, se necessário, o profissional/recurso e confirma a conversão do agendamento. |  |
| 4 |  | O sistema valida os dados e a ausência de conflitos (RN14 e RN29). |
| 5 |  | O sistema atualiza o status da solicitação para "aceito", grava o agendamento definitivo na agenda (JGR024), bloqueia o horário, notifica o tutor (JGR031) e o insere no calendário do tutor (JGR010). |
| 6 |  | A operação é finalizada. |

**Fluxo Alternativo FA1 – Dados inválidos ou ausentes (Ramifica no preenchimento)**

| Passo | Ator | Sistema |
|---|---|---|
|  | O usuário preenche o formulário com dados incorretos ou campos obrigatórios vazios e tenta confirmar. |  |
| 1 |  | O sistema identifica os erros ou campos pendentes. |
| 2 |  | O sistema exibe uma mensagem indicando o que deve ser corrigido. |
|  |  | O fluxo retorna ao ponto de preenchimento do formulário. |

**Fluxo Alternativo FA2 – Conflito de agenda (pet, profissional ou recurso ocupado - RN14 e RN29)**

| Passo | Ator | Sistema |
|---|---|---|
|  | O usuário seleciona um horário que já possui conflito. |  |
| 1 |  | O sistema detecta o choque de horário no momento da validação. |
| 2 |  | O sistema bloqueia a conclusão, exibe uma mensagem de conflito detalhando o motivo (pet, profissional ou recurso indisponível) e solicita a alteração do horário ou recurso. |

**Fluxo Alternativo FA3 – Horário fora do horário de atuação**

| Passo | Ator | Sistema |
|---|---|---|
|  | O usuário escolhe um horário fora da grade de atendimento cadastrada. |  |
| 1 |  | O sistema identifica que o horário é inválido para a operação. |
| 2 |  | O sistema exibe mensagem de alerta informando que o horário está fora do expediente e bloqueia a gravação. |

**Fluxo Alternativo FA4 – Nenhum serviço ativo no catálogo**

| Passo | Ator | Sistema |
|---|---|---|
|  | O usuário tenta agendar, mas não há serviços ativos cadastrados. |  |
| 1 |  | O sistema identifica que o catálogo está vazio. |
| 2 |  | O sistema exibe um aviso orientando o cadastro prévio de serviços (JGR038) e encerra a operação. |

**Fluxo Alternativo FA5 – Solicitação deixou de estar pendente (Cancelada, recusada ou já agendada por outro usuário - Entrada 2)**

| Passo | Ator | Sistema |
|---|---|---|
|  | O usuário tenta aceitar uma solicitação que já foi alterada ou cancelada pelo tutor/outro operador. |  |
| 1 |  | O sistema verifica o status atual da solicitação. |
| 2 |  | O sistema bloqueia a conclusão, informa o status atualizado da solicitação e impede a gravação do status "aceito". |

**Fluxo Alternativo FA6 – Empresa abandona o formulário**

| Passo | Ator | Sistema |
|---|---|---|
|  | O usuário fecha a tela de agendamento sem concluir. |  |
| 1 |  | Se for oriundo de uma solicitação (Entrada 2), o sistema descarta os dados temporários e mantém a solicitação original como "pendente". Se for direto, descarta a edição e libera a tela. |

**Fluxo Alternativo FA7 – Pet não encontrado no agendamento direto**

| Passo | Ator | Sistema |
|---|---|---|
|  | O usuário tenta buscar um pet que não está cadastrado na base ao fazer um agendamento direto. |  |
| 1 |  | O sistema identifica que o cliente/pet não existe. |
| 2 |  | O sistema oferece o redirecionamento para o cadastro de cliente e pet (JGR021). |

**Fluxo Alternativo FA8 – Sessão expirada**

| Passo | Ator | Sistema |
|---|---|---|
|  | O usuário tenta realizar uma ação com a sessão inativa. |  |
| 1 |  | O sistema detecta a expiração do token de acesso. |
| 2 |  | O sistema redireciona o usuário para a tela de autenticação (JGR002). |

<a id="uc-40"></a>

### UC-40 · Solicitar Agendamento de Serviço (tutor)

| Campo | Valor |
|---|---|
| Identificador | UC-40 (planilha: JGR040) |
| Requisito | RF39 |
| Regras de negócio | RN14, RN29, RN37, RN38, RN40 |
| Prioridade | Must |
| Objetivo | Solicitação de um serviço por meio de agendamento para um pet |
| Atores | Usuário-tutor, sistema |
| Pré-condições | O tutor deve ser autorizado e o pet deve estar cadastrado na plataforma. A empresa deve estar ativa, possuir ao menos um serviço ativo no catálogo (JGR038) e horários disponíveis na agenda (JGR024). A empresa deve estar ativa, com serviço ativo (JGR038) e horários de atuação cadastrados (JGR024). |
| Pós-condições (garantia de sucesso) | Solicitação registrada como PENDENTE, com histórico, e empresa notificada. |
| Classes envolvidas | SolicitacaoServico, HistoricoSolicitacao, Servico, Pet |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário-tutor acessa a página de serviços da empresa, na aba de catálogo de serviços (JGR033) |  |
| 2 |  | O sistema exibe os serviços ativos da empresa |
| 3 | O usuário-tutor seleciona um serviço e opta por solicitar o agendamento |  |
| 4 |  | O sistema exibe os pets cadastrados do tutor |
| 5 | O usuário-tutor seleciona o pet |  |
| 6 |  | O sistema apresenta os horários disponíveis para o serviço (RN40) |
| 7 | O usuário-tutor seleciona um horário |  |
| 8 | O usuário-tutor revisa as informações e envia a solicitação |  |
| 9 |  | O sistema verifica se o horário continua disponível e se há conflito para o pet (RN14, RN29) |
| 10 |  | O sistema registra a solicitação com status "pendente" e histórico de alterações (RN38) |
| 11 |  | O sistema notifica a empresa sobre a nova solicitação |
| 12 |  | O sistema informa ao tutor que a solicitação foi enviada e pode ser acompanhada (JGR042) |
| 13 |  | A operação é finalizada |

**Fluxo Alternativo 1 - Tutor sem pet (ramifica no passo 4))**

| Passo | Ator | Sistema |
|---|---|---|
| FA01-1 |  | O sistema identifica que o tutor não possui pets cadastrados |
| FA01-2 |  | O sistema redireciona o usuário-tutor para o cadastro de pet (JGR004) |
| FA01-3 | O usuário-tutor cadastra o pet |  |
| FA01-4 |  | O fluxo retorna ao passo 4 do fluxo principal |

**Fluxo Alternativo 2 – Nenhum horário disponível (ramifica no passo 6)**

| Passo | Ator | Sistema |
|---|---|---|
| FA02-1 |  | O sistema identifica que não há horários disponíveis para o serviço |
| FA02-2 |  | O sistema exibe a mensagem "Não há horários disponíveis para este serviço no momento" |
| FA02-3 |  | A operação é finalizada |

**Fluxo Alternativo 3 – Campos obrigatórios não preenchidos (ramifica no passo 8)**

| Passo | Ator | Sistema |
|---|---|---|
| FA03-1 |  | O sistema identifica que o pet ou o horário não foram selecionados |
| FA03-2 |  | O sistema exibe mensagem indicando os campos pendentes |
| FA03-3 | O usuário-tutor preenche os campos pendentes |  |
| FA03-4 |  | O fluxo retorna ao passo 8 do fluxo principal |

**Fluxo Alternativo 4 – Horário indisponível ou conflito no envio (ramifica no passo 9)**

| Passo | Ator | Sistema |
|---|---|---|
| FA04-1 |  | O sistema identifica que o horário foi ocupado ou que há conflito para o pet (RN14, RN29) |
| FA04-2 |  | O sistema informa o motivo e atualiza a lista de horários disponíveis |
| FA04-3 | O usuário-tutor seleciona outro horário |  |
| FA04-4 |  | O fluxo retorna ao passo 8 do fluxo principal |

**Fluxo Alternativo 5 – Serviço removido ou desativado (ramifica nos passos 3 e 10)**

| Passo | Ator | Sistema |
|---|---|---|
| FA05-1 |  | O sistema identifica que o serviço não está mais disponível |
| FA05-2 |  | O sistema informa a indisponibilidade e retorna ao catálogo da empresa (JGR033) |
| FA05-3 |  | A operação é finalizada |

**Fluxo Alternativo 6 – Tutor cancela a solicitação (ramifica nos passos 3 a 8)**

| Passo | Ator | Sistema |
|---|---|---|
| FA06-1 | O usuário-tutor cancela a solicitação |  |
| FA06-2 |  | O sistema descarta as informações selecionadas |
| FA06-3 |  | A operação é finalizada |

**Fluxo Alternativo 7 – Sessão expirada (ramifica no passo 1)**

| Passo | Ator | Sistema |
|---|---|---|
| FA07-1 |  | O sistema identifica que a sessão é inválida ou expirou. |
| FA07-2 |  | O sistema redireciona o usuário-tutor para a autenticação (JGR002) |
| FA07-3 | O usuário-tutor se autentica |  |
| FA07-4 |  | O fluxo retorna ao passo 1 do fluxo principal |

<a id="uc-41"></a>

### UC-41 · Gerenciar Solicitações de Serviço

| Campo | Valor |
|---|---|
| Identificador | UC-41 (planilha: JGR041) |
| Requisito | RF40 |
| Regras de negócio | RN20, RN24, RN31, RN38, RN40 |
| Prioridade | Must |
| Objetivo | Permitir que a empresa consulte, aceite, recuse ou atualize as solicitações de agendamento feitas pelos tutores. |
| Atores | Usuário-empresa, usuário-funcionário, sistema |
| Pré-condições | A empresa deve estar autenticada com perfil ativo e permissão válida (RN20). |
| Pós-condições (garantia de sucesso) | Solicitação ACEITA com agendamento criado ou RECUSADA com motivo; tutor notificado. |
| Classes envolvidas | SolicitacaoServico, Agendamento, HistoricoSolicitacao |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário-empresa/funcionário acessa a página de solicitações de serviço pendentes. |  |
| 2 |  | O sistema exibe a listagem de solicitações de serviço com status pendente. |
| 3 | O usuário-empresa/funcionário seleciona uma solicitação específica e escolhe a opção de "Aceitar". |  |
| 4 |  | O sistema redireciona automaticamente para o Agendar Serviço (JGR039) na tela da agenda (JGR024), abrindo o formulário com o serviço, o pet e o horário escolhido pelo tutor pré-preenchidos. |
| 5 |  | O sistema mantém o status da solicitação como "pendente" até que o agendamento seja concluído no JGR039. |
| 6 |  | A operação de redirecionamento é finalizada. |

**FA1. Recusar solicitação**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário-empresa/funcionário seleciona uma solicitação pendente e escolhe a opção de "Recusar". |  |
| 2 |  | O sistema solicita a confirmação da recusa. |
| 3 | O usuário-empresa/funcionário confirma a ação. |  |
| 4 |  | O sistema atualiza o status da solicitação para "recusado", registra a alteração no histórico (RN38), notifica o tutor (JGR031) e encerra a operação. |

**Fluxo Alternativo FA2. Lista vazia (Nenhuma solicitação pendente)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário-empresa/funcionário acessa a página de solicitações. |  |
| 2 |  | O sistema identifica que não há solicitações pendentes na base. |
| 3 |  | O sistema exibe a mensagem "Nenhuma solicitação pendente no momento" e encerra a operação. |

**FA3. Solicitação já respondida por outro usuário**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário tenta aceitar ou recusar uma solicitação que já foi tratada por outro operador da empresa. |  |
| 5 |  | O sistema detecta que o status mudou, exibe um alerta informando que a solicitação já foi respondida e atualiza a listagem da tela. |

**FA4. Atualizar solicitação de serviço**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário-empresa/funcionário seleciona uma solicitação e opta por atualizar os dados permitidos. |  |
| 2 |  | O sistema valida as alterações, registra no histórico e exibe confirmação de sucesso. |

**FA5. Sessão expirada**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário tenta interagir com a página de solicitações com a sessão inativa. |  |
| 2 |  | O sistema detecta a expiração do token e redireciona para a tela de autenticação (JGR002). |

<a id="uc-42"></a>

### UC-42 · Consultar e Acompanhar Solicitações (tutor)

| Campo | Valor |
|---|---|
| Identificador | UC-42 (planilha: JGR042) |
| Requisito | RF41 |
| Regras de negócio | RN22, RN31, RN38 |
| Prioridade | Must |
| Objetivo | Permitir que o tutor consulte o status, acompanhe o andamento e cancele, quando necessário, as suas solicitações de serviço. |
| Atores | Usuário-tutor, sistema |
| Pré-condições | O tutor precisa estar autenticado. |
| Pós-condições (garantia de sucesso) | Nenhum dado alterado na consulta; no cancelamento, status CANCELADA com histórico e horário liberado. |
| Classes envolvidas | SolicitacaoServico, HistoricoSolicitacao |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário-tutor acessa a página de solicitações de serviço |  |
| 2 |  | O sistema exibe as solicitações do tutor com o status de cada uma (RN38) |
| 3 | O usuário-tutor seleciona uma solicitação |  |
| 4 |  | O sistema exibe os detalhes (serviço, empresa, pet, horário escolhido ou confirmado, status atual e histórico de alterações) e, para solicitações com status pendente ou aceito cujo horário ainda não passou, a opção de cancelar |
| 5 |  | A operação é finalizada |

**Fluxo Alternativo 1 – Nenhuma solicitação encontrada (ramifica no passo 2)**

| Passo | Ator | Sistema |
|---|---|---|
| FA01-1 |  | O sistema identifica que o tutor não possui solicitações |
| FA01-2 |  | O sistema exibe a mensagem "Você ainda não possui solicitações de serviço" e oferece o acesso ao catálogo de serviços (JGR033) |
| FA01-3 |  | A operação é finalizada |

**Fluxo Alternativo 2 – Cancelar solicitação pendente (ramifica no passo 4)**

| Passo | Ator | Sistema |
|---|---|---|
| FA02-1 | O usuário-tutor seleciona "cancelar solicitação" |  |
| FA02-2 |  | O sistema solicita a confirmação |
| FA02-3 | O usuário-tutor confirma o cancelamento |  |
| FA02-4 |  | O sistema verifica o status atual da solicitação |
| FA02-5 |  | O sistema atualiza o status para "cancelado" e registra no histórico, identificando o tutor como autor (RN38) |
| FA02-6 |  | O sistema notifica a empresa (JGR031) |
| FA02-7 |  | O fluxo retorna ao passo 2 do fluxo principal |

**Fluxo Alternativo 3 – Cancelar solicitação aceita (ramifica no passo 4)**

| Passo | Ator | Sistema |
|---|---|---|
| FA03-1 | O usuário-tutor seleciona "cancelar solicitação" |  |
| FA03-2 |  | O sistema informa que o agendamento será desfeito e solicita a confirmação |
| FA03-3 | O usuário-tutor confirma o cancelamento |  |
| FA03-4 |  | O sistema verifica o status atual da solicitação e se o horário ainda não passou |
| FA03-5 |  | O sistema libera o horário na agenda da empresa (JGR024) |
| FA03-6 |  | O sistema atualiza o status para "cancelado" e registra no histórico, identificando o tutor como autor (RN38) |
| FA03-7 |  | O sistema notifica a empresa (JGR031) |
| FA03-8 |  | O fluxo retorna ao passo 2 do fluxo principal |

**Fluxo Alternativo 4 – Cancelamento não confirmado (ramifica no passo 3 dos FA02 e FA03)**

| Passo | Ator | Sistema |
|---|---|---|
| FA04-1 | O usuário-tutor desiste do cancelamento |  |
| FA04-2 |  | O sistema mantém a solicitação inalterada |
| FA04-3 |  | O fluxo retorna ao passo 4 do fluxo principal |

**Fluxo Alternativo 5 – Cancelamento não permitido (ramifica na verificação dos FA02 e FA03)**

| Passo | Ator | Sistema |
|---|---|---|
| FA05-1 |  | O sistema identifica que o status mudou (ex.: a empresa recusou ou o tutor já cancelou) ou que o horário já passou |
| FA05-2 |  | O sistema bloqueia o cancelamento e informa o motivo e o status atual |
| FA05-3 |  | O sistema atualiza os detalhes e retorna ao passo 4 do fluxo principal |

**Fluxo Alternativo 6 – Sessão expirada (ramifica no passo 1)**

| Passo | Ator | Sistema |
|---|---|---|
| FA06-1 |  | O sistema identifica que a sessão é inválida ou expirou |
| FA06-2 |  | O sistema redireciona o usuário-tutor para a autenticação (JGR002) |
| FA06-3 | O usuário-tutor se autentica |  |
| FA06-4 |  | O fluxo retorna ao passo 1 do fluxo principal |

<a id="uc-43"></a>

### UC-43 · Conversar em Chat na Plataforma

| Campo | Valor |
|---|---|
| Identificador | UC-43 (planilha: JGR043) |
| Requisito | RF42 |
| Regras de negócio | RN25, RN31 |
| Prioridade | Could |
| Objetivo | Permitir a interação via chat contextualizado no universo de pets por meio da plataforma, validando previamente a elegibilidade do usuário. |
| Atores | Usuário-tutor, sistema |
| Pré-condições | O usuário deve estar autenticado e possuir o plano PANTERA ativo com acesso ao chat integrado. |
| Pós-condições (garantia de sucesso) | Mensagens registradas na conversa. |
| Classes envolvidas | Conversa, Mensagem, Assinatura |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 |  | O sistema valida se o usuário possui o plano PANTERA ativo. |
| 2 |  | O sistema carrega a interface do chat e oferece possíveis perguntas iniciais baseadas no contexto de pets. |
| 3 | O usuário-tutor digita e envia uma pergunta ou mensagem. |  |
| 4 |  | O sistema processa a mensagem e responde de forma coerente ao contexto. |
| 5 |  | O sistema mantém o canal de conversa aberto para novas interações. |
| 6 | O usuário-tutor decide encerrar a conversa. |  |
| 7 |  | O sistema arquiva a sessão e finaliza a operação. |

**Fluxos alternativos**

| Passo | Ator | Sistema |
|---|---|---|
| FA1 | Usuário sem o plano PANTERA (Verificação no Passo 1): |  |
| 1 |  | O sistema identifica que o usuário não possui o plano PANTERA ativo. |
| 2 |  | O sistema bloqueia o acesso ao chat premium. |
| 3 |  | O sistema exibe uma mensagem informativa sobre a restrição do plano e disponibiliza um botão de ação "Tornar-se Membro". |
| 4 | O usuário-tutor seleciona o botão "Tornar-se Membro" e preenche as informações necessárias para upgrade. |  |
| 5 |  | O sistema valida o pagamento/adesão e atualiza o status do plano do usuário-tutor. |
| 6 |  | O fluxo retorna automaticamente ao passo 1 do fluxo principal. |

<a id="uc-44"></a>

### UC-44 · Realizar Pagamento (tutor)

| Campo | Valor |
|---|---|
| Identificador | UC-44 (planilha: JGR044) |
| Requisito | RF43 |
| Regras de negócio | RN25, RN31, RN39 |
| Prioridade | Should |
| Objetivo | Fornecer um meio de pagamento seguro e integrado para que o usuário-tutor liquide contratações de serviços junto aos prestadores (usuário-empresa). |
| Atores | Usuário-tutor, sistema |
| Pré-condições | O usuário-empresa deve ter ofertas de serviços cadastradas e o usuário-tutor deve ter iniciado uma contratação válida de serviço. |
| Pós-condições (garantia de sucesso) | Pagamento ACEITO somente após a confirmação do gateway; nota fiscal disponibilizada. |
| Classes envolvidas | Pagamento |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 |  | O sistema exibe o resumo financeiro contendo valores, serviços contratados, dados do destinatário (empresa) e do remetente (tutor). |
| 2 |  | O sistema disponibiliza os meios de pagamento aceitos na plataforma. |
| 3 | O usuário-tutor confere as informações exibidas. |  |
| 4 | O usuário-tutor seleciona o meio de pagamento desejado (ex: cartão, Pix) e confirma. |  |
| 5 |  | O sistema processa a transação junto ao gateway, registra o pagamento, emite a nota fiscal e a encaminha ao tutor e à empresa contratada. |
| 6 |  | O sistema atualiza o status da contratação para pago e finaliza a operação. |

**Fluxo Alternativo 1. Falha na transação ou recusa pelo gateway**

| Passo | Ator | Sistema |
|---|---|---|
| 1 |  | O sistema identifica uma falha (cartão recusado, saldo insuficiente ou erro de comunicação) |
| 2 |  | O sistema exibe uma mensagem clara de erro notificando o motivo da recusa. |
| 3 | O usuário-tutor visualiza o erro, corrige os dados do cartão ou opta por inserir outro meio de pagamento. |  |
| 4 |  | O fluxo retorna ao passo 4 do fluxo principal para nova tentativa. |

**Fluxo Alternativo 2. Cancelamento voluntário pelo tutor**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário-tutor clica no botão de cancelar antes de concluir a autorização final do pagamento. |  |
| 1 |  | O sistema aborta a transação, descarta os dados temporários de pagamento e redireciona o usuário de volta à tela de detalhes da contratação. |

<a id="uc-45"></a>

### UC-45 · Gerenciar Pagamentos

| Campo | Valor |
|---|---|
| Identificador | UC-45 (planilha: JGR045) |
| Requisito | RF44 |
| Regras de negócio | RN22, RN25, RN31, RN39 |
| Prioridade | Should |
| Objetivo | Permitir que tutores e empresas consultem, filtrem e gerenciem o histórico de transações financeiras realizadas ou recebidas. |
| Atores | Usuário-empresa, usuário-tutor, sistema |
| Pré-condições | O usuário deve possuir pelo menos uma contratação de serviço registrada no sistema. |
| Pós-condições (garantia de sucesso) | Na consulta, nenhum dado alterado; no reembolso, solicitação EM_ANALISE vinculada ao pagamento. |
| Classes envolvidas | Pagamento, SolicitacaoReembolso |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário acessa o menu financeiro da sua conta. |  |
| 2 |  | O sistema valida o perfil e exibe a página principal de gestão de pagamentos. |
| 3 |  | O sistema disponibiliza as opções de consulta de histórico de pagamentos e transações. |
| 4 | O usuário seleciona a opção desejada de visualização (recebidos/realizados). |  |
| 5 |  | O sistema carrega e exibe a listagem correspondente aos filtros padrão. |
| 6 | O usuário seleciona uma transação específica para ver detalhes. |  |
| 7 |  | O sistema exibe o detalhamento completo do pagamento e encerra a operação. |

**Fluxo Alternativo 1. Solicitação de Reembolso/Estorno**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário seleciona uma transação concluída elegível e aciona a opção "Solicitar Reembolso" |  |
| 2 | O usuário-tutor preenche o motivo detalhado da solicitação. |  |
| 1 |  | O sistema registra o pedido de estorno vinculado à transação e notifica a administração ou a empresa prestadora. |
| 2 |  | O sistema exibe mensagem de confirmação de envio da solicitação. |

**Fluxo Alternativo 1. Consulta sem resultados (Filtro restritivo)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário aplica filtros de período ou status que não possuem correspondência. |  |
| 1 |  | O sistema detecta a ausência de registros para o critério informado. |
| 2 |  | O sistema exibe a mensagem amigável "Nenhum pagamento encontrado para o filtro selecionado" e disponibiliza um botão de ação rápida para "Limpar Filtros" |

<a id="uc-46"></a>

### UC-46 · Gerenciar Privacidade e Consentimentos

| Campo | Valor |
|---|---|
| Identificador | UC-46 (planilha: JGR046) |
| Requisito | RF45 |
| Regras de negócio | RN15, RN25, RN26, RN31 |
| Prioridade | Must |
| Objetivo | Garantir conformidade com a LGPD, permitindo que os usuários gerenciem termos de uso, preferências de compartilhamento de dados de pets e solicitações de exclusão de conta. |
| Atores | Usuário-tutor, usuário-empresa, usuário-funcionário, sistema |
| Pré-condições | O usuário deve estar devidamente autenticado na plataforma. |
| Pós-condições (garantia de sucesso) | Preferências de consentimento atualizadas e registradas em auditoria. |
| Classes envolvidas | Consentimento, TermoUso, SolicitacaoPrivacidade |

**Fluxo principal**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário acessa as configurações de perfil e clica na seção "Privacidade e Consentimentos" |  |
| 2 |  | O sistema valida a autenticação e exibe o painel de controle de privacidade com os termos vigentes. |
| 3 |  | O sistema apresenta o status atual das permissões e dos compartilhamentos de dados ativos. |
| 4 | O usuário ajusta as chaves de preferências (ativando/desativando consentimentos opcionais). |  |
| 5 | O usuário clica no botão "Salvar Alterações". |  |
| 6 |  | O sistema atualiza o banco de dados, gera um registro de auditoria (timestamp e versão) e exibe mensagem de sucesso. |

**Fluxo Alternativo FA1. Tentativa de revogação de consentimento obrigatório**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário tenta desativar uma permissão que é estruturalmente indispensável para o funcionamento dos serviços contratados |  |
| 1 |  | O sistema intercepta a ação, exibe um alerta explicativo de que tal item é obrigatório e sugere a exclusão da conta caso não concorde. |

**Fluxo Alternativo FA2. Solicitação de exclusão total de dados (Direito ao Esquecimento)**

| Passo | Ator | Sistema |
|---|---|---|
| 1 | O usuário clica em "Excluir Conta e Dados" e insere sua senha atual para confirmar a intenção. |  |
| 1 |  | O sistema exige dupla confirmação por segurança, executa o protocolo de anonimização ou exclusão definitiva dos dados do usuário e de seus pets vinculados, e encerra a sessão ativa. |
