# GES-08 · Pesquisa de mercado e análise estratégica

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | GES-08 · Pesquisa de mercado, SWOT, Duplo Diamante e Matriz GUT |
| Versão | 2.0 |
| Status | Aprovado |
| Autores | Micaela Dorneles, Miguel Drozino, Nathan Rodrigues, Ricardo Guilhen |
| Data | 01/11/2026 |
| Tarefa Jira | JAG-16, JAG-18, JAG-19, JAG-20 (elaboração), JAG-51 (migração) |
| Padrão de referência | SWOT, Duplo Diamante (Design Council), Matriz GUT |
| Original | [GES-08-pesquisa-de-mercado-original.pdf](../anexos/originais/GES-08-pesquisa-de-mercado-original.pdf) |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 1.0 | 27/08/2026 | Equipe Jaguara | Entrega à disciplina de Gestão de Projetos Tecnológicos (prof. Cassiano Borim). |
| 1.1 | 28/08/2026 | Equipe Jaguara | SWOT desenvolvida em documento próprio. |
| 2.0 | 01/11/2026 | Ricardo Guilhen | Migração para o repositório, com a SWOT desenvolvida incorporada. A RACI passou para o [GES-04](GES-04-RACI.md) e os riscos para o [GES-05](GES-05-registro-de-riscos.md). |

## 1. Objetivo

Registrar a pesquisa de mercado e as ferramentas de análise que fundamentaram o escopo do Jaguara: viabilidade do nome e do domínio, enquadramento legal, posicionamento (SWOT), processo de concepção (Duplo Diamante) e priorização de riscos (GUT).

## 2. Domínios

| Domínio | Registrador | Custo | Observação |
|---|---|---|---|
| jaguarapet.com.br | Registro.br | R$ 40,00 por ano | Disponível; nome fácil e associado ao projeto. O domínio jaguara.com.br já é usado por uma loja de tecnologia. |
| jaguarapet.com | GoDaddy | R$ 220,00 por 3 anos (primeiro ano por R$ 0,01) | Mais caro, mas gera credibilidade. Outras extensões (.net) têm valor semelhante; .org custa R$ 75,00 por ano. |

## 3. Registro de marca (INPI)

A busca no INPI pelos nomes "Jaguara", "jaguara", "jaguara pet" e "Jaguara Pet", na classe Nice NCL 42 (sistemas e produtos de tecnologia), não retornou nenhum registro ativo. O pedido de registro é a ação do risco R04.

## 4. Código de Defesa do Consumidor (CDC)

| Artigo | Tema | Aplicação no Jaguara |
|---|---|---|
| Art. 6 | Direitos básicos, informação adequada e clara | Termos e telas com informações claras |
| Art. 8 | Segurança à saúde | Deixar claro que o Jaguara não substitui orientação veterinária |
| Art. 14 | Responsabilidade por defeitos na prestação de serviço | Indisponibilidade do sistema; metas de disponibilidade |
| Art. 30 | Vinculação da oferta | Preços do catálogo de serviços (RN27) |
| Art. 31 | Informações corretas sobre produtos e serviços | Catálogo das empresas |
| Art. 34 | Responsabilidade solidária por prepostos | Empresas e funcionários parceiros |
| Art. 35 | Descumprimento da oferta | Cancelamento e reembolso de serviços |
| Art. 39 | Práticas abusivas | Venda casada e recusa de atendimento |
| Art. 46 | Contrato sem possibilidade de conhecimento | Aceite explícito dos termos (RF45) |
| Art. 49 | Direito de arrependimento em 7 dias | Assinatura do plano PANTERA e serviços pagos |
| Art. 51 | Cláusulas abusivas são nulas | Revisão dos termos de uso |

## 5. LGPD: mapeamento de dados

### 5.1 Dados captados

| Titular | Dados |
|---|---|
| Tutores | Nome completo, CPF, endereço, telefone, e-mail, dados de acesso, informações de uso e permissões |
| Pets | Nome, espécie, raça, vacinação, medicamentos, alimentação, consultas, exames, cirurgias, banho e tosa, hospedagem, despesas e rotina |
| Empresas e funcionários | CNPJ, nome da empresa, dados dos funcionários (nome, identificação, registro), informações profissionais, permissões e atendimentos |

### 5.2 Dados armazenados

| Categoria | Dados armazenados |
|---|---|
| Usuário | Nome, CPF, e-mail, telefone e identificador |
| Autenticação | Credenciais e informações de sessão |
| Pet | Nome, espécie, raça e responsável |
| Saúde do pet | Vacinas, medicamentos, consultas, exames e procedimentos |
| Rotina | Alimentação, calendário, banho, tosa e hospedagem |
| Financeiro | Despesas relacionadas aos pets |
| Empresas | CNPJ, cadastro e informações operacionais |
| Funcionários | Cadastro, vínculo e permissões |
| Atendimento | Registros e observações dos atendimentos |
| Segurança | Logs e registros de atividades |
| Integrações | Informações necessárias para integrações autorizadas |

### 5.3 Dados compartilhados

- Dados do pet e do tutor com clínicas veterinárias autorizadas;
- informações do pet com funcionários autorizados de empresas Enterprise;
- dados necessários para serviços externos integrados e para calendários autorizados;
- dados necessários para serviços de infraestrutura e tecnologia;
- informações entre usuários autorizados pelo tutor.

Os dados só são compartilhados quando há necessidade e autorização do titular.

### 5.4 Dados comercializados

Nenhum dado pessoal é comercializado. Podem ser divulgadas apenas estatísticas agregadas e anônimas (por exemplo: "a maioria dos usuários contrata um serviço nos três primeiros meses").

O tratamento técnico desses dados está no [ARQ-02](../03-arquitetura/ARQ-02-seguranca-e-lgpd.md).

## 6. Análise SWOT

| | Positivo | Negativo |
|---|---|---|
| **Interno** | **Forças:** centralização de funcionalidades; fácil de usar no dia a dia; integração com veterinários e serviços; aplicativo gratuito | **Fraquezas:** recursos financeiros limitados; conhecimento limitado sobre a área veterinária; não vendemos produtos na plataforma |
| **Externo** | **Oportunidades:** inteligência artificial; veterinários que procuram inovação; parcerias com o ecossistema pet; venda de produtos na plataforma | **Ameaças:** concorrência estabelecida; dificuldade de captação de investimento; mudanças na legislação; falta de interesse em versões pagas |

### 6.1 Forças

- **Centralização de funcionalidades:** reúne histórico de saúde, vacinas, medicações, consultas e gastos em um só lugar, substituindo a carteira em papel, fotos de receitas e anotações avulsas. O histórico acumulado aumenta a retenção e o custo de troca.
- **Fácil de usar no dia a dia:** registrar o peso, anexar um exame e conferir a próxima dose são ações frequentes e rápidas, então a interface prevê poucos toques e lembretes automáticos. Como parte do público tem pouca familiaridade tecnológica, a simplicidade é fator direto de adoção.
- **Integração com veterinários e serviços:** a plataforma do profissional dá origem clínica ao dado e reduz o retrabalho na consulta. Gera efeito de rede: mais clínicas atraem tutores e mais tutores atraem clínicas.
- **Aplicativo gratuito:** elimina a barreira de entrada e acelera a formação da base de usuários; em contrapartida, os custos de operação precisam ser sustentados antes de qualquer receita.

### 6.2 Fraquezas

- **Recursos financeiros limitados:** sem investimento externo, ficam restritos os gastos com infraestrutura, lojas de aplicativos e marketing, o que obriga a priorizar rigorosamente o MVP.
- **Conhecimento limitado sobre a área veterinária:** crítico em intervalos de vacinação e alertas de dosagem; exige validação com profissional parceiro e nenhuma recomendação clínica automatizada.
- **Não vendemos produtos na plataforma:** perde-se a receita de comissão e um motivo recorrente de retorno ao aplicativo.

### 6.3 Oportunidades

- **Inteligência artificial:** detectar padrões de peso e sintomas, ler carteirinhas por imagem e gerar lembretes personalizados, de forma orientativa e não diagnóstica.
- **Veterinários que procuram inovação:** clínicas pequenas e médias ainda operam com papel ou sistemas caros; cada parceira vira canal de distribuição e fonte de credibilidade.
- **Parcerias com o ecossistema pet:** pet shops, banho e tosa, hospedagem, adestramento, planos de saúde e seguros ampliam a utilidade sem custo proporcional de desenvolvimento.
- **Venda de produtos:** marketplace, afiliação ou assinatura de itens, recomendados a partir dos dados do animal.

### 6.4 Ameaças

- **Concorrência estabelecida:** carteiras de vacinação digitais e sistemas de gestão de clínicas que podem lançar módulo para tutores.
- **Dificuldade de captação de investimento:** um aplicativo gratuito sem receita comprovada tem dificuldade de demonstrar tração.
- **Mudanças na legislação:** LGPD, normas do CFMV e regras de venda de medicamentos veterinários podem exigir remover funcionalidades.
- **Falta de interesse em versões pagas:** o freemium depende de conversão mínima para cobrir os usuários gratuitos.

## 7. Duplo Diamante

| Fase | Objetivos | Métodos |
|---|---|---|
| **Descobrir** | Identificar a dificuldade dos tutores em centralizar saúde, rotina e gastos; identificar a carência de integração digital entre clínicas e clientes; entender a viabilidade técnica e legal | Pesquisa de mercado; pesquisa de domínios; gestão e planejamento de informações; pesquisa de usuários; mapeamento de LGPD e CDC |
| **Definir** | Delimitar o escopo viável; sintetizar no brief: plataforma web e mobile para o universo pet, com módulos Tutor e Enterprise | Documento de requisitos e especificação de casos de uso; gestão do projeto |
| **Desenvolver** | Transformar o escopo em produto; estruturar o banco PostgreSQL; construir as APIs em Node.js com TypeScript, preparando integrações, webhooks e testes iterativos | Prototipação; métodos de desenvolvimento; equipes multidisciplinares; testes |
| **Entregar** | Lançar a plataforma web e mobile; garantir fluxo seguro de dados, com permissões e sincronização em tempo real; estabelecer canais de suporte | Validação das regras de negócio; lançamento |

## 8. Matriz GUT

### 8.1 Escala

| Nota | Gravidade (G): impacto se nada for feito | Urgência (U): prazo para agir | Tendência (T): evolução se ignorado |
|---|---|---|---|
| 5 | Extremamente grave: pode inviabilizar o projeto | Ação imediata, antes do desenvolvimento | Piora rapidamente; correção muito mais cara |
| 4 | Muito grave: compromete a proposta de valor | Ação na fase atual (Definir) | Piora a curto prazo |
| 3 | Grave: exige retrabalho relevante | Ação antes do lançamento do MVP | Piora a médio prazo |
| 2 | Pouco grave: impacto localizado | Ação após o lançamento | Piora lentamente |
| 1 | Sem gravidade | Sem prazo definido | Permanece estável |

Critério de desempate: prevalece o risco de maior Gravidade; persistindo o empate, o de maior Urgência.

### 8.2 Priorização

| ID | Risco ou problema | Origem | G | U | T | G×U×T | Prioridade |
|---|---|---|---|---|---|---|---|
| 1 | Limite de conhecimento específico sobre a área de veterinária | SWOT, fraqueza | 5 | 5 | 4 | 100 | 1º |
| 2 | Baixa adesão das clínicas veterinárias à integração | SWOT, oportunidades / risco de adoção | 5 | 4 | 4 | 80 | 2º |
| 3 | Incidente de segurança com dados pessoais de tutores e pets | Mapeamento LGPD | 5 | 5 | 3 | 75 | 3º |
| 4 | Indeferimento ou conflito no registro da marca "Jaguara Pet" na NCL 42 | Pesquisa INPI | 4 | 4 | 4 | 64 | 4º |
| 5 | Mudanças repentinas na legislação (LGPD, CDC, animais) | SWOT, ameaça | 5 | 3 | 4 | 60 | 5º |
| 6 | Falta de interesse em converter para versões premium | SWOT, ameaça | 4 | 3 | 4 | 48 | 6º |
| 7 | Falta de capital inicial para impulsionamento e marketing | SWOT, fraqueza e ameaça | 4 | 3 | 3 | 36 | 7º |
| 8 | Responsabilização por indisponibilidade ou por conteúdo interpretado como orientação veterinária | CDC, art. 8 e 14 | 5 | 2 | 3 | 30 | 8º |

### 8.3 Plano de ação

| ID | Ação preventiva | Responsáveis |
|---|---|---|
| 1 | Consultoria com médico veterinário para validar campos de saúde, terminologia e regras de negócio | Miguel Drozino (A), veterinário parceiro (C) |
| 2 | Validar o módulo Enterprise com clínicas antes do desenvolvimento; piloto gratuito às primeiras parceiras | Miguel Drozino (A), Micaela Dorneles (R) |
| 3 | Criptografia em repouso e em trânsito, controle de acesso por permissão e logs de auditoria já na modelagem do PostgreSQL; coleta mínima de CPF e endereço | Ricardo Guilhen (A/R) |
| 4 | Depositar o pedido de marca na NCL 42 e registrar jaguarapet.com.br e jaguarapet.com antes da divulgação | Miguel Drozino (A/R) |
| 5 | Monitorar a legislação e revisar termos e política de privacidade a cada semestre | Miguel Drozino (A), Ricardo Guilhen (C) |
| 6 | Testar percepção de valor e faixas de preço com tutores antes de fechar a monetização | Micaela Dorneles (R), Miguel Drozino (A) |
| 7 | MVP enxuto, priorizando a versão gratuita com anúncios e adiando funcionalidades de alto custo | Miguel Drozino (A/R) |
| 8 | Aviso explícito de que a plataforma não substitui orientação veterinária; critérios de disponibilidade e limites de responsabilidade nos Termos de Uso, respeitando o CDC | Miguel Drozino (A/R), Nathan Rodrigues (C) |

### 8.4 Justificativa da aplicação

A Matriz GUT foi aplicada para priorizar, em um único instrumento comparável, os riscos e pontos fracos levantados na SWOT, na pesquisa de mercado e no mapeamento legal. A coluna de origem garante rastreabilidade: nenhum risco foi introduzido sem respaldo em análise anterior. "Recursos financeiros" e "falta de capital inicial" foram consolidados por descreverem o mesmo problema. Foram acrescentados três riscos que a SWOT não capturava explicitamente: a dependência de terceiros na integração veterinária, a exposição a incidentes com dados pessoais e a ausência de registro da marca. Nenhuma nota de Gravidade ficou abaixo de 3 porque a matriz foi aplicada sobre itens já filtrados pela SWOT. Os três primeiros colocados são riscos cuja janela de correção se fecha quando o desenvolvimento começa: conhecimento de domínio, parcerias e arquitetura de dados.

A evolução desses riscos é acompanhada no [registro de riscos (GES-05)](GES-05-registro-de-riscos.md).
