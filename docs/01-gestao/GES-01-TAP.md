# GES-01 · Termo de Abertura do Projeto

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | GES-01 · Termo de Abertura do Projeto (TAP) |
| Versão | 2.0 |
| Status | Aprovado |
| Autores | Micaela Dorneles, Miguel Drozino, Nathan Rodrigues, Ricardo Guilhen |
| Data | 01/11/2026 |
| Tarefa Jira | JAG-4 (elaboração), JAG-51 (migração) |
| Padrão de referência | PMBOK, Termo de Abertura do Projeto |
| Original | [GES-01-TAP-original.pdf](../anexos/originais/GES-01-TAP-original.pdf) |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 1.0 | 24/08/2026 | Equipe Jaguara | Primeira versão do TAP. |
| 1.1 | 08/09/2026 | Equipe Jaguara | Revisão após orientação (JAG-4). |
| 2.0 | 01/11/2026 | Ricardo Guilhen | Migração para o repositório no modelo padrão, sem alteração de conteúdo. |

## 1. O que é o Jaguara

O Jaguara é uma plataforma web e mobile voltada ao gerenciamento inteligente e centralizado de animais de estimação. O sistema atende tutores, no controle de rotina, medicamentos, vacinas, alimentação, despesas e calendário médico, e empresas do setor pet (como clínicas e pet shops) por meio da modalidade **Enterprise**, que inclui gestão de clientes, agendamentos, relatórios avançados e *Business Intelligence*. Com controle rigoroso de acessos, regras para proteção de dados (LGPD) e sincronização em tempo real, a aplicação busca oferecer uma experiência intuitiva, segura e escalável para todo o ecossistema de cuidados com os pets.

## 2. Objetivo do projeto

Desenvolver o Jaguara, uma plataforma digital composta por um aplicativo mobile, complementado por uma plataforma web, com o objetivo de facilitar o gerenciamento do dia a dia, da saúde, dos cuidados e dos custos relacionados aos animais de estimação.

A solução também deverá possibilitar sua integração com uma plataforma destinada a profissionais da área veterinária, permitindo maior conexão entre tutores, animais e profissionais e contribuindo para um acompanhamento mais completo da saúde dos pets.

## 3. Escopo de alto nível

O projeto contempla:

- uma aplicação mobile destinada principalmente aos tutores de pets;
- uma plataforma web de apoio à solução;
- gerenciamento de dados relacionados aos animais;
- organização e acompanhamento de informações de saúde;
- controle de custos relacionados aos pets;
- recursos para facilitar o acompanhamento dos cuidados e da rotina dos animais;
- integração com uma plataforma voltada a profissionais veterinários;
- compartilhamento e acesso às informações dos pets de acordo com as permissões estabelecidas.

## 4. Principais entregas

| # | Entrega | Detalhamento |
|---|---|---|
| 1 | Definição da solução do projeto | [GES-08](GES-08-pesquisa-de-mercado.md) |
| 2 | Levantamento e documentação de requisitos | [REQ-01](../02-requisitos/REQ-01-ERS.md) a [REQ-06](../02-requisitos/REQ-06-matriz-de-rastreabilidade.md) |
| 3 | Modelagem da solução | [MOD-01](../04-modelagem/MOD-01-modelo-de-classes.md) a [MOD-05](../04-modelagem/MOD-05-diagramas-de-atividade.md), [ARQ-01](../03-arquitetura/ARQ-01-arquitetura.md) |
| 4 | Desenvolvimento de funcionalidades do aplicativo mobile | Repositório de frontend |
| 5 | Desenvolvimento de funcionalidades da plataforma web | Repositório de frontend |
| 6 | Documentação do sistema | Este repositório |
| 7 | Implementação das funções previstas | Repositório de backend |
| 8 | Testes e validação da solução | [TST-01](../05-testes/TST-01-plano-de-testes.md) a [TST-03](../05-testes/TST-03-relatorio-de-testes.md) |
| 9 | Entrega da versão 1.0 | [ENT-04](../07-entrega/ENT-04-notas-de-versao.md) |

A decomposição das entregas está na [EAP (GES-02)](GES-02-EAP.md).

## 5. Stakeholders

- Tutores e donos de animais de estimação;
- profissionais da área veterinária;
- empresas e organizações relacionadas ao cuidado animal;
- equipe responsável pelo desenvolvimento do projeto;
- patrocinadores e responsáveis pelo produto.

Os papéis de cada parte interessada estão na [matriz RACI (GES-04)](GES-04-RACI.md).

## 6. Premissas

- Os usuários terão acesso a dispositivos compatíveis com a solução;
- os usuários fornecerão as informações necessárias para o gerenciamento dos pets;
- a integração com a plataforma destinada aos profissionais veterinários será realizada conforme as definições técnicas do projeto;
- os requisitos poderão ser discutidos e refinados durante o desenvolvimento;
- a infraestrutura tecnológica necessária estará disponível para o desenvolvimento e o funcionamento da solução.

## 7. Restrições

- Prazo definido para desenvolvimento e entrega;
- recursos humanos e financeiros disponíveis para o projeto;
- tecnologias e infraestrutura disponíveis;
- dependência de serviços e sistemas externos para determinadas integrações;
- segurança e controle de acesso às informações dos usuários e dos animais.

## 8. Riscos iniciais

- Alterações nos requisitos durante o desenvolvimento;
- atrasos nas etapas de desenvolvimento;
- dificuldades técnicas nas integrações com sistemas externos;
- indisponibilidade de recursos necessários para o projeto;
- problemas de segurança ou privacidade relacionados às informações armazenadas;
- dificuldades de adoção da solução pelos usuários.

O tratamento desses riscos está no [registro de riscos (GES-05)](GES-05-registro-de-riscos.md).

## 9. Critérios de sucesso

O projeto será considerado bem-sucedido quando a solução:

- disponibilizar uma aplicação mobile funcional para os tutores;
- disponibilizar a plataforma web em funcionamento voltada para os profissionais da área animal;
- permitir o gerenciamento das principais informações relacionadas aos pets;
- facilitar o acompanhamento da saúde, dos cuidados e dos custos dos animais;
- possibilitar a integração com a plataforma destinada aos profissionais veterinários;
- atender aos requisitos definidos e documentados para o projeto;
- passar pelos testes e validações estabelecidos;
- apresentar uma experiência de uso adequada e eficiente aos seus usuários.

## 10. Aprovação do projeto

A aprovação deste Termo de Abertura autoriza o início do projeto Jaguara e reconhece seu objetivo, escopo de alto nível, principais entregas, condições iniciais, premissas, restrições, riscos iniciais e critérios de sucesso.

| Integrante | Matrícula |
|---|---|
| Micaela Dorneles | 23150068-2 |
| Miguel Drozino | 23155078-2 |
| Nathan Rodrigues | 23025003-2 |
| Ricardo Guilhen | 23013569-2 |
