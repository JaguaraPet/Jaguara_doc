# JUR-04 · Termo de consentimento do cliente da empresa

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | JUR-04 · Termo de consentimento para tratamento de dados do cliente cadastrado por uma empresa Enterprise |
| Versão | 0.1 |
| Status | Rascunho |
| Autores | Ricardo Guilhen |
| Data | 14/11/2026 |
| Tarefa Jira | JAG-216 |
| Padrão de referência | LGPD (Lei nº 13.709/2018), arts. 7º, I, 8º e 9º |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 0.1 | 14/11/2026 | Ricardo Guilhen | Primeira versão, a partir do gap apontado na avaliação de 10/11/2026: cliente cadastrado pela empresa sem usar o app. |

## 1. Objetivo

Dar à empresa Enterprise um termo padrão para coletar o consentimento do cliente antes de registrar os dados dele e dos pets no Jaguara. O caso que motivou o termo: a empresa pode cadastrar uma pessoa que não usa o app e que, portanto, nunca aceitou os termos do Jaguara ([ADR-010](../03-arquitetura/adr/ADR-010-decisoes-de-dominio.md), item 3).

> **Modelo acadêmico.** Texto sujeito a validação jurídica antes do uso real (QA-01).

## 2. Escopo

- **Dentro:** o texto do termo, os campos que a empresa preenche, os meios de coleta, a prova guardada e a revogação.
- **Fora:** clientes que já têm conta de tutor. Eles aceitaram os termos de uso e a política de privacidade e autorizam a empresa pelo compartilhamento do perfil do pet (RN15); mesmo assim, a empresa registra este termo para os dados que ela própria cadastra.

## 3. Referências

| ID | Documento |
|---|---|
| REF-01 | [JUR-02 · Termos da Enterprise](JUR-02-termos-enterprise.md), Parte C |
| REF-02 | [ARQ-02 · Segurança e LGPD](../03-arquitetura/ARQ-02-seguranca-e-lgpd.md), seções 2, 7 e 9 |
| REF-03 | [REQ-04 · UC-21](../02-requisitos/REQ-04-especificacao-casos-de-uso.md) e [REQ-01](../02-requisitos/REQ-01-ERS.md), regra RN41 |
| REF-04 | [MOD-01 · Modelo de classes](../04-modelagem/MOD-01-modelo-de-classes.md), classes `TermoUso` e `Consentimento` |

## 4. Como o termo é coletado e registrado

| Etapa | Presencial | Digital (link) |
|---|---|---|
| 1. Pré-cadastro | O funcionário informa nome e um contato do cliente (UC-21) | Igual |
| 2. Apresentação | O sistema gera o termo em PDF com os dados da empresa; o cliente lê e assina | O sistema envia ao cliente, por e-mail ou mensagem, um link com o termo |
| 3. Aceite | O funcionário anexa a cópia digitalizada do termo assinado | O cliente marca "Concordo" na página do link |
| 4. Registro | `Consentimento` com meio `ASSINATURA_PRESENCIAL`, a cópia como prova (`evidenciaUrl`) e o funcionário que registrou | `Consentimento` com meio `LINK_DIGITAL`, data, hora e IP do aceite |
| 5. Comprovante | Cópia do termo com um código QR para revogação | E-mail com o termo aceito e o link de revogação |

Regras (RN41):

- Enquanto não houver consentimento vigente, o cadastro fica **pendente**: guarda só nome e contato e não pode receber pets, agendamentos nem atendimentos.
- Pré-cadastro sem aceite em 7 dias é excluído automaticamente.
- O consentimento fica ligado à **versão** do termo aceita. Uma versão nova só exige novo aceite se mudar finalidade, dados ou compartilhamento.
- A revogação, pela empresa (UC-21) ou pelo próprio cliente (link do comprovante, sem precisar de conta), inativa o cliente e anonimiza seus dados no Jaguara, exceto o que a empresa deve guardar por lei. A empresa é avisada.

## 5. Texto do termo

**TERMO DE CONSENTIMENTO PARA TRATAMENTO DE DADOS PESSOAIS**

**Empresa:** [RAZÃO SOCIAL], CNPJ [CNPJ], [ENDEREÇO], contato de privacidade [E-MAIL OU TELEFONE].

**1. Quem trata os seus dados.** A empresa acima é a responsável (controladora) pelos seus dados. Ela usa o sistema Jaguara para organizar o atendimento. O Jaguara trata os dados apenas por conta da empresa e segundo as instruções dela (operador).

**2. Quais dados.** Seu nome, CPF (se você informar), telefone, e-mail, os dados dos seus pets (nome, espécie, raça, idade, peso, informações de saúde relevantes para o atendimento) e o histórico de agendamentos, atendimentos e pagamentos com a empresa.

**3. Para quê.**

- Agendar e realizar os serviços que você contratar.
- Manter o histórico dos atendimentos dos seus pets.
- Entrar em contato sobre os seus agendamentos e serviços.

**4. O que não será feito.** Seus dados não serão vendidos, não serão usados para publicidade e não serão compartilhados com outras empresas cadastradas no Jaguara.

**5. Por quanto tempo.** Enquanto você for cliente da empresa ou até você revogar este consentimento. Depois disso, ficam guardados apenas os dados que a empresa precisa manter por obrigação legal.

**6. Seus direitos.** Você pode, a qualquer momento e sem custo, pedir à empresa para ver, corrigir, receber uma cópia ou excluir seus dados e para saber com quem foram compartilhados. A empresa responde em até 15 dias.

**7. Revogação.** Você pode revogar este consentimento quando quiser, pedindo à empresa ou usando o link ou o código QR do seu comprovante. A revogação não afeta o que foi feito antes dela.

**8. Se você não concordar.** Você pode ser atendido normalmente. A empresa apenas não registrará seus dados no Jaguara.

**9. Conta no Jaguara.** Se você criar uma conta de tutor no Jaguara com o mesmo e-mail ou CPF, poderá trazer os seus pets para a sua conta. Isso só acontece com o seu aceite.

[ ] Li e concordo com o tratamento dos meus dados e dos meus pets como descrito acima.

Nome: ______________________ CPF (opcional): ______________ Data: ___/___/______

Assinatura: ______________________

Versão do termo: [VERSÃO] · Vigente desde [DATA]

## Questões em aberto

| ID | Questão | Encaminhamento |
|---|---|---|
| QA-01 | Validação jurídica do texto | Orientador ou assessoria jurídica |
| QA-02 | Prazo de 7 dias para o pré-cadastro pendente | Validar com as empresas do piloto (risco R02) |
