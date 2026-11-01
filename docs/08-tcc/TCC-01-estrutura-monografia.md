# TCC-01 · Estrutura da monografia

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | TCC-01 · Estrutura da monografia e mapa de artefatos |
| Versão | 0.5 |
| Status | Rascunho |
| Autores | Ricardo Guilhen |
| Data | 01/11/2026 |
| Tarefa Jira | JAG-81, JAG-82 |
| Padrão de referência | ABNT NBR 14724:2011 (trabalhos acadêmicos), NBR 6023 (referências), NBR 10520 (citações) |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 0.5 | 01/11/2026 | Ricardo Guilhen | Proposta de sumário e mapa capítulo → artefato, para aprovação do orientador. |

## 1. Objetivo

Organizar a monografia do TCC segundo a ABNT e indicar qual artefato técnico deste repositório alimenta cada capítulo, para evitar retrabalho e manter o texto coerente com a documentação.

## 2. Estrutura proposta (NBR 14724)

| Parte | Elemento | Fonte |
|---|---|---|
| Pré-textual | Capa, folha de rosto, folha de aprovação, resumo e *abstract*, listas de figuras, tabelas e siglas, sumário | Siglas do [REQ-02](../02-requisitos/REQ-02-glossario.md) |
| 1 Introdução | Contexto, problema, objetivos geral e específicos, justificativa, estrutura do trabalho | [GES-01](../01-gestao/GES-01-TAP.md) |
| 2 Fundamentação teórica | Mercado pet; gestão da saúde animal; engenharia de requisitos; UML; arquitetura de software; LGPD | [GES-08](../01-gestao/GES-08-pesquisa-de-mercado.md), [ADR-003](../03-arquitetura/adr/ADR-003-padrao-de-documentacao.md) |
| 3 Metodologia | Duplo Diamante, Scrum, ferramentas, processo de desenvolvimento | [GES-06](../01-gestao/GES-06-processo-do-time.md), [ADR-008](../03-arquitetura/adr/ADR-008-processo-de-desenvolvimento.md), [GES-03](../01-gestao/GES-03-cronograma.md) |
| 4 Análise do problema | Pesquisa de mercado, SWOT, riscos | [GES-08](../01-gestao/GES-08-pesquisa-de-mercado.md), [GES-05](../01-gestao/GES-05-registro-de-riscos.md) |
| 5 Requisitos | ERS, casos de uso, histórias | [REQ-01](../02-requisitos/REQ-01-ERS.md) a [REQ-05](../02-requisitos/REQ-05-historias-de-usuario.md) |
| 6 Projeto da solução | Arquitetura, modelagem UML, modelo de dados, API, segurança | [ARQ-01](../03-arquitetura/ARQ-01-arquitetura.md), [MOD-01](../04-modelagem/MOD-01-modelo-de-classes.md) a [MOD-05](../04-modelagem/MOD-05-diagramas-de-atividade.md), [ARQ-02](../03-arquitetura/ARQ-02-seguranca-e-lgpd.md) |
| 7 Desenvolvimento | Implementação, interfaces, integrações | Repositórios de código, [UX-03](../06-ux/UX-03-prototipos.md), [ARQ-03](../03-arquitetura/ARQ-03-integracoes.md) |
| 8 Validação | Testes e resultados | [TST-01](../05-testes/TST-01-plano-de-testes.md) a [TST-03](../05-testes/TST-03-relatorio-de-testes.md) |
| 9 Considerações finais | Resultados, limitações, trabalhos futuros | [ENT-04](../07-entrega/ENT-04-notas-de-versao.md) |
| Pós-textual | Referências (NBR 6023), apêndices técnicos, anexos | Seção 3 |

## 3. Apêndices técnicos (JAG-82)

Somente documentos com status **Aprovado** entram nos apêndices, exportados em PDF a partir deste repositório:

| Apêndice | Documento |
|---|---|
| A | Especificação de Requisitos ([REQ-01](../02-requisitos/REQ-01-ERS.md)) |
| B | Especificação de casos de uso ([REQ-04](../02-requisitos/REQ-04-especificacao-casos-de-uso.md)) |
| C | Modelo de classes ([MOD-01](../04-modelagem/MOD-01-modelo-de-classes.md)) |
| D | Modelo de dados ([MOD-03](../04-modelagem/MOD-03-modelo-de-dados.md)) |
| E | Documentação de arquitetura e ADRs ([ARQ-01](../03-arquitetura/ARQ-01-arquitetura.md)) |
| F | Plano e relatório de testes ([TST-01](../05-testes/TST-01-plano-de-testes.md), [TST-03](../05-testes/TST-03-relatorio-de-testes.md)) |

## Questões em aberto

| ID | Questão | Encaminhamento |
|---|---|---|
| QA-01 | Modelo institucional da monografia (capa, margens, fonte) | Confirmar com a coordenação e o orientador |
| QA-02 | Aprovação do sumário | Orientador |
