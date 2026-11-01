# Como contribuir

Guia de contribuição dos repositórios do Jaguara. A justificativa do processo está na [ADR-008](docs/03-arquitetura/adr/ADR-008-processo-de-desenvolvimento.md) e as cerimônias no [GES-06](docs/01-gestao/GES-06-processo-do-time.md).

## Fluxo de trabalho (GitHub Flow)

1. Pegue uma tarefa da sprint no Jira e mova para **em desenvolvimento**.
2. Crie uma branch a partir da `main` atualizada:

   ```bash
   git switch main && git pull
   git switch -c tipo/JAG-123-descricao-curta
   ```

   Tipos: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`.
3. Faça commits pequenos no padrão abaixo.
4. Abra um pull request para a `main`, ligue a tarefa do Jira e mova a tarefa para **ag. analise**.
5. Outro integrante revisa em até um dia útil. Com aprovação e CI verde, faça *squash merge*.
6. Mova a tarefa para **fechado** (documentação) ou **ag. deploy** (código).

A `main` deve ser protegida em *Settings → Branches* do GitHub: sem push direto, com uma aprovação e CI verde obrigatórias.

## Mensagens de commit (Conventional Commits)

```text
tipo(escopo): resumo no imperativo, em minúsculas

Corpo opcional explicando o porquê.

Refs: JAG-123
```

Exemplos:

```text
feat(agenda): bloqueia agendamento sobreposto do mesmo profissional
docs(requisitos): adiciona RNF mensuráveis ao REQ-01
fix(auth): expira sessão após 4 horas de inatividade
```

## Checklist do pull request

- [ ] Título no padrão Conventional Commits e chave do Jira na descrição.
- [ ] Critérios de aceite da tarefa atendidos.
- [ ] Testes criados ou atualizados; CI verde.
- [ ] Documentação atualizada quando a mudança altera requisito, caso de uso, modelo, API ou arquitetura.
- [ ] Sem segredos, dados pessoais reais ou arquivos gerados desnecessários.

## Documentação

- Use o [modelo de documento](docs/_modelos/MODELO-documento.md) e cumpra a [DoD da documentação](docs/_modelos/DoD-documentacao.md).
- Diagramas em PlantUML: edite o `.puml` e gere o SVG em `img/` (veja o [README](README.md)).
- Ao mudar um documento, atualize a versão, o histórico de revisões e o [índice](docs/README.md).

## Versões

Versionamento Semântico com *tags* `vX.Y.Z`. As mudanças de cada versão vão nas [notas de versão](docs/07-entrega/ENT-04-notas-de-versao.md).
