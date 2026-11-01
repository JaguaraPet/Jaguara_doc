# GES-04 · Matriz RACI

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | GES-04 · Registro de partes interessadas e matriz RACI |
| Versão | 2.0 |
| Status | Aprovado |
| Autores | Micaela Dorneles, Miguel Drozino, Nathan Rodrigues, Ricardo Guilhen |
| Data | 01/11/2026 |
| Tarefa Jira | JAG-21 (elaboração), JAG-51 (migração) |
| Padrão de referência | PMBOK, matriz de responsabilidades (RACI) |
| Original | [GES-08-pesquisa-de-mercado-original.pdf](../anexos/originais/GES-08-pesquisa-de-mercado-original.pdf) |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 1.0 | 27/08/2026 | Equipe Jaguara | Matriz entregue com a pesquisa de mercado (JAG-21). |
| 2.0 | 01/11/2026 | Ricardo Guilhen | Migração para documento próprio; inclusão do registro de partes interessadas e das atividades de documentação da Sprint 7. |

## 1. Objetivo

Definir quem é Responsável (R), Aprovador (A), Consultado (C) e Informado (I) em cada atividade do projeto. Cada atividade tem um único aprovador.

## 2. Registro de partes interessadas

| Sigla | Parte interessada | Tipo | Papel |
|---|---|---|---|
| MV | Micaela Dorneles | Interna | UX/UI, pesquisa com usuários e prototipação |
| MD | Miguel Drozino | Interna | Gerente de projeto e documentação |
| NR | Nathan Rodrigues | Interna | Frontend, mobile e testes |
| RG | Ricardo Guilhen | Interna | Backend, banco de dados e arquitetura |
| PROF | Professores orientadores (Cassiano Borim, Enderson Menezes) | Externa | Patrocinadores e avaliadores acadêmicos |
| VET | Clínicas e profissionais veterinários parceiros | Externa | Validação do domínio e usuários do módulo Enterprise |
| TUT | Tutores (usuários finais e *beta testers*) | Externa | Usuários do aplicativo |

## 3. Matriz RACI

| ID | Atividade | MD | MV | NR | RG | PROF | VET | TUT |
|---|---|---|---|---|---|---|---|---|
| 1 | Pesquisa de mercado e análise de concorrentes | A | R | R | R | I | C | C |
| 2 | Pesquisa e registro de domínios (Registro.br / GoDaddy) | A/R | C | I | I | I | – | – |
| 3 | Pesquisa de marca no INPI (NCL 42) | A/R | I | I | I | I | – | – |
| 4 | Pesquisa com usuários (tutores e veterinários) | A | I | R | C | I | C | C |
| 5 | Mapeamento LGPD (dados captados, armazenados e compartilhados) | A | R | C | C | C | C | I |
| 6 | Adequação ao CDC (termos de uso e política de privacidade) | A/R | C | C | I | C | I | I |
| 7 | Análise SWOT e Matriz GUT (gestão de riscos) | A/R | C | C | C | C | – | – |
| 8 | Definição do escopo e do brief (módulos Tutor e Enterprise) | A/R | C | C | C | C | C | I |
| 9 | Documento de requisitos e especificação de casos de uso | A | R | R | C | I | C | I |
| 10 | Prototipação da interface (web e mobile) | I | C | A/R | R | I | C | C |
| 11 | Modelagem e estruturação do banco PostgreSQL | I | A/R | I | C | – | – | – |
| 12 | Arquitetura e desenvolvimento das APIs (Node.js + TypeScript) | I | A/R | I | C | – | – | – |
| 13 | Desenvolvimento do app mobile e da plataforma web | I | C | C | A/R | – | – | – |
| 14 | Integrações externas, webhooks e sincronização de calendários | I | A/R | I | R | – | C | I |
| 15 | Testes e validação das regras de negócio | C | R | C | A/R | I | C | C |
| 16 | Estratégia de monetização (versão paga, anúncios, venda de produtos) | A/R | C | C | C | C | I | I |
| 17 | Lançamento do MVP (web e mobile) | A/R | R | R | R | I | I | I |
| 18 | Suporte operacional e canais de atendimento pós-lançamento | A | R | C | R | – | I | I |
| 19 | Padronização e repositório da documentação (Sprint 7) | A | C | C | R | I | – | – |
| 20 | Modelagem UML (classes, sequência, estados, atividades) e DER | C | R | C | A/R | I | – | – |
| 21 | Arquitetura (arc42, C4), ADRs e especificação da API | C | C | C | A/R | I | – | – |

As linhas 1 a 18 reproduzem a matriz original. As linhas 19 a 21 foram acrescentadas para as atividades de documentação da Sprint 7.

## Questões em aberto

| ID | Questão | Encaminhamento |
|---|---|---|
| QA-01 | Nas linhas 11 a 13 da matriz original, os papéis de Micaela (MV) e Ricardo (RG) parecem trocados em relação à legenda (RG é backend e banco; NR é frontend). | Confirmar com o time e corrigir na versão 2.1 |
