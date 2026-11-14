# Definition of Done da documentação

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | Definition of Done da documentação |
| Versão | 1.0 |
| Status | Aprovado |
| Autores | Equipe Jaguara |
| Data | 01/11/2026 |
| Tarefa Jira | JAG-50 |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 1.0 | 01/11/2026 | Ricardo Guilhen | Versão inicial. |

## Objetivo

Lista de verificação que todo documento cumpre antes de ter o status `Aprovado` e de a tarefa correspondente ir para *fechado* no Jira.

## Lista de verificação

### Forma

- [ ] Segue o [modelo de documento](MODELO-documento.md): cabeçalho completo, histórico de revisões, objetivo, escopo e referências.
- [ ] Identificador e nome de arquivo no padrão da área.
- [ ] Markdown válido (títulos em ordem, tabelas com o mesmo número de colunas, links relativos funcionando).
- [ ] Arquivos YAML válidos (OpenAPI, workflows), conferidos por um validador.
- [ ] Diagramas com fonte `.puml` versionada e SVG gerado a partir da versão atual da fonte.

### Conteúdo

- [ ] Segue a norma ou modelo indicado no campo *Padrão de referência*.
- [ ] Usa os identificadores oficiais (RF, RN, RNF, UC, US, classes do MOD-01) e os termos do [glossário](../02-requisitos/REQ-02-glossario.md).
- [ ] Cada requisito, caso de uso ou decisão citado existe no documento de origem.
- [ ] Nenhuma informação inventada: dado sem fonte é marcado como premissa ou questão em aberto.
- [ ] Questões em aberto registradas na seção própria, com encaminhamento.

### Processo

- [ ] Revisado por um integrante que não é o autor; o nome do revisor está no cabeçalho.
- [ ] Matriz de rastreabilidade ([REQ-06](../02-requisitos/REQ-06-matriz-de-rastreabilidade.md)) atualizada quando o documento cria ou altera requisitos, casos de uso, classes ou testes.
- [ ] Índice de documentos ([docs/README.md](../README.md)) atualizado com versão e status.
- [ ] Commit no padrão *Conventional Commits* (`docs: ...`) via pull request revisado.
- [ ] Tarefa do Jira com o link do documento e movida para *fechado*.
