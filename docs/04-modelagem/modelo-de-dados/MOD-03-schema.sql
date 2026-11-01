-- Jaguara · MOD-03 Modelo físico (PostgreSQL 16)
-- Gerado a partir do MOD-01. Restrições de negócio adicionais: ver MOD-03, seção 6.

CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TYPE canal_notificacao AS ENUM ('PUSH', 'EMAIL', 'SMS');
CREATE TYPE categoria_servico AS ENUM ('CONSULTA', 'EXAME', 'CIRURGIA', 'VACINACAO', 'BANHO_TOSA', 'HOSPEDAGEM', 'PET_SITTER', 'CRECHE', 'OUTRO');
CREATE TYPE dia_semana AS ENUM ('SEGUNDA', 'TERCA', 'QUARTA', 'QUINTA', 'SEXTA', 'SABADO', 'DOMINGO');
CREATE TYPE escopo_acesso AS ENUM ('PERFIL_BASICO', 'VACINAS', 'EXAMES', 'MEDICAMENTOS', 'ALERGIAS', 'DOCUMENTOS', 'LINHA_DO_TEMPO', 'EDICAO_CLINICA');
CREATE TYPE escopo_perfil AS ENUM ('GLOBAL', 'EMPRESA');
CREATE TYPE formato_relatorio AS ENUM ('TELA', 'PDF');
CREATE TYPE gravidade AS ENUM ('LEVE', 'MODERADA', 'GRAVE');
CREATE TYPE metodo_pagamento AS ENUM ('CARTAO_CREDITO', 'CARTAO_DEBITO', 'PIX', 'BOLETO');
CREATE TYPE nivel_log AS ENUM ('INFO', 'ALERTA', 'CRITICO');
CREATE TYPE origem_evento AS ENUM ('MANUAL', 'AGENDAMENTO', 'CALENDARIO_EXTERNO');
CREATE TYPE provedor_calendario AS ENUM ('GOOGLE', 'OUTLOOK', 'APPLE');
CREATE TYPE sexo AS ENUM ('MACHO', 'FEMEA');
CREATE TYPE status_agendamento AS ENUM ('AGENDADO', 'CANCELADO', 'REALIZADO', 'NAO_COMPARECEU');
CREATE TYPE status_assinatura AS ENUM ('ATIVA', 'CANCELADA', 'EXPIRADA');
CREATE TYPE status_atendimento AS ENUM ('EM_ANDAMENTO', 'FINALIZADO');
CREATE TYPE status_chamado AS ENUM ('ABERTO', 'EM_ANALISE', 'AGUARDANDO_INFORMACAO', 'RESOLVIDO', 'FECHADO');
CREATE TYPE status_compartilhamento AS ENUM ('ATIVO', 'REVOGADO', 'EXPIRADO');
CREATE TYPE status_conta AS ENUM ('PENDENTE_CONFIRMACAO', 'ATIVA', 'BLOQUEADA', 'SUSPENSA', 'INATIVA');
CREATE TYPE status_conversa AS ENUM ('ABERTA', 'ENCERRADA');
CREATE TYPE status_notificacao AS ENUM ('AGENDADA', 'ENVIADA', 'FALHOU', 'CANCELADA');
CREATE TYPE status_pagamento AS ENUM ('PENDENTE', 'ACEITO', 'CANCELADO', 'RECUSADO');
CREATE TYPE status_pet AS ENUM ('ATIVO', 'ARQUIVADO', 'FALECIDO');
CREATE TYPE status_reembolso AS ENUM ('EM_ANALISE', 'APROVADO', 'NEGADO');
CREATE TYPE status_solicitacao AS ENUM ('PENDENTE', 'ACEITA', 'RECUSADA', 'CANCELADA', 'CONCLUIDA', 'ENCERRADA');
CREATE TYPE status_solicitacao_privacidade AS ENUM ('ABERTA', 'EM_PROCESSAMENTO', 'CONCLUIDA', 'NEGADA');
CREATE TYPE status_tratamento AS ENUM ('ATIVO', 'FINALIZADO', 'SUSPENSO');
CREATE TYPE tipo_alergia_restricao AS ENUM ('ALERGIA', 'RESTRICAO_ALIMENTAR', 'RESTRICAO_MEDICAMENTOSA', 'OUTRA');
CREATE TYPE tipo_conversa AS ENUM ('EMPRESA', 'ASSISTENTE_VIRTUAL');
CREATE TYPE tipo_documento AS ENUM ('RG_ANIMAL', 'CARTEIRA_VACINACAO', 'ATESTADO', 'RECEITA', 'LAUDO', 'PEDIGREE', 'OUTRO');
CREATE TYPE tipo_empresa AS ENUM ('CLINICA_VETERINARIA', 'PET_SHOP', 'HOTEL_PET', 'CRECHE', 'CASA_DE_CUIDADO');
CREATE TYPE tipo_evento AS ENUM ('CONSULTA', 'VACINA', 'MEDICAMENTO', 'EXAME', 'CIRURGIA', 'BANHO_TOSA', 'HOSPEDAGEM', 'COMPROMISSO', 'OUTRO');
CREATE TYPE tipo_integracao AS ENUM ('CALENDARIO', 'PAGAMENTO', 'PLATAFORMA_VETERINARIA', 'NOTIFICACAO', 'OUTRA');
CREATE TYPE tipo_item_memorial AS ENUM ('FOTO', 'TEXTO', 'HOMENAGEM');
CREATE TYPE tipo_plano AS ENUM ('GRATUITO', 'PANTERA');
CREATE TYPE tipo_recurso AS ENUM ('SALA', 'EQUIPAMENTO', 'BAIA', 'VEICULO', 'OUTRO');
CREATE TYPE tipo_relatorio AS ENUM ('DESPESAS', 'OPERACIONAL', 'GERENCIAL');
CREATE TYPE tipo_responsavel AS ENUM ('PRINCIPAL', 'ADICIONAL');
CREATE TYPE tipo_solicitacao_privacidade AS ENUM ('EXPORTACAO_DADOS', 'EXCLUSAO_DADOS', 'CORRECAO_DADOS');
CREATE TYPE tipo_token AS ENUM ('CONFIRMACAO_EMAIL', 'RECUPERACAO_SENHA');

CREATE TABLE perfil_acesso (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nome varchar(255) NOT NULL,
  descricao text,
  escopo escopo_perfil NOT NULL,
  empresa_id uuid,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE usuario (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  email varchar(255) NOT NULL UNIQUE,
  senha_hash varchar(255) NOT NULL,
  telefone varchar(255),
  status status_conta NOT NULL,
  email_confirmado boolean NOT NULL,
  tentativas_login_falhas integer NOT NULL,
  bloqueado_ate timestamptz,
  data_cadastro timestamptz NOT NULL,
  perfil_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE tutor (
  id uuid PRIMARY KEY,
  nome varchar(255) NOT NULL,
  cpf char(11) NOT NULL UNIQUE,
  data_nascimento date,
  endereco_cep varchar(10),
  endereco_logradouro varchar(120),
  endereco_numero varchar(10),
  endereco_complemento varchar(120),
  endereco_bairro varchar(120),
  endereco_cidade varchar(120),
  endereco_uf char(2),
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE administrador (
  id uuid PRIMARY KEY,
  nome varchar(255) NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE empresa_enterprise (
  id uuid PRIMARY KEY,
  cnpj char(14) NOT NULL UNIQUE,
  razao_social varchar(255) NOT NULL,
  nome_fantasia varchar(255) NOT NULL,
  tipo tipo_empresa NOT NULL,
  endereco_cep varchar(10) NOT NULL,
  endereco_logradouro varchar(120) NOT NULL,
  endereco_numero varchar(10) NOT NULL,
  endereco_complemento varchar(120),
  endereco_bairro varchar(120) NOT NULL,
  endereco_cidade varchar(120) NOT NULL,
  endereco_uf char(2) NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE funcionario_enterprise (
  id uuid PRIMARY KEY,
  nome varchar(255) NOT NULL,
  cpf char(11) NOT NULL UNIQUE,
  cargo varchar(255),
  ativo boolean NOT NULL,
  empresa_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE sessao (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  token varchar(255) NOT NULL UNIQUE,
  inicio timestamptz NOT NULL,
  ultima_atividade timestamptz NOT NULL,
  dispositivo varchar(255),
  usuario_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE token_acesso (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  token varchar(255) NOT NULL UNIQUE,
  tipo tipo_token NOT NULL,
  criado_em timestamptz NOT NULL,
  expira_em timestamptz NOT NULL,
  utilizado boolean NOT NULL,
  usuario_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE historico_senha (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  senha_hash varchar(255) NOT NULL,
  criada_em timestamptz NOT NULL,
  usuario_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE permissao (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  codigo varchar(255) NOT NULL UNIQUE,
  descricao text NOT NULL,
  modulo varchar(255) NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE especie (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nome varchar(255) NOT NULL UNIQUE,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE raca (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nome varchar(255) NOT NULL,
  especie_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE pet (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nome varchar(255) NOT NULL,
  data_nascimento date,
  sexo sexo NOT NULL,
  peso_kg numeric(10,2),
  cor varchar(255),
  microchip varchar(255) UNIQUE,
  castrado boolean NOT NULL,
  foto_url varchar(2048),
  status status_pet NOT NULL,
  data_falecimento date,
  raca_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE responsavel_pet (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tipo tipo_responsavel NOT NULL,
  data_vinculo timestamptz NOT NULL,
  ativo boolean NOT NULL,
  pet_id uuid NOT NULL,
  tutor_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE compartilhamento_pet (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  destinatario_email varchar(255),
  escopos escopo_acesso[] NOT NULL,
  token varchar(255) NOT NULL UNIQUE,
  data_concessao timestamptz NOT NULL,
  data_expiracao timestamptz,
  status status_compartilhamento NOT NULL,
  pet_id uuid NOT NULL,
  empresa_id uuid,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE memorial (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  mensagem text NOT NULL,
  data_criacao timestamptz NOT NULL,
  publico boolean NOT NULL,
  pet_id uuid NOT NULL UNIQUE,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE item_memorial (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tipo tipo_item_memorial NOT NULL,
  conteudo text,
  arquivo_url varchar(2048),
  data_registro timestamptz NOT NULL,
  memorial_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE documento_pet (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  titulo varchar(255) NOT NULL,
  tipo tipo_documento NOT NULL,
  arquivo_url varchar(2048) NOT NULL,
  data_emissao date,
  data_validade date,
  data_upload timestamptz NOT NULL,
  pet_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE alergia_restricao (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tipo tipo_alergia_restricao NOT NULL,
  descricao text NOT NULL,
  gravidade gravidade NOT NULL,
  data_identificacao date,
  observacoes text,
  pet_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE registro_clinico (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  data_registro timestamptz NOT NULL,
  observacoes text,
  valido boolean NOT NULL,
  pet_id uuid NOT NULL,
  registrado_por_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE vacinacao (
  id uuid PRIMARY KEY,
  nome_vacina varchar(255) NOT NULL,
  fabricante varchar(255),
  lote varchar(255),
  data_aplicacao date NOT NULL,
  data_proxima_dose date,
  responsavel_aplicacao varchar(255) NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE exame (
  id uuid PRIMARY KEY,
  tipo_exame varchar(255) NOT NULL,
  data_realizacao date NOT NULL,
  laboratorio varchar(255),
  resultado text,
  arquivo_resultado_url varchar(2048),
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE tratamento_medicamentoso (
  id uuid PRIMARY KEY,
  medicamento varchar(255) NOT NULL,
  dosagem varchar(255) NOT NULL,
  via_administracao varchar(255) NOT NULL,
  intervalo_horas integer NOT NULL,
  data_inicio date NOT NULL,
  data_fim date,
  status status_tratamento NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE evento_calendario (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  titulo varchar(255) NOT NULL,
  descricao text,
  tipo tipo_evento NOT NULL,
  data_hora_inicio timestamptz NOT NULL,
  data_hora_fim timestamptz,
  local varchar(255),
  origem origem_evento NOT NULL,
  id_externo varchar(255),
  pet_id uuid NOT NULL,
  criado_por_id uuid NOT NULL,
  calendario_externo_id uuid,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE calendario_externo (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  provedor provedor_calendario NOT NULL,
  conta_externa varchar(255) NOT NULL,
  token_autorizacao varchar(255) NOT NULL,
  autorizado boolean NOT NULL,
  ultima_sincronizacao timestamptz,
  usuario_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE plano_alimentar (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  alimento varchar(255) NOT NULL,
  meta_diaria_gramas numeric(10,2) NOT NULL,
  limite_diario_gramas numeric(10,2),
  refeicoes_por_dia integer NOT NULL,
  data_inicio date NOT NULL,
  ativo boolean NOT NULL,
  pet_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE registro_alimentacao (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  data_hora timestamptz NOT NULL,
  alimento varchar(255) NOT NULL,
  quantidade_gramas numeric(10,2) NOT NULL,
  observacao text,
  pet_id uuid NOT NULL,
  plano_id uuid,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE notificacao (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  titulo varchar(255) NOT NULL,
  mensagem text NOT NULL,
  canal canal_notificacao NOT NULL,
  data_programada timestamptz NOT NULL,
  data_envio timestamptz,
  status status_notificacao NOT NULL,
  tentativas integer NOT NULL,
  destinatario_id uuid NOT NULL,
  origem_tipo varchar(40) NOT NULL,
  origem_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE configuracao_notificacao (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tipo_evento tipo_evento NOT NULL,
  canal canal_notificacao NOT NULL,
  antecedencia_minutos integer NOT NULL,
  ativa boolean NOT NULL,
  usuario_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE cliente (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  codigo varchar(255) NOT NULL,
  data_vinculo date NOT NULL,
  observacoes text,
  consentimento_lgpd boolean NOT NULL,
  data_consentimento timestamptz,
  ativo boolean NOT NULL,
  empresa_id uuid NOT NULL,
  tutor_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE servico (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nome varchar(255) NOT NULL,
  descricao text NOT NULL,
  categoria categoria_servico NOT NULL,
  preco numeric(12,2) NOT NULL,
  duracao_minutos integer NOT NULL,
  ativo boolean NOT NULL,
  empresa_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE recurso (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nome varchar(255) NOT NULL,
  tipo tipo_recurso NOT NULL,
  ativo boolean NOT NULL,
  empresa_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE horario_atuacao (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  dia_semana dia_semana NOT NULL,
  hora_inicio time NOT NULL,
  hora_fim time NOT NULL,
  funcionario_id uuid,
  recurso_id uuid,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE solicitacao_servico (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  data_solicitacao timestamptz NOT NULL,
  data_hora_desejada timestamptz NOT NULL,
  status status_solicitacao NOT NULL,
  motivo_recusa text,
  observacoes text,
  tutor_id uuid NOT NULL,
  pet_id uuid NOT NULL,
  servico_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE historico_solicitacao (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  data_hora timestamptz NOT NULL,
  status_anterior status_solicitacao,
  status_novo status_solicitacao NOT NULL,
  descricao text,
  solicitacao_id uuid NOT NULL,
  autor_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE agendamento (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  data_hora_inicio timestamptz NOT NULL,
  data_hora_fim timestamptz NOT NULL,
  preco_contratado numeric(12,2) NOT NULL,
  status status_agendamento NOT NULL,
  criado_em timestamptz NOT NULL,
  solicitacao_id uuid UNIQUE,
  servico_id uuid NOT NULL,
  pet_id uuid NOT NULL,
  profissional_id uuid,
  recurso_id uuid,
  evento_id uuid,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE atendimento (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  data_hora_inicio timestamptz NOT NULL,
  data_hora_fim timestamptz,
  procedimentos_realizados text NOT NULL,
  observacoes_clinicas text,
  status status_atendimento NOT NULL,
  finalizado_em timestamptz,
  agendamento_id uuid UNIQUE,
  pet_id uuid NOT NULL,
  registrado_por_id uuid NOT NULL,
  profissional_id uuid,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE item_atendimento (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  quantidade integer NOT NULL,
  valor_unitario numeric(12,2) NOT NULL,
  observacao text,
  atendimento_id uuid NOT NULL,
  servico_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE categoria_despesa (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nome varchar(255) NOT NULL UNIQUE,
  descricao text,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE despesa (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  descricao text NOT NULL,
  valor numeric(12,2) NOT NULL,
  data date NOT NULL,
  comprovante_url varchar(2048),
  pet_id uuid NOT NULL,
  categoria_id uuid NOT NULL,
  pagamento_id uuid,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE pagamento (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  codigo_transacao varchar(255) NOT NULL UNIQUE,
  valor numeric(12,2) NOT NULL,
  data_hora timestamptz NOT NULL,
  metodo metodo_pagamento NOT NULL,
  status status_pagamento NOT NULL,
  data_confirmacao timestamptz,
  nota_fiscal_url varchar(2048),
  pagador_id uuid NOT NULL,
  recebedor_id uuid,
  agendamento_id uuid,
  assinatura_id uuid,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE solicitacao_reembolso (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  motivo text NOT NULL,
  valor numeric(12,2) NOT NULL,
  data_solicitacao timestamptz NOT NULL,
  status status_reembolso NOT NULL,
  data_analise timestamptz,
  pagamento_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE assinatura (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  plano tipo_plano NOT NULL,
  data_inicio date NOT NULL,
  data_fim date,
  status status_assinatura NOT NULL,
  tutor_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE conversa (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tipo tipo_conversa NOT NULL,
  data_inicio timestamptz NOT NULL,
  status status_conversa NOT NULL,
  tutor_id uuid NOT NULL,
  empresa_id uuid,
  pet_id uuid,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE mensagem (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  conteudo text NOT NULL,
  data_hora_envio timestamptz NOT NULL,
  lida boolean NOT NULL,
  anexo_url varchar(2048),
  conversa_id uuid NOT NULL,
  remetente_id uuid,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE termo_uso (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  versao varchar(255) NOT NULL UNIQUE,
  titulo varchar(255) NOT NULL,
  conteudo text NOT NULL,
  data_vigencia date NOT NULL,
  obrigatorio boolean NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE consentimento (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  aceito boolean NOT NULL,
  data_aceite timestamptz NOT NULL,
  data_revogacao timestamptz,
  ip_origem varchar(255) NOT NULL,
  usuario_id uuid NOT NULL,
  termo_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE solicitacao_privacidade (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tipo tipo_solicitacao_privacidade NOT NULL,
  data_solicitacao timestamptz NOT NULL,
  status status_solicitacao_privacidade NOT NULL,
  data_conclusao timestamptz,
  usuario_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE log_auditoria (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  data_hora timestamptz NOT NULL,
  acao varchar(255) NOT NULL,
  entidade varchar(255) NOT NULL,
  entidade_id varchar(255) NOT NULL,
  detalhes text,
  nivel nivel_log NOT NULL,
  ip_origem varchar(255),
  autor_id uuid,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE chamado_suporte (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  protocolo varchar(255) NOT NULL UNIQUE,
  titulo varchar(255) NOT NULL,
  descricao text NOT NULL,
  status status_chamado NOT NULL,
  data_abertura timestamptz NOT NULL,
  data_fechamento timestamptz,
  solicitante_id uuid NOT NULL,
  atendente_id uuid,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE intervencao_suporte (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  data_hora timestamptz NOT NULL,
  descricao text NOT NULL,
  acao_executada varchar(255) NOT NULL,
  chamado_id uuid NOT NULL,
  executada_por_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE integracao (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nome varchar(255) NOT NULL,
  tipo tipo_integracao NOT NULL,
  endpoint_url varchar(2048) NOT NULL,
  credenciais_cifradas varchar(255) NOT NULL,
  parametros text,
  ativa boolean NOT NULL,
  configurada_por_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE webhook (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  url varchar(2048) NOT NULL,
  eventos varchar(255)[] NOT NULL,
  segredo_assinatura varchar(255) NOT NULL,
  metodo_autenticacao varchar(255) NOT NULL,
  ativo boolean NOT NULL,
  configurado_por_id uuid NOT NULL,
  integracao_id uuid,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE relatorio (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tipo tipo_relatorio NOT NULL,
  periodo_inicio date NOT NULL,
  periodo_fim date NOT NULL,
  filtros text,
  formato formato_relatorio NOT NULL,
  gerado_em timestamptz NOT NULL,
  gerado_por_id uuid NOT NULL,
  criado_em timestamptz NOT NULL DEFAULT now(),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE funcionario_enterprise ADD CONSTRAINT fk_funcionario_enterprise_empresa_id FOREIGN KEY (empresa_id) REFERENCES empresa_enterprise(id) ON DELETE RESTRICT;
ALTER TABLE sessao ADD CONSTRAINT fk_sessao_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE RESTRICT;
ALTER TABLE token_acesso ADD CONSTRAINT fk_token_acesso_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE RESTRICT;
ALTER TABLE historico_senha ADD CONSTRAINT fk_historico_senha_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE RESTRICT;
ALTER TABLE usuario ADD CONSTRAINT fk_usuario_perfil_id FOREIGN KEY (perfil_id) REFERENCES perfil_acesso(id) ON DELETE RESTRICT;
ALTER TABLE perfil_acesso ADD CONSTRAINT fk_perfil_acesso_empresa_id FOREIGN KEY (empresa_id) REFERENCES empresa_enterprise(id) ON DELETE RESTRICT;
ALTER TABLE raca ADD CONSTRAINT fk_raca_especie_id FOREIGN KEY (especie_id) REFERENCES especie(id) ON DELETE RESTRICT;
ALTER TABLE pet ADD CONSTRAINT fk_pet_raca_id FOREIGN KEY (raca_id) REFERENCES raca(id) ON DELETE RESTRICT;
ALTER TABLE responsavel_pet ADD CONSTRAINT fk_responsavel_pet_pet_id FOREIGN KEY (pet_id) REFERENCES pet(id) ON DELETE CASCADE;
ALTER TABLE responsavel_pet ADD CONSTRAINT fk_responsavel_pet_tutor_id FOREIGN KEY (tutor_id) REFERENCES tutor(id) ON DELETE RESTRICT;
ALTER TABLE compartilhamento_pet ADD CONSTRAINT fk_compartilhamento_pet_pet_id FOREIGN KEY (pet_id) REFERENCES pet(id) ON DELETE CASCADE;
ALTER TABLE compartilhamento_pet ADD CONSTRAINT fk_compartilhamento_pet_empresa_id FOREIGN KEY (empresa_id) REFERENCES empresa_enterprise(id) ON DELETE RESTRICT;
ALTER TABLE memorial ADD CONSTRAINT fk_memorial_pet_id FOREIGN KEY (pet_id) REFERENCES pet(id) ON DELETE CASCADE;
ALTER TABLE item_memorial ADD CONSTRAINT fk_item_memorial_memorial_id FOREIGN KEY (memorial_id) REFERENCES memorial(id) ON DELETE CASCADE;
ALTER TABLE documento_pet ADD CONSTRAINT fk_documento_pet_pet_id FOREIGN KEY (pet_id) REFERENCES pet(id) ON DELETE CASCADE;
ALTER TABLE alergia_restricao ADD CONSTRAINT fk_alergia_restricao_pet_id FOREIGN KEY (pet_id) REFERENCES pet(id) ON DELETE CASCADE;
ALTER TABLE registro_clinico ADD CONSTRAINT fk_registro_clinico_pet_id FOREIGN KEY (pet_id) REFERENCES pet(id) ON DELETE RESTRICT;
ALTER TABLE registro_clinico ADD CONSTRAINT fk_registro_clinico_registrado_por_id FOREIGN KEY (registrado_por_id) REFERENCES usuario(id) ON DELETE RESTRICT;
ALTER TABLE evento_calendario ADD CONSTRAINT fk_evento_calendario_pet_id FOREIGN KEY (pet_id) REFERENCES pet(id) ON DELETE CASCADE;
ALTER TABLE evento_calendario ADD CONSTRAINT fk_evento_calendario_criado_por_id FOREIGN KEY (criado_por_id) REFERENCES usuario(id) ON DELETE RESTRICT;
ALTER TABLE evento_calendario ADD CONSTRAINT fk_evento_calendario_calendario_externo_id FOREIGN KEY (calendario_externo_id) REFERENCES calendario_externo(id) ON DELETE RESTRICT;
ALTER TABLE calendario_externo ADD CONSTRAINT fk_calendario_externo_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE RESTRICT;
ALTER TABLE plano_alimentar ADD CONSTRAINT fk_plano_alimentar_pet_id FOREIGN KEY (pet_id) REFERENCES pet(id) ON DELETE CASCADE;
ALTER TABLE registro_alimentacao ADD CONSTRAINT fk_registro_alimentacao_pet_id FOREIGN KEY (pet_id) REFERENCES pet(id) ON DELETE CASCADE;
ALTER TABLE registro_alimentacao ADD CONSTRAINT fk_registro_alimentacao_plano_id FOREIGN KEY (plano_id) REFERENCES plano_alimentar(id) ON DELETE RESTRICT;
ALTER TABLE configuracao_notificacao ADD CONSTRAINT fk_configuracao_notificacao_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE RESTRICT;
ALTER TABLE notificacao ADD CONSTRAINT fk_notificacao_destinatario_id FOREIGN KEY (destinatario_id) REFERENCES usuario(id) ON DELETE RESTRICT;
ALTER TABLE cliente ADD CONSTRAINT fk_cliente_empresa_id FOREIGN KEY (empresa_id) REFERENCES empresa_enterprise(id) ON DELETE RESTRICT;
ALTER TABLE cliente ADD CONSTRAINT fk_cliente_tutor_id FOREIGN KEY (tutor_id) REFERENCES tutor(id) ON DELETE RESTRICT;
ALTER TABLE servico ADD CONSTRAINT fk_servico_empresa_id FOREIGN KEY (empresa_id) REFERENCES empresa_enterprise(id) ON DELETE RESTRICT;
ALTER TABLE recurso ADD CONSTRAINT fk_recurso_empresa_id FOREIGN KEY (empresa_id) REFERENCES empresa_enterprise(id) ON DELETE RESTRICT;
ALTER TABLE horario_atuacao ADD CONSTRAINT fk_horario_atuacao_funcionario_id FOREIGN KEY (funcionario_id) REFERENCES funcionario_enterprise(id) ON DELETE RESTRICT;
ALTER TABLE horario_atuacao ADD CONSTRAINT fk_horario_atuacao_recurso_id FOREIGN KEY (recurso_id) REFERENCES recurso(id) ON DELETE RESTRICT;
ALTER TABLE solicitacao_servico ADD CONSTRAINT fk_solicitacao_servico_tutor_id FOREIGN KEY (tutor_id) REFERENCES tutor(id) ON DELETE RESTRICT;
ALTER TABLE solicitacao_servico ADD CONSTRAINT fk_solicitacao_servico_pet_id FOREIGN KEY (pet_id) REFERENCES pet(id) ON DELETE RESTRICT;
ALTER TABLE solicitacao_servico ADD CONSTRAINT fk_solicitacao_servico_servico_id FOREIGN KEY (servico_id) REFERENCES servico(id) ON DELETE RESTRICT;
ALTER TABLE historico_solicitacao ADD CONSTRAINT fk_historico_solicitacao_solicitacao_id FOREIGN KEY (solicitacao_id) REFERENCES solicitacao_servico(id) ON DELETE CASCADE;
ALTER TABLE historico_solicitacao ADD CONSTRAINT fk_historico_solicitacao_autor_id FOREIGN KEY (autor_id) REFERENCES usuario(id) ON DELETE RESTRICT;
ALTER TABLE agendamento ADD CONSTRAINT fk_agendamento_solicitacao_id FOREIGN KEY (solicitacao_id) REFERENCES solicitacao_servico(id) ON DELETE RESTRICT;
ALTER TABLE agendamento ADD CONSTRAINT fk_agendamento_servico_id FOREIGN KEY (servico_id) REFERENCES servico(id) ON DELETE RESTRICT;
ALTER TABLE agendamento ADD CONSTRAINT fk_agendamento_pet_id FOREIGN KEY (pet_id) REFERENCES pet(id) ON DELETE RESTRICT;
ALTER TABLE agendamento ADD CONSTRAINT fk_agendamento_profissional_id FOREIGN KEY (profissional_id) REFERENCES funcionario_enterprise(id) ON DELETE RESTRICT;
ALTER TABLE agendamento ADD CONSTRAINT fk_agendamento_recurso_id FOREIGN KEY (recurso_id) REFERENCES recurso(id) ON DELETE RESTRICT;
ALTER TABLE agendamento ADD CONSTRAINT fk_agendamento_evento_id FOREIGN KEY (evento_id) REFERENCES evento_calendario(id) ON DELETE RESTRICT;
ALTER TABLE atendimento ADD CONSTRAINT fk_atendimento_agendamento_id FOREIGN KEY (agendamento_id) REFERENCES agendamento(id) ON DELETE RESTRICT;
ALTER TABLE atendimento ADD CONSTRAINT fk_atendimento_pet_id FOREIGN KEY (pet_id) REFERENCES pet(id) ON DELETE RESTRICT;
ALTER TABLE atendimento ADD CONSTRAINT fk_atendimento_registrado_por_id FOREIGN KEY (registrado_por_id) REFERENCES usuario(id) ON DELETE RESTRICT;
ALTER TABLE atendimento ADD CONSTRAINT fk_atendimento_profissional_id FOREIGN KEY (profissional_id) REFERENCES funcionario_enterprise(id) ON DELETE RESTRICT;
ALTER TABLE item_atendimento ADD CONSTRAINT fk_item_atendimento_atendimento_id FOREIGN KEY (atendimento_id) REFERENCES atendimento(id) ON DELETE CASCADE;
ALTER TABLE item_atendimento ADD CONSTRAINT fk_item_atendimento_servico_id FOREIGN KEY (servico_id) REFERENCES servico(id) ON DELETE RESTRICT;
ALTER TABLE despesa ADD CONSTRAINT fk_despesa_pet_id FOREIGN KEY (pet_id) REFERENCES pet(id) ON DELETE RESTRICT;
ALTER TABLE despesa ADD CONSTRAINT fk_despesa_categoria_id FOREIGN KEY (categoria_id) REFERENCES categoria_despesa(id) ON DELETE RESTRICT;
ALTER TABLE despesa ADD CONSTRAINT fk_despesa_pagamento_id FOREIGN KEY (pagamento_id) REFERENCES pagamento(id) ON DELETE RESTRICT;
ALTER TABLE pagamento ADD CONSTRAINT fk_pagamento_pagador_id FOREIGN KEY (pagador_id) REFERENCES tutor(id) ON DELETE RESTRICT;
ALTER TABLE pagamento ADD CONSTRAINT fk_pagamento_recebedor_id FOREIGN KEY (recebedor_id) REFERENCES empresa_enterprise(id) ON DELETE RESTRICT;
ALTER TABLE pagamento ADD CONSTRAINT fk_pagamento_agendamento_id FOREIGN KEY (agendamento_id) REFERENCES agendamento(id) ON DELETE RESTRICT;
ALTER TABLE pagamento ADD CONSTRAINT fk_pagamento_assinatura_id FOREIGN KEY (assinatura_id) REFERENCES assinatura(id) ON DELETE RESTRICT;
ALTER TABLE solicitacao_reembolso ADD CONSTRAINT fk_solicitacao_reembolso_pagamento_id FOREIGN KEY (pagamento_id) REFERENCES pagamento(id) ON DELETE RESTRICT;
ALTER TABLE assinatura ADD CONSTRAINT fk_assinatura_tutor_id FOREIGN KEY (tutor_id) REFERENCES tutor(id) ON DELETE RESTRICT;
ALTER TABLE conversa ADD CONSTRAINT fk_conversa_tutor_id FOREIGN KEY (tutor_id) REFERENCES tutor(id) ON DELETE RESTRICT;
ALTER TABLE conversa ADD CONSTRAINT fk_conversa_empresa_id FOREIGN KEY (empresa_id) REFERENCES empresa_enterprise(id) ON DELETE RESTRICT;
ALTER TABLE conversa ADD CONSTRAINT fk_conversa_pet_id FOREIGN KEY (pet_id) REFERENCES pet(id) ON DELETE CASCADE;
ALTER TABLE mensagem ADD CONSTRAINT fk_mensagem_conversa_id FOREIGN KEY (conversa_id) REFERENCES conversa(id) ON DELETE CASCADE;
ALTER TABLE mensagem ADD CONSTRAINT fk_mensagem_remetente_id FOREIGN KEY (remetente_id) REFERENCES usuario(id) ON DELETE RESTRICT;
ALTER TABLE consentimento ADD CONSTRAINT fk_consentimento_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE RESTRICT;
ALTER TABLE consentimento ADD CONSTRAINT fk_consentimento_termo_id FOREIGN KEY (termo_id) REFERENCES termo_uso(id) ON DELETE RESTRICT;
ALTER TABLE solicitacao_privacidade ADD CONSTRAINT fk_solicitacao_privacidade_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE RESTRICT;
ALTER TABLE log_auditoria ADD CONSTRAINT fk_log_auditoria_autor_id FOREIGN KEY (autor_id) REFERENCES usuario(id) ON DELETE RESTRICT;
ALTER TABLE chamado_suporte ADD CONSTRAINT fk_chamado_suporte_solicitante_id FOREIGN KEY (solicitante_id) REFERENCES usuario(id) ON DELETE RESTRICT;
ALTER TABLE chamado_suporte ADD CONSTRAINT fk_chamado_suporte_atendente_id FOREIGN KEY (atendente_id) REFERENCES administrador(id) ON DELETE RESTRICT;
ALTER TABLE intervencao_suporte ADD CONSTRAINT fk_intervencao_suporte_chamado_id FOREIGN KEY (chamado_id) REFERENCES chamado_suporte(id) ON DELETE CASCADE;
ALTER TABLE intervencao_suporte ADD CONSTRAINT fk_intervencao_suporte_executada_por_id FOREIGN KEY (executada_por_id) REFERENCES administrador(id) ON DELETE RESTRICT;
ALTER TABLE integracao ADD CONSTRAINT fk_integracao_configurada_por_id FOREIGN KEY (configurada_por_id) REFERENCES administrador(id) ON DELETE RESTRICT;
ALTER TABLE webhook ADD CONSTRAINT fk_webhook_configurado_por_id FOREIGN KEY (configurado_por_id) REFERENCES administrador(id) ON DELETE RESTRICT;
ALTER TABLE webhook ADD CONSTRAINT fk_webhook_integracao_id FOREIGN KEY (integracao_id) REFERENCES integracao(id) ON DELETE RESTRICT;
ALTER TABLE relatorio ADD CONSTRAINT fk_relatorio_gerado_por_id FOREIGN KEY (gerado_por_id) REFERENCES usuario(id) ON DELETE RESTRICT;
ALTER TABLE tutor ADD CONSTRAINT fk_tutor_heranca FOREIGN KEY (id) REFERENCES usuario(id) ON DELETE CASCADE;
ALTER TABLE administrador ADD CONSTRAINT fk_administrador_heranca FOREIGN KEY (id) REFERENCES usuario(id) ON DELETE CASCADE;
ALTER TABLE empresa_enterprise ADD CONSTRAINT fk_empresa_enterprise_heranca FOREIGN KEY (id) REFERENCES usuario(id) ON DELETE CASCADE;
ALTER TABLE funcionario_enterprise ADD CONSTRAINT fk_funcionario_enterprise_heranca FOREIGN KEY (id) REFERENCES usuario(id) ON DELETE CASCADE;
ALTER TABLE vacinacao ADD CONSTRAINT fk_vacinacao_heranca FOREIGN KEY (id) REFERENCES registro_clinico(id) ON DELETE CASCADE;
ALTER TABLE exame ADD CONSTRAINT fk_exame_heranca FOREIGN KEY (id) REFERENCES registro_clinico(id) ON DELETE CASCADE;
ALTER TABLE tratamento_medicamentoso ADD CONSTRAINT fk_tratamento_medicamentoso_heranca FOREIGN KEY (id) REFERENCES registro_clinico(id) ON DELETE CASCADE;
CREATE TABLE perfil_permissao (
  perfil_acesso_id uuid NOT NULL REFERENCES perfil_acesso(id) ON DELETE CASCADE,
  permissao_id uuid NOT NULL REFERENCES permissao(id) ON DELETE RESTRICT,
  PRIMARY KEY (perfil_acesso_id, permissao_id)
);

-- Restrições de negócio (MOD-01, seção 9)
ALTER TABLE responsavel_pet ADD CONSTRAINT uq_responsavel_pet UNIQUE (pet_id, tutor_id);
ALTER TABLE cliente ADD CONSTRAINT uq_cliente UNIQUE (empresa_id, tutor_id);
ALTER TABLE horario_atuacao ADD CONSTRAINT ck_horario_xor CHECK ((funcionario_id IS NULL) <> (recurso_id IS NULL));  -- RC-20
ALTER TABLE horario_atuacao ADD CONSTRAINT ck_horario_intervalo CHECK (hora_inicio < hora_fim);
ALTER TABLE pagamento ADD CONSTRAINT ck_pagamento_xor CHECK ((agendamento_id IS NULL) <> (assinatura_id IS NULL));  -- RC-27
ALTER TABLE pagamento ADD CONSTRAINT ck_pagamento_aceito CHECK (status <> 'ACEITO' OR data_confirmacao IS NOT NULL);  -- RC-26 / RN39
ALTER TABLE pagamento ADD CONSTRAINT ck_pagamento_valor CHECK (valor > 0);
ALTER TABLE despesa ADD CONSTRAINT ck_despesa_valor CHECK (valor > 0);
ALTER TABLE agendamento ADD CONSTRAINT ck_agendamento_intervalo CHECK (data_hora_inicio < data_hora_fim);
ALTER TABLE webhook ADD CONSTRAINT ck_webhook_https CHECK (url LIKE 'https://%');  -- RC-29 / RN36
ALTER TABLE usuario ADD CONSTRAINT ck_usuario_ativo CHECK (status <> 'ATIVA' OR email_confirmado);  -- RC-01 / RN02
ALTER TABLE vacinacao ADD CONSTRAINT ck_vacinacao_responsavel CHECK (length(trim(responsavel_aplicacao)) > 0);  -- RN17

-- RC-19 / RN14 / RN29: sem sobreposição de agendamentos ativos para o mesmo pet, profissional ou recurso
CREATE EXTENSION IF NOT EXISTS btree_gist;
ALTER TABLE agendamento ADD CONSTRAINT ex_agendamento_pet EXCLUDE USING gist (pet_id WITH =, tstzrange(data_hora_inicio, data_hora_fim) WITH &&) WHERE (status = 'AGENDADO');
ALTER TABLE agendamento ADD CONSTRAINT ex_agendamento_profissional EXCLUDE USING gist (profissional_id WITH =, tstzrange(data_hora_inicio, data_hora_fim) WITH &&) WHERE (status = 'AGENDADO' AND profissional_id IS NOT NULL);
ALTER TABLE agendamento ADD CONSTRAINT ex_agendamento_recurso EXCLUDE USING gist (recurso_id WITH =, tstzrange(data_hora_inicio, data_hora_fim) WITH &&) WHERE (status = 'AGENDADO' AND recurso_id IS NOT NULL);

-- Índices para as consultas principais
CREATE INDEX ix_pet_raca ON pet (raca_id);
CREATE INDEX ix_registro_clinico_pet_data ON registro_clinico (pet_id, data_registro DESC);
CREATE INDEX ix_evento_pet_inicio ON evento_calendario (pet_id, data_hora_inicio);
CREATE INDEX ix_notificacao_pendente ON notificacao (data_programada) WHERE status = 'AGENDADA';
CREATE INDEX ix_solicitacao_servico_status ON solicitacao_servico (servico_id, status);
CREATE INDEX ix_agendamento_inicio ON agendamento (data_hora_inicio);
CREATE INDEX ix_pagamento_pagador ON pagamento (pagador_id, data_hora DESC);
CREATE INDEX ix_log_auditoria_data ON log_auditoria (data_hora DESC, nivel);
CREATE INDEX ix_mensagem_conversa ON mensagem (conversa_id, data_hora_envio);
