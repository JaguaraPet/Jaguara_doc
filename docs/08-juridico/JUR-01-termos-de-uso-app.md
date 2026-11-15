# JUR-01 · Termos de uso do app do tutor

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | JUR-01 · Termos de uso do aplicativo Jaguara para tutores |
| Versão | 0.1 |
| Status | Rascunho |
| Autores | Ricardo Guilhen |
| Data | 14/11/2026 |
| Tarefa Jira | JAG-216 |
| Padrão de referência | Código de Defesa do Consumidor (Lei nº 8.078/1990); Marco Civil da Internet (Lei nº 12.965/2014); Decreto nº 7.962/2013 (comércio eletrônico); LGPD (Lei nº 13.709/2018) |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 0.1 | 14/11/2026 | Ricardo Guilhen | Primeira versão, a partir dos gaps da avaliação de 10/11/2026. |

## 1. Objetivo

Definir as regras de uso do app do Jaguara pelo tutor: o que a plataforma oferece, o que o tutor pode e não pode fazer, como funcionam os pagamentos e o plano PANTERA e como a conta é encerrada.

> **Modelo acadêmico.** Este texto foi escrito pelo time do projeto e precisa de validação jurídica antes de ser publicado para usuários reais (QA-01).

## 2. Escopo

- **Dentro:** o texto que o tutor aceita ao criar a conta (UC-01) e as regras de versão e aceite.
- **Fora:** o tratamento de dados pessoais, que está na [política de privacidade (JUR-03)](JUR-03-politica-de-privacidade.md), e as regras para empresas, que estão nos [termos da Enterprise (JUR-02)](JUR-02-termos-enterprise.md).

## 3. Referências

| ID | Documento |
|---|---|
| REF-01 | [REQ-01 · ERS](../02-requisitos/REQ-01-ERS.md), regras RN41 e RN42 |
| REF-02 | [ARQ-02 · Segurança e LGPD](../03-arquitetura/ARQ-02-seguranca-e-lgpd.md) |
| REF-03 | [ADR-010 · Decisões de domínio](../03-arquitetura/adr/ADR-010-decisoes-de-dominio.md) (plano PANTERA e assistente virtual) |
| REF-04 | [GES-08 · Pesquisa de mercado](../01-gestao/GES-08-pesquisa-de-mercado.md), análise do CDC |

## 4. Como o termo é aceito e versionado

| Regra | Como funciona |
|---|---|
| Aceite | Na criação da conta (UC-01), o tutor marca a caixa "Li e aceito os termos de uso e a política de privacidade". O botão de cadastro só fica ativo com a caixa marcada. |
| Registro | Um `Consentimento` com o termo e a versão aceitos, data, IP e meio `ACEITE_NO_APP` ([MOD-01](../04-modelagem/MOD-01-modelo-de-classes.md)). |
| Nova versão | Mudança relevante gera nova versão de `TermoUso` com aviso por e-mail 30 dias antes da vigência. Se a versão for obrigatória, o app pede o novo aceite no primeiro acesso depois da vigência (RN42). |
| Recusa | Sem aceite da versão obrigatória vigente, o tutor só acessa a tela de privacidade, onde pode exportar os dados e excluir a conta (UC-46). |

## 5. Texto dos termos de uso

### 5.1 Quem somos e aceite

O Jaguara é uma plataforma digital para organizar a vida dos pets e a relação dos tutores com pet shops, clínicas e outros prestadores de serviço. Ao criar uma conta, você declara que leu e aceita estes termos e a política de privacidade. Se não concordar, não use o app.

### 5.2 Quem pode usar

- Pessoas com 18 anos ou mais, com CPF válido.
- Cada pessoa tem uma única conta, ligada ao seu CPF e e-mail.
- Os dados informados devem ser verdadeiros e mantidos atualizados.

### 5.3 Sua conta

- Você é responsável por guardar sua senha e por tudo que for feito com a sua conta.
- Avise o Jaguara pelo canal de suporte se suspeitar de uso indevido. O Jaguara pode encerrar sessões e bloquear temporariamente a conta para proteger você.
- Depois de 5 tentativas de login erradas, a conta fica bloqueada por um tempo, por segurança.

### 5.4 O que o Jaguara oferece

- Cadastro dos seus pets, com saúde, vacinas, medicamentos, alergias, documentos, rotina, alimentação e despesas.
- Lembretes e notificações.
- Compartilhamento do perfil do pet com pessoas e empresas que você escolher, com o nível de acesso que você definir.
- Busca de serviços de empresas parceiras, solicitação de agendamento, pagamento e conversa com a empresa.
- No plano **PANTERA**, um assistente virtual para dúvidas gerais sobre cuidados com o pet.

### 5.5 O que o Jaguara não faz

- **O Jaguara não substitui o médico-veterinário.** Informações do app e respostas do assistente virtual são gerais e não são diagnóstico, prescrição nem orientação clínica. Em caso de sintoma ou emergência, procure um veterinário.
- O serviço contratado com uma empresa (banho, consulta, hospedagem etc.) é prestado pela própria empresa, que responde pela execução dele. O Jaguara responde pelo funcionamento da plataforma, pelas informações que exibe e pelo processamento do pedido e do pagamento, nos termos do Código de Defesa do Consumidor.
- O Jaguara não vende seus dados nem os de seus pets.

### 5.6 Compartilhamento com empresas

- Uma empresa só vê os dados do seu pet quando você compartilha o perfil ou quando há um agendamento com ela.
- Você escolhe o que a empresa vê (por exemplo, só vacinas) e pode revogar o compartilhamento quando quiser.
- O registro de um atendimento feito por uma empresa também fica com ela, que é responsável por ele.

### 5.7 Plano PANTERA e pagamentos

- O plano PANTERA é uma assinatura paga, com renovação automática no mesmo período contratado, até você cancelar.
- O preço, o período e o que está incluído aparecem antes da contratação. Mudança de preço vale só a partir da renovação seguinte e é avisada com 30 dias de antecedência.
- Você pode desistir em até 7 dias da contratação e receber o valor pago de volta (direito de arrependimento, art. 49 do CDC).
- Depois disso, o cancelamento interrompe a renovação e o plano continua ativo até o fim do período já pago.
- Pagamentos de serviços de empresas são processados por um gateway de pagamento parceiro. Reembolsos seguem a política informada pela empresa e a legislação do consumidor, e são pedidos pelo app.

### 5.8 Conteúdo que você envia

- Fotos, documentos e textos que você envia continuam sendo seus. Você autoriza o Jaguara a guardá-los e a mostrá-los a você e a quem você compartilhar, só para prestar o serviço.
- Não envie conteúdo de terceiros sem autorização, conteúdo ilegal, ofensivo ou que exponha outras pessoas.
- O Jaguara pode remover conteúdo que viole estes termos, com aviso a você.

### 5.9 Condutas proibidas

- Usar a conta de outra pessoa ou criar contas falsas.
- Tentar acessar dados de outros usuários, burlar limites de acesso ou atrapalhar o funcionamento da plataforma.
- Usar o chat ou o assistente para assédio, fraude ou divulgação de conteúdo ilegal.
- Copiar, revender ou fazer engenharia reversa do app.

### 5.10 Disponibilidade

O Jaguara busca manter a plataforma disponível pelo menos 99% do tempo em cada mês. Manutenções programadas são avisadas com antecedência. Falhas de serviços externos (internet, lojas de aplicativo, gateway de pagamento) podem afetar o funcionamento.

### 5.11 Encerramento da conta

- Você pode excluir sua conta a qualquer momento na tela de privacidade. Os dados são excluídos ou anonimizados, exceto o que a lei manda guardar, como explicado na política de privacidade.
- O Jaguara pode suspender ou encerrar a conta que violar estes termos, com aviso e explicação do motivo, salvo quando a lei ou a segurança de outros usuários exigir ação imediata.

### 5.12 Alterações destes termos

Mudanças relevantes são avisadas por e-mail e no app com 30 dias de antecedência. Se a mudança exigir novo aceite, o app pede o aceite no primeiro acesso depois da vigência. Se você não aceitar, pode exportar seus dados e excluir a conta.

### 5.13 Lei aplicável e foro

Estes termos seguem a lei brasileira. Fica eleito o foro do domicílio do consumidor (art. 101 do CDC).

### 5.14 Contato

Dúvidas e reclamações: canal de suporte no app. Assuntos de privacidade: canal indicado na política de privacidade.

## Questões em aberto

| ID | Questão | Encaminhamento |
|---|---|---|
| QA-01 | Validação jurídica do texto | Orientador ou assessoria jurídica, antes do lançamento público |
| QA-02 | Razão social, CNPJ e endereço do Jaguara no texto | Depois da formalização da empresa |
| QA-03 | Preço e período do plano PANTERA | Modelo de negócio da análise de mercado (GES-09, JAG-40) |
