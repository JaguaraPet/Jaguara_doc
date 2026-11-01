# ARQ-02 · Segurança e conformidade com a LGPD

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | ARQ-02 · Segurança da informação e proteção de dados pessoais |
| Versão | 1.0 |
| Status | Em revisão |
| Autores | Ricardo Guilhen |
| Data | 01/11/2026 |
| Tarefa Jira | JAG-69 |
| Padrão de referência | LGPD (Lei nº 13.709/2018), OWASP ASVS 4.0 nível 2, modelo de RIPD da ANPD (simplificado) |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 1.0 | 01/11/2026 | Ricardo Guilhen | Bases legais, controles de segurança, RIPD simplificado e direitos do titular. |

## 1. Objetivo

Definir como o Jaguara protege os dados de tutores, pets, empresas e funcionários e como cumpre a LGPD, a partir do mapeamento de dados do [GES-08](../01-gestao/GES-08-pesquisa-de-mercado.md) e das regras RN15, RN24, RN25, RN26 e RN31.

## 2. Papéis na LGPD

| Papel | Quem |
|---|---|
| Controlador | Jaguara, para dados de tutores e da própria plataforma |
| Controlador (dados da operação da empresa) | Cada empresa Enterprise, sobre seus clientes, funcionários e atendimentos; o Jaguara atua como **operador** desses dados |
| Encarregado (DPO) | A definir antes do lançamento público |
| Titulares | Tutores, representantes das empresas e funcionários |

Dados de pets não são dados pessoais, mas são tratados com o mesmo cuidado porque se ligam ao tutor.

## 3. Inventário de dados e bases legais

| Categoria | Dados | Finalidade | Base legal (art. 7º) | Retenção |
|---|---|---|---|---|
| Identificação do tutor | Nome, CPF, e-mail, telefone, endereço | Conta, unicidade (RN01), comunicação | Execução de contrato (V) | Enquanto a conta existir; 5 anos após exclusão só o necessário para obrigações legais |
| Autenticação | Hash de senha, sessões, tokens, histórico de senhas | Acesso seguro (RN03 a RN06) | Execução de contrato (V) | Sessões: 30 dias; histórico: 3 últimas senhas |
| Pets e saúde | Vacinas, exames, medicamentos, alergias, documentos | Funcionalidade principal | Execução de contrato (V) | Enquanto a conta existir |
| Compartilhamentos | Escopos e destinatários | Acesso de terceiros autorizado pelo tutor (RN15) | Consentimento (I) | Até revogação ou expiração |
| Financeiro | Despesas e pagamentos | Controle de gastos e cobrança | Execução de contrato (V); obrigação legal (II) para dados fiscais | 5 anos (fiscal) |
| Empresa | CNPJ, razão social, endereço | Conta Enterprise | Execução de contrato (V) | Enquanto a conta existir |
| Funcionários | Nome, CPF, e-mail, perfil | Acesso à operação da empresa | Execução de contrato (V) | Até o desligamento (RN23) e 6 meses de auditoria |
| Clientes da empresa | Vínculo com o tutor | Operação da empresa | Consentimento (I) (RN25) | Até revogação |
| Chat | Mensagens | Comunicação e suporte | Execução de contrato (V) | 1 ano |
| Logs e auditoria | Ações, IP, data | Segurança e auditoria (RN31) | Legítimo interesse (IX) | 1 ano; logs críticos 5 anos |
| Marketing | Preferências de comunicação | Ofertas e novidades | Consentimento (I) | Até revogação |

Os prazos de retenção são propostas para validação jurídica antes do lançamento.

## 4. Direitos do titular (art. 18)

| Direito | Como é atendido | Caso de uso |
|---|---|---|
| Confirmação e acesso | Tela "Meus dados" e exportação em JSON | UC-46 |
| Correção | Edição do perfil; pedido `CORRECAO_DADOS` para dados bloqueados | UC-46 |
| Anonimização, bloqueio ou eliminação | Pedido `EXCLUSAO_DADOS`: anonimiza o usuário e seus pets, mantendo apenas o exigido por lei | UC-46 |
| Portabilidade | Exportação em formato estruturado (JSON) | UC-46 |
| Informação sobre compartilhamento | Lista de compartilhamentos ativos por pet | UC-11 |
| Revogação do consentimento | Revogação com data, sem afetar tratamentos anteriores | UC-46 |

Pedidos são registrados em `SolicitacaoPrivacidade` e respondidos em até 15 dias.

## 5. Controles de segurança (OWASP ASVS nível 2)

| Área ASVS | Controle no Jaguara | Requisito |
|---|---|---|
| V2 Autenticação | Argon2id; senha mínima de 8 caracteres verificada contra listas de senhas vazadas; bloqueio após 5 falhas; recuperação com token de uso único de 2 h | RN03, RN05, RN06 |
| V3 Sessão | Access token de 15 min; refresh token rotativo vinculado à `Sessao`; expiração por inatividade de 4 h; revogação imediata | RN04, RN23 |
| V4 Controle de acesso | RBAC por rota; verificação de posse e de compartilhamento em cada consulta de pet; negar por padrão | RN20, RN24, RN26, RN30 |
| V5 Validação | DTOs validados; consultas parametrizadas (Prisma); saída escapada no frontend | RNF01 |
| V6 Criptografia | TLS 1.2 ou superior; credenciais de integrações cifradas com AES-256-GCM; chaves em variáveis de ambiente | RNF01 |
| V7 Erros e logs | Erros sem detalhes internos; logs estruturados sem senha, token ou dado de saúde | RN31 |
| V8 Proteção de dados | Minimização (CPF só onde a regra exige); arquivos com URL assinada de curta duração | LGPD |
| V9 Comunicação | HSTS; CORS restrito às origens do app e da web | RNF01 |
| V10 Código malicioso | `npm audit` e Dependabot na CI | RNF01 |
| V13 API | Limite de requisições por IP e por usuário; webhooks com HMAC-SHA256 e carimbo de tempo | RN36 |
| V14 Configuração | Segredos fora do repositório; cabeçalhos de segurança; imagens Docker mínimas | RNF01 |

## 6. Relatório de Impacto à Proteção de Dados (RIPD), versão simplificada

| Item | Avaliação |
|---|---|
| Natureza | Dados de identificação, contato e financeiros de tutores; dados operacionais de empresas; histórico de saúde de animais |
| Escopo | Usuários no Brasil; volume previsto de até 10.000 tutores e 500 empresas na v1.0 (RNF05) |
| Contexto | Os titulares esperam que dados do pet sejam vistos por clínicas só quando autorizarem |
| Finalidades | Seção 3 |
| Riscos principais | Acesso indevido por empresa não autorizada; vazamento de credenciais; exposição de CPF; uso do chat para orientação clínica indevida |
| Probabilidade e impacto | Ver risco R03 do [GES-05](../01-gestao/GES-05-registro-de-riscos.md): probabilidade 3, impacto 5 |
| Medidas | Compartilhamento por escopo (RN15), verificação de vínculo (RN24), auditoria (RN31), controles da seção 5, aviso de que o assistente não substitui o veterinário |
| Risco residual | Médio, aceitável para a v1.0 com as medidas implementadas e testadas |
| Revisão | A cada nova integração ou categoria de dado, e antes do lançamento público |

## 7. Incidentes

1. Detectar (alertas de monitoramento ou relato) e registrar em `LogAuditoria` com nível CRITICO.
2. Conter (revogar sessões, rotacionar chaves, bloquear contas afetadas).
3. Avaliar o risco aos titulares em até 48 h.
4. Comunicar a ANPD e os titulares quando houver risco ou dano relevante (art. 48).
5. Registrar a lição aprendida no registro de riscos.

## Questões em aberto

| ID | Questão | Encaminhamento |
|---|---|---|
| QA-01 | Indicação do encarregado de dados (DPO) | Definir antes do lançamento público |
| QA-02 | Validação jurídica dos prazos de retenção | Consultar orientador ou assessoria jurídica |
