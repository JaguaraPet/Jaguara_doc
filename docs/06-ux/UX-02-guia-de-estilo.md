# UX-02 · Guia de estilo

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | UX-02 · Guia de estilo (tokens visuais e acessibilidade) |
| Versão | 0.9 |
| Status | Rascunho |
| Autores | Ricardo Guilhen |
| Data | 01/11/2026 |
| Tarefa Jira | JAG-28 |
| Padrão de referência | WCAG 2.2 nível AA; *design tokens* |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 0.9 | 01/11/2026 | Ricardo Guilhen | Proposta de paleta, tipografia, espaçamento e regras de acessibilidade, com contraste verificado. |

## 1. Objetivo

Definir os valores visuais compartilhados pelo app do tutor e pela web Enterprise, para que os protótipos do Figma ([UX-03](UX-03-prototipos.md)) e o código usem os mesmos *tokens*.

## 2. Situação

A paleta está em definição na tarefa JAG-28. Os valores abaixo são uma **proposta** inspirada na onça (jaguara, em tupi): âmbar terroso como cor principal e verde-mata como secundária. Devem ser confirmados ou substituídos pelos valores do Figma; o contraste já foi verificado para todos os pares de texto.

## 3. Cores

| Token | Valor | Uso | Contraste sobre `fundo` | Contraste do branco sobre a cor |
|---|---|---|---|---|
| `cor.primaria` | `#8A4B0F` | Botões principais, links, destaques | 6,79:1 | 6,79:1 |
| `cor.primaria-escura` | `#5E3209` | Estado pressionado, títulos | 10,85:1 | 10,85:1 |
| `cor.secundaria` | `#1F5C4A` | Ações secundárias, abas ativas | 7,81:1 | 7,81:1 |
| `cor.fundo` | `#FFFFFF` | Fundo das telas | — | — |
| `cor.superficie` | `#F7F3EE` | Cartões e áreas agrupadas | — | — |
| `cor.texto` | `#1E1B18` | Texto principal | 17,14:1 | — |
| `cor.texto-secundario` | `#5C554E` | Texto de apoio, bordas de campos | 7,33:1 | — |
| `cor.sucesso` | `#1E7B3A` | Confirmações, status ACEITO | 5,32:1 | 5,32:1 |
| `cor.alerta` | `#8A5A00` | Avisos, status PENDENTE | 5,93:1 | 5,93:1 |
| `cor.erro` | `#B3261E` | Erros, alergia GRAVE | 6,54:1 | 6,54:1 |
| `cor.borda` | `#D9D1C7` | Divisórias decorativas (não usar como única borda de campo) | 1,51:1 | — |

Todos os pares de texto atingem o mínimo de 4,5:1 (critério 1.4.3). Bordas de campos e controles usam `cor.texto-secundario` para atingir 3:1 (critério 1.4.11).

## 4. Tipografia

| Token | Valor |
|---|---|
| `fonte.familia` | Inter, com fallback para a fonte do sistema |
| `fonte.titulo-1` | 28 px, peso 700 |
| `fonte.titulo-2` | 22 px, peso 600 |
| `fonte.corpo` | 16 px, peso 400, altura de linha 1,5 |
| `fonte.legenda` | 14 px, peso 400 |

O texto deve continuar legível com a fonte do sistema ampliada em 200% (critério 1.4.4).

## 5. Espaçamento e forma

| Token | Valor |
|---|---|
| `espaco.base` | 4 px; usar múltiplos (8, 12, 16, 24, 32) |
| `raio.padrao` | 8 px |
| `alvo.toque-minimo` | 44 × 44 px (critério 2.5.8) |

## 6. Regras de acessibilidade

- Cor nunca é o único indicador: status têm texto e ícone além da cor.
- Todo campo tem rótulo visível; mensagens de erro dizem o que corrigir.
- Ordem de foco segue a ordem visual; foco sempre visível.
- Imagens informativas (fotos do pet) têm texto alternativo.
- Alergias graves usam `cor.erro`, ícone e o texto "Alergia grave".

## Questões em aberto

| ID | Questão | Encaminhamento |
|---|---|---|
| QA-01 | Confirmação da paleta e da fonte com o Figma | JAG-28; após aprovar, mudar o status para Aprovado e a versão para 1.0 |
