# Jaguara · Documentação

Documentação oficial do **Jaguara**, plataforma web e mobile para gestão da rotina, saúde e custos de animais de estimação, com módulo **Enterprise** para clínicas veterinárias, pet shops, hotéis, creches e casas de cuidado animal.

Projeto da **Escola de TI** (turma B). **Equipe:** Micaela Dorneles, Miguel Drozino, Nathan Rodrigues e Ricardo Guilhen. Os papéis e responsabilidades estão na [matriz RACI](docs/01-gestao/GES-04-RACI.md).

## Onde está cada artefato

| Artefato | Documento |
|---|---|
| Escopo e objetivos do projeto | [GES-01 · Termo de abertura](docs/01-gestao/GES-01-TAP.md) |
| EAP, cronograma, RACI, riscos e processo do time | [GES-02](docs/01-gestao/GES-02-EAP.md), [GES-03](docs/01-gestao/GES-03-cronograma.md), [GES-04](docs/01-gestao/GES-04-RACI.md), [GES-05](docs/01-gestao/GES-05-registro-de-riscos.md), [GES-06](docs/01-gestao/GES-06-processo-do-time.md) |
| Pesquisa de mercado, SWOT, Duplo Diamante e GUT | [GES-08](docs/01-gestao/GES-08-pesquisa-de-mercado.md) |
| Requisitos funcionais, regras de negócio e requisitos não funcionais | [REQ-01 · ERS](docs/02-requisitos/REQ-01-ERS.md) |
| Glossário e identificadores | [REQ-02](docs/02-requisitos/REQ-02-glossario.md), [REQ-00](docs/02-requisitos/REQ-00-identificadores.md) |
| Diagrama de casos de uso | [REQ-03](docs/02-requisitos/REQ-03-diagrama-casos-de-uso.md) |
| Especificação dos casos de uso | [REQ-04](docs/02-requisitos/REQ-04-especificacao-casos-de-uso.md) |
| Histórias de usuário com critérios em Gherkin | [REQ-05](docs/02-requisitos/REQ-05-historias-de-usuario.md) |
| Matriz de rastreabilidade | [REQ-06](docs/02-requisitos/REQ-06-matriz-de-rastreabilidade.md) |
| Arquitetura (arc42 e C4) | [ARQ-01](docs/03-arquitetura/ARQ-01-arquitetura.md) |
| Decisões de arquitetura (ADRs) | [ADR-001 a ADR-011](docs/03-arquitetura/adr/README.md) |
| Segurança, LGPD e integrações | [ARQ-02](docs/03-arquitetura/ARQ-02-seguranca-e-lgpd.md), [ARQ-03](docs/03-arquitetura/ARQ-03-integracoes.md) |
| Contrato da API | [OpenAPI 3.1](docs/03-arquitetura/api/openapi.yaml) |
| Diagrama de classes | [MOD-01](docs/04-modelagem/MOD-01-modelo-de-classes.md) |
| Diagramas de sequência | [MOD-02](docs/04-modelagem/MOD-02-diagramas-de-sequencia.md) |
| DER, script e dicionário de dados | [MOD-03](docs/04-modelagem/MOD-03-modelo-de-dados.md) |
| Diagramas de estado | [MOD-04](docs/04-modelagem/MOD-04-diagramas-de-estado.md) |
| Diagramas de atividades | [MOD-05](docs/04-modelagem/MOD-05-diagramas-de-atividade.md) |
| Protótipo, navegação e guia de estilo | [UX-03](docs/05-ux/UX-03-prototipos.md), [UX-01](docs/05-ux/UX-01-mapa-de-navegacao.md), [UX-02](docs/05-ux/UX-02-guia-de-estilo.md) |
| Plano, casos e relatório de testes | [TST-01](docs/06-testes/TST-01-plano-de-testes.md), [TST-02](docs/06-testes/TST-02-casos-de-teste.md), [TST-03](docs/06-testes/TST-03-relatorio-de-testes.md) |
| Implantação, manuais e notas de versão | [ENT-01](docs/07-entrega/ENT-01-implantacao.md), [ENT-02](docs/07-entrega/ENT-02-manual-tutor.md), [ENT-03](docs/07-entrega/ENT-03-manual-enterprise.md), [ENT-04](docs/07-entrega/ENT-04-notas-de-versao.md) |
| Termos de uso, termos da Enterprise, política de privacidade e termo de consentimento do cliente | [JUR-01](docs/08-juridico/JUR-01-termos-de-uso-app.md), [JUR-02](docs/08-juridico/JUR-02-termos-enterprise.md), [JUR-03](docs/08-juridico/JUR-03-politica-de-privacidade.md), [JUR-04](docs/08-juridico/JUR-04-termo-consentimento-cliente.md) |
| Processo de desenvolvimento | [ADR-008](docs/03-arquitetura/adr/ADR-008-processo-de-desenvolvimento.md) e [CONTRIBUTING](CONTRIBUTING.md) |
| Artefatos originais, antes da padronização | [`docs/anexos/originais`](docs/anexos/originais) |

Versão e status de cada documento: [`docs/README.md`](docs/README.md).

## Como esta documentação é organizada

*Docs as code*: todo documento é um arquivo Markdown versionado e todo diagrama é texto (PlantUML) com a imagem SVG gerada na pasta `img/` ao lado. Cada documento tem cabeçalho com versão, status e tarefa do Jira, e um histórico de revisões. A decisão está na [ADR-003](docs/03-arquitetura/adr/ADR-003-padrao-de-documentacao.md), e as regras estão no [modelo de documento](docs/_modelos/MODELO-documento.md) e na [Definition of Done da documentação](docs/_modelos/DoD-documentacao.md).

| Pasta | Conteúdo | Padrão de referência |
|---|---|---|
| [`docs/01-gestao`](docs/01-gestao) | Termo de abertura, EAP, cronograma, RACI, riscos, processo do time, pesquisa de mercado | PMBOK, Scrum Guide |
| [`docs/02-requisitos`](docs/02-requisitos) | Especificação de requisitos, glossário, casos de uso, histórias de usuário, rastreabilidade | ISO/IEC/IEEE 29148, Cockburn, Gherkin |
| [`docs/03-arquitetura`](docs/03-arquitetura) | Arquitetura, decisões (ADR), API, segurança e integrações | arc42, C4, ADR, OpenAPI 3.1 |
| [`docs/04-modelagem`](docs/04-modelagem) | Diagramas de classes, sequência, dados (DER), estados e atividades | UML 2.5.1 |
| [`docs/05-ux`](docs/05-ux) | Mapa de navegação, guia de estilo e protótipos | WCAG 2.2 |
| [`docs/06-testes`](docs/06-testes) | Plano, casos e relatório de testes | ISO/IEC/IEEE 29119-3 |
| [`docs/07-entrega`](docs/07-entrega) | Implantação, manuais e notas de versão | ISO/IEC/IEEE 26514 |
| [`docs/08-juridico`](docs/08-juridico) | Termos de uso, termos da Enterprise, política de privacidade e termo de consentimento | LGPD, CDC, Marco Civil da Internet |
| [`docs/anexos`](docs/anexos) | Exportações dos artefatos originais (PDF, XLSX) | — |

## Como gerar os diagramas

Os arquivos `.puml` são a fonte de cada diagrama. Para gerar os SVGs sem instalar Java, rode dentro da pasta do diagrama:

```bash
docker run --rm -v "$PWD:/data" -w /data plantuml/plantuml:1.2024.7 -tsvg -charset UTF-8 -o img "*.puml"
```

No VS Code, a extensão *PlantUML* (jebbs.plantuml) faz a pré-visualização e a exportação. O CI compila todos os `.puml` a cada push e falha em erro de sintaxe.

## Contribuição

Fluxo de branches, padrão de commits e checklist de revisão em [`CONTRIBUTING.md`](CONTRIBUTING.md).
