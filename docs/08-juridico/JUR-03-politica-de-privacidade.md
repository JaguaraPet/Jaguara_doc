# JUR-03 · Política de privacidade

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | JUR-03 · Política de privacidade do Jaguara |
| Versão | 0.1 |
| Status | Rascunho |
| Autores | Ricardo Guilhen |
| Data | 14/11/2026 |
| Tarefa Jira | JAG-216 |
| Padrão de referência | LGPD (Lei nº 13.709/2018), arts. 6º, 9º, 18 e 33; Guia orientativo da ANPD sobre cookies; Marco Civil da Internet |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 0.1 | 14/11/2026 | Ricardo Guilhen | Primeira versão, a partir do ARQ-02 2.0 e dos gaps da avaliação de 10/11/2026. |

## 1. Objetivo

Informar a tutores, empresas, funcionários e clientes das empresas, em linguagem simples, quais dados o Jaguara trata, para quê, com quem compartilha, por quanto tempo guarda e como cada pessoa exerce seus direitos (art. 9º da LGPD).

> **Modelo acadêmico.** Texto sujeito a validação jurídica antes do uso real (QA-01).

## 2. Escopo

- **Dentro:** o texto publicado no app, na web e no site, aceito junto com os termos de uso ([JUR-01](JUR-01-termos-de-uso-app.md) e [JUR-02](JUR-02-termos-enterprise.md)).
- **Fonte técnica:** o inventário, as bases legais, os prazos e os suboperadores vêm do [ARQ-02](../03-arquitetura/ARQ-02-seguranca-e-lgpd.md). Quando o ARQ-02 mudar, esta política muda junto e ganha nova versão.

## 3. Referências

| ID | Documento |
|---|---|
| REF-01 | [ARQ-02 · Segurança e LGPD](../03-arquitetura/ARQ-02-seguranca-e-lgpd.md), seções 2 a 9 |
| REF-02 | [JUR-04 · Termo de consentimento do cliente da empresa](JUR-04-termo-consentimento-cliente.md) |
| REF-03 | [REQ-04 · UC-46](../02-requisitos/REQ-04-especificacao-casos-de-uso.md) |

## 4. Texto da política de privacidade

### 4.1 Quem somos e quando esta política vale

O Jaguara é uma plataforma para tutores de pets e para empresas que prestam serviços a eles. Esta política vale para quem usa o app e a web do Jaguara.

| Situação | Quem decide sobre os dados (controlador) |
|---|---|
| Você tem conta de tutor no Jaguara | O Jaguara |
| Você representa uma empresa cadastrada | O Jaguara, para os dados da conta da empresa |
| Você é funcionário de uma empresa cadastrada | A empresa em que você trabalha; o Jaguara trata os dados por conta dela |
| Você é cliente de uma empresa e ela cadastrou seus dados | A empresa; o Jaguara trata os dados por conta dela, conforme o termo de consentimento que você assinou ou aceitou |

### 4.2 Dados que tratamos

| Dados | Exemplos | Para quê |
|---|---|---|
| Cadastro | Nome, CPF, e-mail, telefone, endereço, data de nascimento | Criar e manter a conta, evitar contas duplicadas, falar com você |
| Acesso | Senha (guardada só em formato irreversível), sessões, IP | Segurança da conta |
| Pets | Nome, espécie, raça, foto, microchip, saúde, vacinas, medicamentos, documentos, rotina | Organizar a vida do pet, lembretes e compartilhamento com quem você autorizar |
| Financeiro | Despesas, pagamentos, assinatura | Controle de gastos, cobranças e obrigações fiscais |
| Comunicação | Mensagens do chat e do assistente virtual | Conversar com empresas e responder dúvidas |
| Dispositivo | Token de notificação, plataforma do celular | Enviar lembretes |
| Uso e segurança | Registros de ações, data, hora e IP | Prevenir fraudes, investigar incidentes e cumprir o Marco Civil da Internet |

O Jaguara não trata dados pessoais sensíveis (como saúde de pessoas, religião ou biometria). Dados de saúde dos pets não são dados sensíveis, mas recebem proteção reforçada porque estão ligados a você.

### 4.3 Bases legais

- **Execução do contrato:** dados de cadastro, acesso, pets, pagamentos e comunicação, sem os quais o serviço não funciona.
- **Consentimento:** compartilhamento do perfil do pet com terceiros, comunicações de marketing e, para clientes cadastrados por uma empresa, o cadastro no Jaguara. O consentimento pode ser revogado a qualquer momento.
- **Obrigação legal:** dados fiscais de pagamentos e registros de acesso exigidos por lei.
- **Legítimo interesse:** registros de segurança e auditoria, limitados ao necessário.

### 4.4 Com quem compartilhamos

- **Empresas que você autorizar**, só com os dados e pelo tempo que você escolher.
- **Prestadores de serviço do Jaguara** (hospedagem, armazenamento, pagamento, e-mail, notificações e assistente virtual), que só podem usar os dados para prestar o serviço ao Jaguara. A lista atualizada está no anexo desta política e no [ARQ-02](../03-arquitetura/ARQ-02-seguranca-e-lgpd.md), seção 8.
- **Autoridades**, quando houver ordem judicial ou obrigação legal.

O Jaguara não vende dados pessoais.

### 4.5 Transferência internacional

Alguns prestadores (e-mail, notificações e assistente virtual) ficam fora do Brasil. Nesses casos o Jaguara usa as cláusulas-padrão contratuais aprovadas pela ANPD e envia só o mínimo necessário. O assistente virtual recebe apenas espécie, raça, idade e alergias do pet e o texto da conversa; não digite dados pessoais nele.

### 4.6 Por quanto tempo guardamos

| Dados | Prazo |
|---|---|
| Conta, pets e documentos | Enquanto a conta existir |
| Dados fiscais de pagamentos | 5 anos |
| Registros de acesso | 1 ano; registros críticos de segurança, 5 anos |
| Mensagens do chat | 1 ano |
| Conversas com o assistente virtual | 90 dias |
| Registros de consentimento | Enquanto o tratamento durar e mais 5 anos |

Depois do prazo, os dados são excluídos ou anonimizados.

### 4.7 Como protegemos

Conexões cifradas, senhas guardadas em formato irreversível, CPF cifrado no banco e mostrado mascarado, documentos dos pets em armazenamento privado com links temporários, remoção da localização das fotos, backups cifrados, controle de acesso por perfil e registro de quem acessou o quê. Nenhuma medida elimina todo o risco; se acontecer um incidente que possa causar dano relevante, você e a ANPD serão avisados.

### 4.8 Seus direitos

Você pode, pela tela "Privacidade" do app ou da web:

- confirmar se tratamos seus dados e acessá-los;
- corrigir dados incompletos ou errados;
- exportar seus dados em formato estruturado;
- revogar consentimentos;
- pedir a exclusão da conta e dos dados, exceto o que a lei manda guardar;
- saber com quem seus dados foram compartilhados.

Respondemos em até 15 dias. Você também pode reclamar à Autoridade Nacional de Proteção de Dados (ANPD).

**Se uma empresa cadastrou você sem conta no Jaguara**, peça diretamente à empresa ou use o link de revogação do comprovante do termo de consentimento. Se o pedido chegar ao Jaguara, ele será repassado à empresa, que é a responsável.

### 4.9 Idade mínima

A conta de tutor é só para maiores de 18 anos. O Jaguara não coleta conscientemente dados de crianças e adolescentes.

### 4.10 Cookies

A web do Jaguara usa apenas cookies essenciais, para manter a sessão e as preferências. O app não usa rastreadores de publicidade. Se isso mudar, um aviso pedirá sua escolha antes.

### 4.11 Comunicações

E-mails e notificações sobre a conta, segurança e lembretes fazem parte do serviço. Ofertas e novidades só são enviadas com o seu consentimento, que pode ser retirado na tela de notificações.

### 4.12 Encarregado e contato

Canal de privacidade: formulário "Privacidade" no app e na web e o e-mail de privacidade indicado nesta página. O nome do encarregado será publicado aqui antes do lançamento público ([ARQ-02](../03-arquitetura/ARQ-02-seguranca-e-lgpd.md), seção 2.1).

### 4.13 Alterações

Mudanças relevantes são avisadas no app e por e-mail com 30 dias de antecedência, com a data e o resumo do que mudou.

## Questões em aberto

| ID | Questão | Encaminhamento |
|---|---|---|
| QA-01 | Validação jurídica do texto e dos prazos | Orientador ou assessoria jurídica, junto com a QA-02 do ARQ-02 |
| QA-02 | Nome do encarregado e e-mail de privacidade | Antes do lançamento público |
