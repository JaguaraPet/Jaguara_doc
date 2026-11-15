# GES-09 · Análise de mercado e concorrência

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | GES-09 · Tamanho do mercado, público-alvo, concorrentes e modelo de negócio |
| Versão | 0.1 |
| Status | Em revisão |
| Autores | Ricardo Guilhen |
| Data | 14/11/2026 |
| Tarefa Jira | JAG-40 |
| Padrão de referência | TAM, SAM e SOM; proto-personas; matriz de concorrentes; Business Model Canvas (resumo) |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 0.1 | 14/11/2026 | Ricardo Guilhen | Primeira versão, a partir do gap apontado na avaliação de 10/11/2026: faltava pesquisa de mercado com dados do setor e concorrentes. |

## 1. Objetivo

Complementar o [GES-08](GES-08-pesquisa-de-mercado.md), que trata de marca, domínio, enquadramento legal, SWOT, Duplo Diamante e GUT, com o que faltava para sustentar o Jaguara como negócio: o tamanho do mercado pet no Brasil, quem são os clientes, quem já atende esse público e como o Jaguara pretende ganhar dinheiro.

## 2. Escopo e método

- **Pesquisa secundária:** dados publicados por associações do setor, IBGE e Sebrae, consultados em 14/11/2026. Cada número tem a fonte ao lado. Quando fontes divergem, o documento diz isso e usa o dado consolidado mais recente.
- **Concorrentes:** levantados em lojas de aplicativos, sites dos produtos e comparadores de software. Preços só aparecem quando publicados, com a fonte.
- **O que não está aqui:** resultados de pesquisa com usuários. O time ainda não aplicou questionário nem entrevistas; a seção 8 traz o roteiro para isso. Personas e preços do Jaguara são **hipóteses** a validar, não resultados.

## 3. Referências

| ID | Fonte | Uso |
|---|---|---|
| REF-01 | Abinpet, [Informações gerais do setor](https://abinpet.org.br/informacoes-gerais-do-setor/) | Faturamento 2024 e projeção 2025 |
| REF-02 | Abinpet, [Indústria pet cresce 11,6% em 2023 em relação a 2022](https://abinpet.org.br/2024/01/industria-pet-cresce-116em-2023-em-relacao-a-2022/) | Crescimento de 2023 |
| REF-03 | IBGE, [Pesquisa Nacional de Saúde 2019, apresentação de resultados](https://anda.ibge.gov.br/media/com_mediaibge/arquivos/a09d971b8c3d3aebfe7e686cc221bc3d.pdf) | Domicílios com cães e gatos |
| REF-04 | Sebrae PR, [Panorama do mercado pet em 2024](https://www.sebraepr.com.br/comunidade/artigo/panorama-do-mercado-pet-em-2024), com dados da Receita Federal | Perfil das empresas do setor |
| REF-05 | Comparadores e lojas: [B2BStack](https://www.b2bstack.com.br/compare/simplesvet-vs-loopvet-sistema-veterinario), [GetApp](https://www.getapp.com/all-software/a/simplesvet/), [App Store: 11pets](https://apps.apple.com/us/app/id1232470530), [App Store: Au-miau](https://apps.apple.com/us/app/-/id6742193574) | Concorrentes e preços publicados |
| REF-06 | Imprensa: [Canaltech sobre o Flockr](https://canaltech.com.br/startup/flockr-app-brasileiro-quer-ser-o-veterinario-de-bolso-do-seu-pet-191259/), [Exame sobre o banho com agendamento da Petlove](https://exame.com/bussola/a-nova-aposta-da-petlove-comeca-por-banho-com-agendamento-online/), [Sebrae PR sobre o PetFácil](https://sebraepr.com.br/comunidade/artigo/empreender-no-mercado-pet-como-o-petfacil-app-conecta-tutores-e-petshops-com-tecnologia-e-praticidade) | Concorrentes |

## 4. Tamanho do mercado

### 4.1 Faturamento do setor pet no Brasil

| Ano | Faturamento | Variação | Fonte |
|---|---|---|---|
| 2023 | — | +11,6% sobre 2022 | REF-02 |
| 2024 | R$ 75,4 bilhões | +9,6% sobre 2023 | REF-01 |
| 2025 (projeção) | R$ 77,2 bilhões | +2,42% sobre 2024 | REF-01 |

- Alimentos industrializados (*pet food*) somaram R$ 40,8 bilhões em 2024, 54,1% do setor (REF-01). O restante se divide entre *pet care*, serviços e saúde veterinária, que são os segmentos em que o Jaguara atua.
- Em setembro de 2024 a própria Abinpet projetava R$ 77 bilhões para 2024; o dado consolidado ficou em R$ 75,4 bilhões. Este documento usa o consolidado.
- A desaceleração projetada para 2025 reforça que o setor busca eficiência, o que favorece ferramentas de gestão de baixo custo para pequenos negócios.

### 4.2 Tutores

| Indicador | Valor | Fonte |
|---|---|---|
| Domicílios com pelo menos um cachorro (2019) | 46,1% dos domicílios, cerca de 33,8 milhões | REF-03 |
| Domicílios com pelo menos um gato (2019) | 19,3% dos domicílios, cerca de 14,1 milhões | REF-03 |
| Variação desde 2013 | Cachorro: de 44,3% para 46,1%; gato: de 17,7% para 19,3% | REF-03 |

Não somamos as duas linhas porque muitos domicílios têm cão e gato. O número seguro é: **pelo menos 33,8 milhões de domicílios** têm um cachorro.

### 4.3 Empresas

| Indicador | Valor | Fonte |
|---|---|---|
| Participação de micro e pequenas empresas no setor | 98% | REF-04 (Receita Federal) |
| Microempreendedores individuais (MEI) no setor | 111.922 | REF-04 (Receita Federal) |
| Participação no faturamento, por tipo de negócio | Pet shops de pequeno e médio porte 49%; grandes redes 9%; clínicas e hospitais veterinários 18% | REF-04 |

Não encontramos um número nacional único e oficial de pet shops e clínicas; as fontes misturam categorias (indústria, agrolojas, criadouros). Por isso o mercado Enterprise é dimensionado pelo perfil: **um setor de pequenos negócios**, sem departamento de TI, que precisa de agenda, cadastro de clientes e contato com o tutor a preço baixo.

### 4.4 TAM, SAM e SOM

| Camada | Definição para o Jaguara | Estimativa |
|---|---|---|
| TAM (mercado total) | Domicílios com cão ou gato e empresas de serviços pet no Brasil | Pelo menos 33,8 milhões de domicílios (REF-03) e um setor formado em 98% por micro e pequenas empresas (REF-04) |
| SAM (mercado atendível) | Tutores com smartphone dispostos a registrar a saúde do pet e pet shops, clínicas, hotéis e creches que atendem com hora marcada, começando por uma região | A medir com a pesquisa primária da seção 8 |
| SOM (meta da v1.0) | O que o Jaguara pretende atender no primeiro ano | 10.000 tutores e 500 empresas, a capacidade definida no RNF05 do [REQ-01](../02-requisitos/REQ-01-ERS.md) |

O SOM é uma meta do projeto, não uma previsão de vendas. Ele dá a escala para validar com o piloto (risco R02).

## 5. Público-alvo e proto-personas

As personas abaixo são **hipóteses do time**, montadas a partir do Duplo Diamante do GES-08 e dos casos de uso. Elas precisam ser confirmadas pela pesquisa da seção 8.

| Persona | Quem é | Dor | O que o Jaguara entrega | Casos de uso |
|---|---|---|---|---|
| **Tutora organizada** | Adulta, um cão e um gato, usa o celular para tudo | Carteira de vacina em papel, esquece doses e vermífugos, não acha exames antigos | Saúde, documentos e lembretes em um lugar, linha do tempo do pet | UC-04, UC-12 a UC-14, UC-34, UC-35 |
| **Tutor de primeira viagem** | Jovem, adotou o primeiro pet | Não sabe o que é normal, quanto vai gastar nem quando vacinar | Lembretes, controle de despesas e o assistente virtual do plano PANTERA para dúvidas gerais | UC-06, UC-31, UC-43 |
| **Família com vários responsáveis** | Pais e filhos dividem os cuidados | Ninguém sabe quem deu o remédio ou levou ao banho | Responsáveis por pet e registro compartilhado | UC-05, UC-14 |
| **Dona de pet shop pequeno** | MEI ou microempresa, banho e tosa, agenda em caderno ou mensagens | Faltas, encaixes, clientes que não confirmam, cadastro espalhado | Agenda, catálogo, solicitações do app, clientes e lembretes | UC-21, UC-24, UC-38, UC-41 |
| **Veterinário de clínica pequena** | Clínica com 1 a 3 profissionais | Histórico incompleto do animal que chega, vacinas feitas em outro lugar | Perfil do pet compartilhado pelo tutor, com escopo e registro do atendimento | UC-20, UC-22, UC-23 |

## 6. Concorrentes

### 6.1 Quem disputa o mesmo público

| Grupo | Exemplos | O que oferecem | Preço publicado | Fonte |
|---|---|---|---|---|
| Apps de saúde do pet para o tutor | Flockr, Au-miau, 11pets | Carteira de vacinação digital, lembretes, peso, documentos | Au-miau gratuito; 11pets gratuito com compras no app | REF-05, REF-06 |
| Gestão para clínicas e pet shops | SimplesVet, Vetus, Loopvet | Agenda, prontuário, estoque, financeiro, lembretes de vacina ao cliente | SimplesVet a partir de cerca de R$ 299 por mês e Loopvet a partir de R$ 99 por mês, segundo comparadores, não pelos sites oficiais | REF-05 |
| Gestão para banho e tosa | Doggi Suite, Syncpetz | Agenda, lembretes automáticos ao cliente, fidelização | Sob consulta | REF-05 |
| Marketplaces e agendamento pelo tutor | Petlove (banho com agendamento online), PetFácil, AgendaPet | Busca de serviço, agendamento e pagamento pelo app | Comissão ou assinatura, não publicadas | REF-06 |

### 6.2 Matriz de funcionalidades

✓ tem; ◐ tem em parte; — não tem ou não informado. Avaliação feita pelas descrições públicas de cada produto em 14/11/2026.

| Funcionalidade | Apps de saúde do pet | Gestão de clínica ou pet shop | Marketplaces de agendamento | **Jaguara** |
|---|---|---|---|---|
| Carteira de vacinas, exames e documentos do pet | ✓ | ◐ (só dentro da clínica) | — | ✓ |
| Lembretes ao tutor | ✓ | ◐ (enviados pela empresa) | ◐ | ✓ |
| Histórico do pet que acompanha o tutor entre empresas | ◐ | — | — | ✓ |
| Compartilhamento com escopo escolhido pelo tutor | — | — | — | ✓ |
| Agenda e catálogo da empresa | — | ✓ | ◐ | ✓ |
| Solicitação de agendamento pelo app do tutor com aceite da empresa | — | ◐ | ✓ | ✓ |
| Cadastro de clientes sem conta, com consentimento LGPD | — | ◐ | — | ✓ |
| Chat tutor–empresa | — | ◐ | ◐ | ✓ |
| Assistente virtual para dúvidas gerais | ◐ | — | — | ✓ (PANTERA) |
| Controle de despesas do pet | ◐ | — | — | ✓ |
| Prontuário clínico completo, estoque e nota fiscal | — | ✓ | — | — (fora do escopo) |

### 6.3 Diferenciais e onde não competir

- **Diferencial:** o Jaguara junta os dois lados. O tutor é dono do histórico do pet e o leva para qualquer empresa; a empresa recebe solicitações e o histórico autorizado sem pedir ao tutor que repita tudo. Os concorrentes atendem um lado só ou prendem o histórico dentro da clínica.
- **Diferencial:** compartilhamento por escopo e consentimento do cliente sem conta ([ARQ-02](../03-arquitetura/ARQ-02-seguranca-e-lgpd.md)), o que dá segurança jurídica ao pequeno negócio.
- **Onde não competir na v1.0:** prontuário veterinário completo, estoque, emissão de nota fiscal e venda de produtos. Esses espaços têm concorrentes maduros (SimplesVet, Vetus) e e-commerces grandes (Petlove). O Jaguara pode integrar com eles depois, pelas integrações e *webhooks* (UC-27, UC-30).

## 7. Modelo de negócio

### 7.1 Resumo do canvas

| Bloco | Conteúdo |
|---|---|
| Segmentos de clientes | Tutores de cães e gatos; pet shops, clínicas, hotéis, creches e casas de cuidado de pequeno porte |
| Proposta de valor | Tutor: a vida do pet em um lugar, levada a qualquer empresa. Empresa: agenda e clientes organizados e solicitações vindas do app, sem custo de implantação |
| Canais | Lojas de aplicativos, web Enterprise, indicação da empresa ao cliente (o convite do UC-21 leva o cliente a criar conta) |
| Relacionamento | Autoatendimento, suporte pelo painel (UC-26), piloto acompanhado com as primeiras empresas |
| Fontes de receita | Assinatura PANTERA do tutor; assinatura da empresa por faixa de uso |
| Recursos principais | Plataforma, time de desenvolvimento, base de empresas parceiras |
| Atividades principais | Desenvolvimento, suporte, aquisição de empresas parceiras |
| Parcerias | Empresas piloto, gateway de pagamento, veterinário consultor (risco R01) |
| Custos | Hospedagem ([ADR-006](../03-arquitetura/adr/ADR-006-hospedagem-e-implantacao.md)), provedor de IA do assistente, e-mail e *push*, taxas do gateway |

### 7.2 Planos (hipóteses a validar)

Os valores abaixo são **hipóteses de partida**, escolhidas para ficar abaixo dos sistemas de gestão publicados na seção 6.1. Eles só devem ser fechados depois da pesquisa da seção 8 (risco R06).

| Plano | Público | O que inclui | Faixa de preço a testar |
|---|---|---|---|
| Gratuito | Tutor | Pets, saúde, documentos, lembretes, despesas, agendamento com empresas, chat | R$ 0 |
| PANTERA | Tutor | Tudo do gratuito e o assistente virtual ([ADR-010](../03-arquitetura/adr/ADR-010-decisoes-de-dominio.md)) | R$ 9,90 a R$ 19,90 por mês |
| Enterprise Essencial | MEI e microempresa, 1 a 2 usuários | Agenda, catálogo, clientes, solicitações do app, chat | R$ 49 a R$ 79 por mês |
| Enterprise Equipe | Pequena empresa, até 10 usuários | Essencial, perfis de permissão, relatórios, indicadores, integrações e *webhooks* | R$ 99 a R$ 149 por mês |

Condições a validar: período de teste gratuito para empresas; primeiras empresas do piloto sem custo (ação do risco R02); custo do assistente virtual por assinante, que limita o piso do PANTERA (limite diário de mensagens no [ARQ-03](../03-arquitetura/ARQ-03-integracoes.md), 3.5).

## 8. Pesquisa primária (roteiro, ainda não aplicada)

### 8.1 Questionário para tutores (formulário on-line, meta de 100 respostas)

1. Quantos e quais animais você tem?
2. Onde você guarda a carteira de vacinação e os exames do seu pet hoje?
3. Nos últimos 12 meses, você esqueceu ou atrasou alguma vacina, vermífugo ou remédio? Quantas vezes?
4. Como você marca banho, tosa ou consulta hoje (telefone, mensagens, app, presencialmente)?
5. Você já precisou repetir o histórico do pet em uma clínica nova? Isso foi um problema?
6. Você deixaria uma clínica ver o histórico do seu pet se pudesse escolher o que ela vê?
7. Quanto você gasta por mês com o pet, aproximadamente?
8. Você pagaria por um assistente que tira dúvidas gerais sobre cuidados com o pet? Até quanto por mês?
9. Que aplicativos para pets você já usou? O que fez você parar de usar?

### 8.2 Entrevista com empresas (meta de 10 pet shops e clínicas pequenas)

1. Como vocês controlam a agenda e os clientes hoje?
2. Quantos clientes faltam ou desmarcam em cima da hora por semana?
3. Como os clientes marcam horário? Quanto tempo a equipe gasta com isso?
4. Que sistema vocês usam ou já usaram? Quanto pagam? Por que trocaram?
5. Vocês coletam autorização dos clientes para guardar dados (LGPD)? Como?
6. Receber solicitações pelo app do tutor e aprovar no painel ajudaria? O que impediria vocês de usar?
7. Quanto pagariam por mês por agenda, clientes e solicitações do app?

### 8.3 Como os resultados entram na documentação

As respostas atualizam este documento (SAM, personas e preços), o risco R06 do [GES-05](GES-05-registro-de-riscos.md) e, se mudarem prioridades, o MoSCoW do [REQ-01](../02-requisitos/REQ-01-ERS.md).

## Questões em aberto

| ID | Questão | Encaminhamento |
|---|---|---|
| QA-01 | Aplicar a pesquisa primária da seção 8 | Time, em data a definir; os resultados mudam o SAM, as personas e os preços |
| QA-02 | Preços finais do PANTERA e da Enterprise | Depois da QA-01 e do custo real do provedor de IA |
| QA-03 | Número nacional de pet shops e clínicas por CNAE | Consulta aos dados abertos de CNPJ da Receita Federal |
