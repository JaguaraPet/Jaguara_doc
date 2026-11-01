# XXX-NN · Título do documento

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | XXX-NN · Título do documento |
| Versão | 0.1 |
| Status | Rascunho · Em revisão · Aprovado · Obsoleto |
| Autores | Nome Sobrenome, Nome Sobrenome |
| Revisor | Nome Sobrenome |
| Data | DD/MM/AAAA |
| Tarefa Jira | JAG-NN |
| Padrão de referência | Norma ou modelo seguido |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 0.1 | DD/MM/AAAA | Nome | Versão inicial. |

## 1. Objetivo

O que este documento resolve e para quem ele é escrito.

## 2. Escopo

O que está dentro e o que está fora deste documento.

## 3. Referências

| ID | Documento |
|---|---|
| REF-01 | Documento ou norma usada como base |

## 4. Conteúdo

Seções próprias do tipo de documento, conforme o padrão de referência.

## Questões em aberto

| ID | Questão | Encaminhamento |
|---|---|---|
| QA-01 | Dúvida ou decisão pendente | Quem decide e quando |

---

## Regras de uso do modelo

- **Identificador:** prefixo da área (`GES`, `REQ`, `ARQ`, `MOD`, `TST`, `UX`, `ENT`, `TCC`) + número de dois dígitos. O identificador não muda depois de publicado.
- **Nome do arquivo:** `XXX-NN-titulo-em-kebab-case.md`, na pasta da área.
- **Versão:** `0.x` enquanto rascunho; `1.0` na primeira aprovação; incremento menor (`1.1`) para ajustes e maior (`2.0`) para reestruturação.
- **Status:** `Rascunho` → `Em revisão` → `Aprovado`. Um documento substituído vira `Obsoleto` e aponta para o substituto.
- **Diagramas:** fonte `.puml` ao lado do documento e imagem SVG em `img/`, referenciada com caminho relativo.
- **Referências cruzadas:** sempre pelo identificador (`REQ-01`, `RN14`, `UC-24`, `JAG-58`), nunca por "o documento acima".
- **Idioma:** português do Brasil; termos técnicos consagrados em inglês ficam em itálico na primeira ocorrência.
- **Pronto:** um documento só vai para `Aprovado` quando cumpre a [Definition of Done da documentação](DoD-documentacao.md).
