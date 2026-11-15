# JUR-02 · Termos da Enterprise e acordo de tratamento de dados

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | JUR-02 · Termos de uso do Jaguara Enterprise e acordo de tratamento de dados pessoais |
| Versão | 0.1 |
| Status | Rascunho |
| Autores | Ricardo Guilhen |
| Data | 14/11/2026 |
| Tarefa Jira | JAG-216 |
| Padrão de referência | Código Civil (contratos entre empresas); LGPD, arts. 37 a 42 (agentes de tratamento) e art. 33 (transferência internacional); Resoluções CD/ANPD nº 15/2024 e nº 19/2024 |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 0.1 | 14/11/2026 | Ricardo Guilhen | Primeira versão, a partir dos gaps da avaliação de 10/11/2026. |

## 1. Objetivo

Definir as regras de uso do Jaguara Enterprise pelas empresas (pet shops, clínicas, hotéis e outros prestadores) e formalizar a divisão de papéis na LGPD: **a empresa é a controladora** dos dados dos seus clientes, funcionários e atendimentos, e **o Jaguara é o operador** desses dados ([ARQ-02](../03-arquitetura/ARQ-02-seguranca-e-lgpd.md), seção 2).

> **Modelo acadêmico.** Texto sujeito a validação jurídica antes do uso real (QA-01).

## 2. Escopo

- **Parte A:** termos de uso da plataforma pela empresa.
- **Parte B:** acordo de tratamento de dados pessoais (art. 39 da LGPD).
- **Parte C:** deveres da empresa como controladora dos dados dos clientes, inclusive dos que não têm conta no Jaguara.
- **Aceite:** o representante legal marca o aceite no cadastro da empresa (UC-32); o registro segue a mesma regra do [JUR-01](JUR-01-termos-de-uso-app.md), seção 4, com o termo do tipo `TERMOS_ENTERPRISE`.

## 3. Referências

| ID | Documento |
|---|---|
| REF-01 | [ARQ-02 · Segurança e LGPD](../03-arquitetura/ARQ-02-seguranca-e-lgpd.md), seções 6, 8, 9 e 12 |
| REF-02 | [JUR-04 · Termo de consentimento do cliente da empresa](JUR-04-termo-consentimento-cliente.md) |
| REF-03 | [ARQ-03 · Integrações](../03-arquitetura/ARQ-03-integracoes.md) |
| REF-04 | [REQ-04 · UC-21, UC-26, UC-30 e UC-32](../02-requisitos/REQ-04-especificacao-casos-de-uso.md) |

## 4. Parte A · Termos de uso da Enterprise

### A.1 Objeto

O Jaguara oferece à empresa, como serviço de software pela internet, ferramentas de catálogo de serviços, agenda, solicitações, atendimentos, clientes, funcionários, chat com tutores, relatórios, integrações e *webhooks*.

### A.2 Cadastro e representação

- A empresa se cadastra com CNPJ ativo e um representante com poderes para aceitar estes termos.
- A empresa mantém os dados cadastrais corretos e atualizados.

### A.3 Funcionários e acessos

- A empresa cria os acessos dos seus funcionários e define as permissões de cada perfil (UC-16, UC-19).
- A empresa responde pelo que for feito com os acessos que concedeu e deve remover o acesso do funcionário desligado; a remoção revoga as sessões na hora (RN23).

### A.4 Obrigações da empresa

- Prestar os serviços anunciados com profissionais habilitados, inclusive com registro no conselho de classe quando a atividade exigir, e responder pela execução deles perante o tutor.
- Manter os próprios registros exigidos pela profissão (por exemplo, prontuário veterinário), mesmo que use o Jaguara para registrar atendimentos.
- Informar preços, condições e política de cancelamento e de reembolso antes da contratação pelo tutor.
- Usar os dados de pets compartilhados por tutores só para o atendimento e só no escopo autorizado (RN15, RN26).
- Não usar a plataforma para enviar publicidade a tutores sem consentimento deles.

### A.5 Planos e pagamento

O plano, o preço e a forma de cobrança da empresa aparecem antes da contratação. Mudança de preço é avisada com 30 dias de antecedência e vale a partir do ciclo seguinte. Falta de pagamento por mais de 30 dias pode levar à suspensão do acesso, depois de aviso.

### A.6 Integrações e *webhooks*

A empresa escolhe os destinos dos *webhooks* e as integrações que ativa, e responde pelo tratamento que esses destinos fazem dos dados recebidos. *Webhooks* só são enviados para endereços HTTPS e são assinados (RN36).

### A.7 Disponibilidade e suporte

Meta de disponibilidade mensal de 99% (RNF02). Suporte pelo canal do painel (UC-26). Manutenções programadas são avisadas com antecedência.

### A.8 Responsabilidade

Cada parte responde pelos danos que causar. O Jaguara não responde pela execução dos serviços da empresa nem por decisões clínicas. A responsabilidade do Jaguara perante a empresa, fora dos casos de dolo, culpa grave ou violação da Parte B, fica limitada ao valor pago pela empresa nos 12 meses anteriores ao fato.

### A.9 Vigência, rescisão e devolução dos dados

- O contrato vale por prazo indeterminado e pode ser encerrado por qualquer parte com aviso de 30 dias.
- Ao final, a empresa tem 30 dias para exportar seus dados. Depois desse prazo, o Jaguara exclui os dados da operação da empresa, salvo o que a lei obrigar a guardar.

### A.10 Foro

Lei brasileira. Fica eleito o foro da comarca da sede da empresa contratante.

## 5. Parte B · Acordo de tratamento de dados pessoais

| Cláusula | Conteúdo |
|---|---|
| B.1 Papéis | A empresa é controladora dos dados dos seus clientes, funcionários, pets de clientes sem conta e atendimentos. O Jaguara é operador desses dados. Dados das contas de tutores continuam sob controle do Jaguara; a empresa só os acessa quando o tutor autoriza. |
| B.2 Instruções | O Jaguara trata os dados só para prestar o serviço contratado e conforme as configurações feitas pela empresa no painel, que valem como instruções documentadas. Se uma instrução parecer contrária à LGPD, o Jaguara avisa a empresa. |
| B.3 Titulares e dados | Clientes da empresa (nome, CPF, contato, pets, agendamentos, atendimentos, pagamentos) e funcionários (nome, CPF, e-mail, perfil, registros de acesso). |
| B.4 Confidencialidade | Só integrantes do time do Jaguara com necessidade técnica acessam dados da empresa, com dever de sigilo e acesso registrado em auditoria. |
| B.5 Segurança | Medidas técnicas e administrativas do [ARQ-02](../03-arquitetura/ARQ-02-seguranca-e-lgpd.md), seções 6 e 10: criptografia em trânsito e em repouso, CPF cifrado e mascarado, controle de acesso por perfil, auditoria e backups cifrados. |
| B.6 Suboperadores | A empresa autoriza os suboperadores da seção 8 do ARQ-02. Inclusão ou troca de suboperador é avisada com 30 dias de antecedência; a empresa pode se opor e, sem acordo, encerrar o contrato sem multa. |
| B.7 Transferência internacional | Só para suboperadores que adotem as cláusulas-padrão contratuais da ANPD (Resolução CD/ANPD nº 19/2024) ou outro mecanismo do art. 33 da LGPD. |
| B.8 Direitos dos titulares | O Jaguara oferece no painel as ferramentas para a empresa atender os pedidos dos titulares (consulta, correção, exportação, revogação e exclusão) e repassa à empresa, em até 2 dias úteis, qualquer pedido que receber diretamente. |
| B.9 Incidentes | O Jaguara avisa a empresa sem demora, em até 24 horas depois de confirmar um incidente com os dados dela, com a natureza do incidente, os dados e titulares afetados, as medidas tomadas e um contato. A comunicação à ANPD e aos titulares é da empresa, como controladora, e o Jaguara ajuda com as informações de que ela precisar ([ARQ-02](../03-arquitetura/ARQ-02-seguranca-e-lgpd.md), seção 12). |
| B.10 Comprovação | O Jaguara mantém o registro das operações de tratamento (ARQ-02, seção 9) e responde, uma vez por ano, a questionário de segurança da empresa. |
| B.11 Fim do tratamento | Ao fim do contrato, os dados são devolvidos por exportação e depois eliminados, como na cláusula A.9. |
| B.12 Responsabilidade | Cada agente responde nos termos dos arts. 42 a 45 da LGPD. O operador responde solidariamente quando descumprir a LGPD ou as instruções lícitas da empresa. |

## 6. Parte C · Deveres da empresa sobre os dados dos clientes

1. **Consentimento antes do cadastro completo.** A empresa só registra no Jaguara dados do cliente além de nome e contato depois de coletar o consentimento dele com o [termo de consentimento (JUR-04)](JUR-04-termo-consentimento-cliente.md), na versão vigente (RN41).
2. **Meio de coleta.** Presencial, com o termo impresso assinado e a cópia digitalizada anexada ao cadastro, ou digital, pelo link que o Jaguara envia ao cliente. Os dois ficam registrados com data, versão e prova.
3. **Recusa.** O cliente que não consentir pode ser atendido normalmente, sem que seus dados sejam registrados no Jaguara.
4. **Revogação.** A empresa atende a revogação pedida pelo cliente e não volta a usar os dados dele no Jaguara. O cliente também pode revogar sozinho pelo link do comprovante.
5. **Pedidos do cliente.** A empresa responde aos pedidos dos seus clientes em até 15 dias, usando as ferramentas do painel (UC-21).
6. **Funcionários.** A empresa informa aos funcionários que seus dados de acesso são tratados no Jaguara para a operação dela.

## Questões em aberto

| ID | Questão | Encaminhamento |
|---|---|---|
| QA-01 | Validação jurídica do texto, em especial do limite de responsabilidade (A.8) | Orientador ou assessoria jurídica |
| QA-02 | Planos e preços da Enterprise | Modelo de negócio da análise de mercado (GES-09, JAG-40) |
| QA-03 | Razão social, CNPJ e endereço do Jaguara | Depois da formalização da empresa |
