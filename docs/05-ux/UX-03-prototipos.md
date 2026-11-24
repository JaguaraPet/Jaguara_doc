# UX-03 · Protótipos de alta fidelidade

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | UX-03 · Protótipos de alta fidelidade |
| Versão | 1.0 |
| Status | Em revisão |
| Autores | Micaela Dorneles |
| Data | 23/11/2026 |
| Tarefa Jira | JAG-99 (exportação); telas nas JAG-83 e JAG-130 a JAG-134 |
| Padrão de referência | Protótipo a partir do [UX-01](UX-01-mapa-de-navegacao.md) e do [UX-02](UX-02-guia-de-estilo.md) |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 0.5 | 01/11/2026 | Ricardo Guilhen | Estrutura do documento, telas a prototipar e regras de exportação. Protótipos em andamento no Figma. |
| 1.0 | 23/11/2026 | Micaela Dorneles | Exportação das 25 telas das JAG-83 e JAG-130 a JAG-134 em PNG 2x e PDF, com os arquivos de origem em HTML. |

## 1. Objetivo

Registrar os protótipos de alta fidelidade do Jaguara e manter no repositório a exportação de cada tela, como exige a avaliação de artefatos ("comitar o export do arquivo").

## 2. Como os protótipos são feitos

Cada tarefa de protótipo tem um arquivo de origem em HTML, em [`prototipos/fontes/`](prototipos/fontes/), com os *tokens* do [UX-02](UX-02-guia-de-estilo.md) (cores, Inter, espaçamentos, raio e área de toque de 44 px) e os textos e dados de exemplo das telas. As telas do app ficam em quadros de 390 × 844 px e as da web em 1440 × 900 px.

O arquivo de origem abre no navegador, com um quadro por tela no padrão `JAG-nn · NN Tela`. A exportação desta versão foi gerada dos mesmos arquivos, que são a fonte para qualquer ajuste.

| Item | Valor |
|---|---|
| Arquivos de origem | Seção 4 |
| Exportação das telas | [`prototipos/`](prototipos/), PNG 2x |
| Todas as telas em um arquivo | [`UX-03-prototipos.pdf`](prototipos/UX-03-prototipos.pdf) |

## 3. Telas

| # | Tela | Frente | Casos de uso | Tarefa |
|---|---|---|---|---|
| 01 | [Login da empresa](prototipos/UX-03-01-login-da-empresa.png) | Web | UC-02, UC-38 | JAG-83 |
| 02 | [Catálogo de serviços e recursos](prototipos/UX-03-02-catalogo-de-servicos-e-recursos.png) | Web | UC-02, UC-38 | JAG-83 |
| 03 | [Lista de pets](prototipos/UX-03-03-lista-de-pets.png) | App | UC-04, UC-12 a UC-14, UC-37 | JAG-130 |
| 04 | [Cadastrar pet](prototipos/UX-03-04-cadastrar-pet.png) | App | UC-04, UC-12 a UC-14, UC-37 | JAG-130 |
| 05 | [Perfil do pet](prototipos/UX-03-05-perfil-do-pet.png) | App | UC-04, UC-12 a UC-14, UC-37 | JAG-130 |
| 06 | [Vacinas](prototipos/UX-03-06-vacinas.png) | App | UC-04, UC-12 a UC-14, UC-37 | JAG-130 |
| 07 | [Medicamentos](prototipos/UX-03-07-medicamentos.png) | App | UC-04, UC-12 a UC-14, UC-37 | JAG-130 |
| 08 | [Alergias e restrições](prototipos/UX-03-08-alergias-e-restricoes.png) | App | UC-04, UC-12 a UC-14, UC-37 | JAG-130 |
| 09 | [Agenda](prototipos/UX-03-09-agenda.png) | App | UC-09, UC-10, UC-31 | JAG-131 |
| 10 | [Novo evento](prototipos/UX-03-10-novo-evento.png) | App | UC-09, UC-10, UC-31 | JAG-131 |
| 11 | [Google Agenda](prototipos/UX-03-11-google-agenda.png) | App | UC-09, UC-10, UC-31 | JAG-131 |
| 12 | [Notificações](prototipos/UX-03-12-notificacoes.png) | App | UC-09, UC-10, UC-31 | JAG-131 |
| 13 | [Preferências de notificação](prototipos/UX-03-13-preferencias-de-notificacao.png) | App | UC-09, UC-10, UC-31 | JAG-131 |
| 14 | [Serviços](prototipos/UX-03-14-servicos.png) | App | UC-33, UC-40, UC-42, UC-44 | JAG-132 |
| 15 | [Empresa e catálogo](prototipos/UX-03-15-empresa-e-catalogo.png) | App | UC-33, UC-40, UC-42, UC-44 | JAG-132 |
| 16 | [Solicitar agendamento](prototipos/UX-03-16-solicitar-agendamento.png) | App | UC-33, UC-40, UC-42, UC-44 | JAG-132 |
| 17 | [Minhas solicitações](prototipos/UX-03-17-minhas-solicitacoes.png) | App | UC-33, UC-40, UC-42, UC-44 | JAG-132 |
| 18 | [Detalhe da solicitação](prototipos/UX-03-18-detalhe-da-solicitacao.png) | App | UC-33, UC-40, UC-42, UC-44 | JAG-132 |
| 19 | [Pagar com PIX](prototipos/UX-03-19-pagar-com-pix.png) | App | UC-33, UC-40, UC-42, UC-44 | JAG-132 |
| 20 | [Agenda semanal](prototipos/UX-03-20-agenda-semanal.png) | Web | UC-23, UC-24, UC-41 | JAG-133 |
| 21 | [Solicitações](prototipos/UX-03-21-solicitacoes.png) | Web | UC-23, UC-24, UC-41 | JAG-133 |
| 22 | [Registrar atendimento](prototipos/UX-03-22-registrar-atendimento.png) | Web | UC-23, UC-24, UC-41 | JAG-133 |
| 23 | [Funcionários](prototipos/UX-03-23-funcionarios.png) | Web | UC-16, UC-19, UC-46 | JAG-134 |
| 24 | [Perfis de acesso](prototipos/UX-03-24-perfis-de-acesso.png) | Web | UC-16, UC-19, UC-46 | JAG-134 |
| 25 | [Privacidade](prototipos/UX-03-25-privacidade.png) | Web | UC-16, UC-19, UC-46 | JAG-134 |

## 4. Arquivos de origem

| Tarefa | Arquivo |
|---|---|
| JAG-83 | [`jag-83-login-e-catalogo-web.html`](prototipos/fontes/jag-83-login-e-catalogo-web.html) |
| JAG-130 | [`jag-130-pets-e-saude-app.html`](prototipos/fontes/jag-130-pets-e-saude-app.html) |
| JAG-131 | [`jag-131-agenda-e-notificacoes-app.html`](prototipos/fontes/jag-131-agenda-e-notificacoes-app.html) |
| JAG-132 | [`jag-132-catalogo-e-solicitacoes-app.html`](prototipos/fontes/jag-132-catalogo-e-solicitacoes-app.html) |
| JAG-133 | [`jag-133-agenda-e-atendimento-web.html`](prototipos/fontes/jag-133-agenda-e-atendimento-web.html) |
| JAG-134 | [`jag-134-equipe-e-privacidade-web.html`](prototipos/fontes/jag-134-equipe-e-privacidade-web.html) |

## 5. Exportação para o repositório

1. Ajuste a tela no arquivo de origem.
2. Exporte cada quadro em **PNG 2x** e o conjunto em **PDF**.
3. Salve em `docs/05-ux/prototipos/` com o nome `UX-03-<numero>-<tela>.png` e o PDF como `UX-03-prototipos.pdf`.
4. Atualize a tabela da seção 3 e faça o commit (`docs(ux): exporta protótipos de ...`).

## 6. Galeria

### 01 · Login da empresa (JAG-83)

![Login da empresa](prototipos/UX-03-01-login-da-empresa.png)

### 02 · Catálogo de serviços e recursos (JAG-83)

![Catálogo de serviços e recursos](prototipos/UX-03-02-catalogo-de-servicos-e-recursos.png)

### 03 · Lista de pets (JAG-130)

![Lista de pets](prototipos/UX-03-03-lista-de-pets.png)

### 04 · Cadastrar pet (JAG-130)

![Cadastrar pet](prototipos/UX-03-04-cadastrar-pet.png)

### 05 · Perfil do pet (JAG-130)

![Perfil do pet](prototipos/UX-03-05-perfil-do-pet.png)

### 06 · Vacinas (JAG-130)

![Vacinas](prototipos/UX-03-06-vacinas.png)

### 07 · Medicamentos (JAG-130)

![Medicamentos](prototipos/UX-03-07-medicamentos.png)

### 08 · Alergias e restrições (JAG-130)

![Alergias e restrições](prototipos/UX-03-08-alergias-e-restricoes.png)

### 09 · Agenda (JAG-131)

![Agenda](prototipos/UX-03-09-agenda.png)

### 10 · Novo evento (JAG-131)

![Novo evento](prototipos/UX-03-10-novo-evento.png)

### 11 · Google Agenda (JAG-131)

![Google Agenda](prototipos/UX-03-11-google-agenda.png)

### 12 · Notificações (JAG-131)

![Notificações](prototipos/UX-03-12-notificacoes.png)

### 13 · Preferências de notificação (JAG-131)

![Preferências de notificação](prototipos/UX-03-13-preferencias-de-notificacao.png)

### 14 · Serviços (JAG-132)

![Serviços](prototipos/UX-03-14-servicos.png)

### 15 · Empresa e catálogo (JAG-132)

![Empresa e catálogo](prototipos/UX-03-15-empresa-e-catalogo.png)

### 16 · Solicitar agendamento (JAG-132)

![Solicitar agendamento](prototipos/UX-03-16-solicitar-agendamento.png)

### 17 · Minhas solicitações (JAG-132)

![Minhas solicitações](prototipos/UX-03-17-minhas-solicitacoes.png)

### 18 · Detalhe da solicitação (JAG-132)

![Detalhe da solicitação](prototipos/UX-03-18-detalhe-da-solicitacao.png)

### 19 · Pagar com PIX (JAG-132)

![Pagar com PIX](prototipos/UX-03-19-pagar-com-pix.png)

### 20 · Agenda semanal (JAG-133)

![Agenda semanal](prototipos/UX-03-20-agenda-semanal.png)

### 21 · Solicitações (JAG-133)

![Solicitações](prototipos/UX-03-21-solicitacoes.png)

### 22 · Registrar atendimento (JAG-133)

![Registrar atendimento](prototipos/UX-03-22-registrar-atendimento.png)

### 23 · Funcionários (JAG-134)

![Funcionários](prototipos/UX-03-23-funcionarios.png)

### 24 · Perfis de acesso (JAG-134)

![Perfis de acesso](prototipos/UX-03-24-perfis-de-acesso.png)

### 25 · Privacidade (JAG-134)

![Privacidade](prototipos/UX-03-25-privacidade.png)

## Questões em aberto

Nenhuma. A revisão visual com a identidade do time ajusta os arquivos de origem e gera uma nova exportação.
