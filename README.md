# Jaguara · Documentação

Documentação oficial do **Jaguara**, plataforma web e mobile para gestão da rotina, saúde e custos de animais de estimação, com módulo **Enterprise** para clínicas veterinárias, pet shops, hotéis, creches e casas de cuidado animal.

Projeto de conclusão do curso **Escola de TI** (turma B).

**Equipe:** Micaela Dorneles, Miguel Drozino, Nathan Rodrigues e Ricardo Guilhen. Os papéis e responsabilidades estão na [matriz RACI](docs/01-gestao/GES-04-RACI.md).

## Como esta documentação é organizada

A documentação segue o modelo *docs as code*: todo documento é um arquivo Markdown versionado, todo diagrama é texto (PlantUML) com a imagem SVG gerada ao lado, e todo documento tem cabeçalho, histórico de revisões e identificador próprio. As regras estão no [modelo de documento](docs/_modelos/MODELO-documento.md) e na [Definition of Done da documentação](docs/_modelos/DoD-documentacao.md).

| Pasta | Conteúdo | Padrão de referência |
|---|---|---|
| [`docs/01-gestao`](docs/01-gestao) | Termo de abertura, EAP, cronograma, RACI, riscos, processo do time, pesquisa de mercado | PMBOK, Scrum Guide |
| [`docs/02-requisitos`](docs/02-requisitos) | Especificação de requisitos, glossário, casos de uso, histórias de usuário, rastreabilidade | ISO/IEC/IEEE 29148, Cockburn, Gherkin |
| [`docs/03-arquitetura`](docs/03-arquitetura) | Arquitetura, decisões (ADR), API, segurança e integrações | arc42, C4, ADR, OpenAPI 3.1 |
| [`docs/04-modelagem`](docs/04-modelagem) | Diagramas de classes, sequência, dados (DER), estados e atividades | UML 2.5.1 |
| [`docs/05-testes`](docs/05-testes) | Plano, casos e relatório de testes | ISO/IEC/IEEE 29119-3 |
| [`docs/06-ux`](docs/06-ux) | Mapa de navegação, guia de estilo e protótipos | WCAG 2.2 |
| [`docs/07-entrega`](docs/07-entrega) | Implantação, manuais e notas de versão | ISO/IEC/IEEE 26514 |
| [`docs/08-tcc`](docs/08-tcc) | Estrutura da monografia e apêndices | ABNT NBR 14724 |
| [`docs/anexos`](docs/anexos) | Exportações dos artefatos originais (PDF, XLSX) | — |

O índice completo de documentos, com versão e status de cada um, está em [`docs/README.md`](docs/README.md).

## Como gerar os diagramas

Os arquivos `.puml` são a fonte de cada diagrama. Para gerar as imagens SVG sem instalar Java:

```bash
docker run --rm -v "$PWD:/data" -w /data plantuml/plantuml:1.2024.7 -tsvg -charset UTF-8 -o img "docs/**/*.puml"
```

No VS Code, a extensão *PlantUML* (jebbs.plantuml) faz a pré-visualização e a exportação.

## Contribuição

Fluxo de branches, padrão de commits e checklist de revisão em [`CONTRIBUTING.md`](CONTRIBUTING.md).
