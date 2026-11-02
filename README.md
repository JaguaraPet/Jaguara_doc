# Jaguara · Documentação

Documentação oficial do **Jaguara**, plataforma web e mobile para gestão da rotina, saúde e custos de animais de estimação, com módulo **Enterprise** para clínicas veterinárias, pet shops, hotéis, creches e casas de cuidado animal.

Projeto da **Escola de TI** (turma B). **Equipe:** Micaela Dorneles, Miguel Drozino, Nathan Rodrigues e Ricardo Guilhen.

## Onde está cada artefato

| Artefato | Documento |
|---|---|
| Escopo e objetivos do projeto | [GES-01 · Termo de abertura](docs/01-gestao/GES-01-TAP.md) |
| Requisitos funcionais, regras de negócio e requisitos não funcionais | [REQ-01 · ERS](docs/02-requisitos/REQ-01-ERS.md) |
| Diagrama de casos de uso | [REQ-03](docs/02-requisitos/REQ-03-diagrama-casos-de-uso.md) |
| Especificação dos casos de uso | [REQ-04](docs/02-requisitos/REQ-04-especificacao-casos-de-uso.md) |
| Diagrama de classes | [MOD-01](docs/04-modelagem/MOD-01-modelo-de-classes.md) |
| Diagramas de sequência | [MOD-02](docs/04-modelagem/MOD-02-diagramas-de-sequencia.md) |
| DER e script do banco | [MOD-03](docs/04-modelagem/MOD-03-modelo-de-dados.md) |
| Diagramas de atividades | [MOD-05](docs/04-modelagem/MOD-05-diagramas-de-atividade.md) |
| Decisões de arquitetura (ADRs) | [ADR-001 a ADR-011](docs/03-arquitetura/adr/README.md) |
| Processo de desenvolvimento | [ADR-008](docs/03-arquitetura/adr/ADR-008-processo-de-desenvolvimento.md) e [CONTRIBUTING](CONTRIBUTING.md) |
| Protótipo, navegação e guia de estilo | [UX-03](docs/05-ux/UX-03-prototipos.md), [UX-01](docs/05-ux/UX-01-mapa-de-navegacao.md), [UX-02](docs/05-ux/UX-02-guia-de-estilo.md) |
| Artefatos originais, antes da padronização | [`docs/anexos/originais`](docs/anexos/originais) |

Versão e status de cada documento: [`docs/README.md`](docs/README.md).

## Como esta documentação é organizada

*Docs as code*: todo documento é um arquivo Markdown versionado e todo diagrama é texto (PlantUML) com a imagem SVG gerada na pasta `img/` ao lado. Cada documento tem cabeçalho com versão, status e tarefa do Jira, e um histórico de revisões. A decisão está na [ADR-003](docs/03-arquitetura/adr/ADR-003-padrao-de-documentacao.md).

## Como gerar os diagramas

Os arquivos `.puml` são a fonte de cada diagrama. Para gerar os SVGs sem instalar Java, rode dentro da pasta do diagrama:

```bash
docker run --rm -v "$PWD:/data" -w /data plantuml/plantuml:1.2024.7 -tsvg -charset UTF-8 -o img "*.puml"
```

No VS Code, a extensão *PlantUML* (jebbs.plantuml) faz a pré-visualização e a exportação. O CI compila todos os `.puml` a cada push e falha em erro de sintaxe.

## Contribuição

Fluxo de branches, padrão de commits e checklist de revisão em [`CONTRIBUTING.md`](CONTRIBUTING.md).
