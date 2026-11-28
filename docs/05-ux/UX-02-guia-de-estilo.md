# UX-02 · Guia de estilo

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | UX-02 · Guia de estilo (tokens visuais e acessibilidade) |
| Versão | 0.10 |
| Status | Rascunho |
| Autores | Ricardo Guilhen, Micaela Dorneles |
| Data | 28/11/2026 |
| Tarefa Jira | JAG-28, JAG-248 |
| Padrão de referência | WCAG 2.2 nível AA; *design tokens* |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 0.9 | 01/11/2026 | Ricardo Guilhen | Proposta de paleta, tipografia, espaçamento e regras de acessibilidade, com contraste verificado. |
| 0.10 | 28/11/2026 | Micaela Dorneles | Identidade Selvagem: paletas clara e escura, Bricolage Grotesque nos títulos, botões em pílula, cartões translúcidos e estampa de onça. Ícones vetoriais no lugar de emoji, inicial do nome para o pet sem foto e ícone do app. Navegação, formulários e movimento (seção 8). |

## 1. Objetivo

Definir os valores visuais compartilhados pelo app do tutor e pela web Enterprise, para que os protótipos do Figma ([UX-03](UX-03-prototipos.md)) e o código usem os mesmos *tokens*.

## 2. Situação

O time escolheu a identidade **Selvagem** entre cinco propostas avaliadas (moderna, rústica, selvagem, zoológico e zoológico + selvagem). Ela parte da onça (jaguara, em tupi) e da mata: Ouro Onça nos botões principais e nos destaques, verde da mata no modo escuro, títulos fortes e uma estampa de onça desenhada pelo time. Há dois modos, claro e escuro, com o contraste verificado nos dois.

As paletas ficam em `tema/paletas.ts`, arquivo igual no app e na web. Na web, o `variaveis.css` traz as mesmas cores, e um teste confere que os dois estão iguais.

## 3. Cores

| Token | Claro | Escuro | Uso |
|---|---|---|---|
| `cor.primaria` | `#F5B301` | `#F5B301` | Ouro Onça: fundo do botão principal, da escolha marcada e do destaque da semana |
| `cor.sobre-primaria` | `#14130F` | `#14130F` | Texto e ícone sobre a primária (10,03:1) |
| `cor.destaque` | `#7E5800` | `#F5B301` | Dourado para texto e ícone sobre o fundo (Ouro Queimado no claro) |
| `cor.secundaria` | `#0B6670` | `#3FB6C1` | Igarapé: links, botões de contorno, foco |
| `cor.fundo` | `#FAF6EC` | `#0B1D14` | Areia no claro, Mata Fechada no escuro |
| `cor.cartao` | verde a 7% | sálvia a 16% | Cartão translúcido sobre a estampa, com borda `cor.cartao-borda` |
| `cor.elevado` | `#FFFFFF` | `#13291D` | Superfícies opacas: campos, menus e balões |
| `cor.texto` | `#14130F` | `#FAF6EC` | Texto principal |
| `cor.texto-secundario` | `#5E6359` | `#9FB8A6` | Texto de apoio, bordas de campos |
| `cor.sucesso` | `#1D6A40` | `#4FBF8A` | Confirmações, status ACEITO |
| `cor.alerta` | `#8A5A00` | `#F5B301` | Avisos, status PENDENTE |
| `cor.erro` | `#B3261E` | `#F07A5C` | Urucum: erros, alergia GRAVE |
| `cor.sobre-cor` | `#FFFFFF` | `#0B1D14` | Texto e ícone sobre secundária, sucesso e erro |
| `cor.mata` | `#1A3826` | `#1A3826` | Faixas e rodapé do site, sempre com texto branco |

Contraste dos textos, sobre o fundo e sobre o cartão:

| Texto | Claro: fundo | Claro: cartão | Escuro: fundo | Escuro: cartão |
|---|---|---|---|---|
| `cor.texto` | 17,22:1 | 15,48:1 | 16,21:1 | 11,66:1 |
| `cor.texto-secundario` | 5,71:1 | 5,14:1 | 8,23:1 | 5,92:1 |
| `cor.destaque` | 5,93:1 | 5,33:1 | 9,44:1 | 6,79:1 |
| `cor.secundaria` | 6,18:1 | 5,56:1 | 7,23:1 | 5,20:1 |
| `cor.sucesso` | 6,10:1 | 5,49:1 | 7,63:1 | 5,48:1 |
| `cor.alerta` | 5,49:1 | 4,94:1 | 9,44:1 | 6,79:1 |
| `cor.erro` | 6,06:1 | 5,44:1 | 6,37:1 | 4,58:1 |

Todos os pares de texto atingem o mínimo de 4,5:1 (critério 1.4.3). O Ouro Onça (`#F5B301`) nunca é usado como cor de texto sobre o fundo claro: ali entra o `cor.destaque`. Bordas de campos e controles usam `cor.texto-secundario` para atingir 3:1 (critério 1.4.11).

**Modo escuro.** Segue o modo do celular ou do computador. O tutor pode fixar claro ou escuro na aba Perfil, em Aparência, e a empresa no botão de aparência do topo da Enterprise. A escolha fica guardada no aparelho ou no navegador.

## 4. Tipografia

| Token | Valor |
|---|---|
| `fonte.familia-titulo` | Bricolage Grotesque, peso 800 |
| `fonte.familia` | Inter, com fallback para a fonte do sistema |
| `fonte.titulo-1` | 30 px, peso 800 |
| `fonte.titulo-2` | 20 px no app, 21 px na web, peso 800 |
| `fonte.corpo` | 16 px, peso 400, altura de linha 1,5 |
| `fonte.legenda` | 14 px, peso 400 |

Títulos e etiquetas usam maiúscula só na primeira letra. O texto deve continuar legível com a fonte do sistema ampliada em 200% (critério 1.4.4).

## 5. Espaçamento e forma

| Token | Valor |
|---|---|
| `espaco.base` | 4 px; usar múltiplos (8, 12, 16, 24, 32) |
| `raio.padrao` | 10 px, para campos |
| `raio.cartao` | 20 px, para cartões; os cabeçalhos de destaque usam 24 px |
| Botões | Pílula (raio total). No celular, as ações aparecem como botão, não como link sublinhado |
| `alvo.toque-minimo` | 44 × 44 px (critério 2.5.8) |

**Estampa de onça.** Desenho próprio do time, de rosetas com miolo laranja e anel marrom partido, num bloco de 220 × 220 px que se repete sem emenda. No fundo das telas ela aparece tom sobre tom e bem apagada, para não atrapalhar a leitura: areia no claro e verde no escuro, com um véu da cor do fundo por cima (80% na web, a estampa a 22% no app). A versão dourada (`#F5B301`, manchas `#E8890C`, anéis `#5A3210`) aparece só nos destaques, como um pedaço de pelagem com a borda ondulada: no canto do aniversário do pet no app e à esquerda do cabeçalho da tela Hoje na web. No app a estampa vai em PNG de 1x a 3x; na web, em SVG.

## 6. Regras de acessibilidade

- Cor nunca é o único indicador: status têm texto e ícone além da cor.
- Todo campo tem rótulo visível; mensagens de erro dizem o que corrigir.
- Ordem de foco segue a ordem visual; foco sempre visível.
- Imagens informativas (fotos do pet) têm texto alternativo.
- Alergias graves usam `cor.erro`, ícone e o texto "Alergia grave".

## 7. Ícones e imagens

- **Ícones vetoriais, nunca emoji.** O app e a web usam a mesma família, *Material Design Icons* (licença Apache 2.0): no app pelo `@expo/vector-icons` (componente `Icone`), na web pelos desenhos SVG em `componentes/icones.ts`. O emoji muda de desenho em cada sistema e não acompanha a cor nem o tamanho do texto.
- O ícone acompanha um texto que diz o que ele significa; sozinho, ele é decorativo e fica escondido do leitor de tela.
- Preferir a variante de contorno (`-outline`); a cheia marca o estado ativo (aba atual, estrela da nota).
- Pet sem foto: a inicial do nome num círculo `cor.suave-info` com o texto em `cor.secundaria`. Nenhum conjunto de ícones cobre bem todas as espécies do catálogo, e um desenho errado (um lagarto para um jabuti) é pior que a inicial.
- Ícone do app e favicon: a pata dourada (`#F5B301`) sobre o verde da mata (`#1A3826`), o mesmo fundo da tela de abertura.

## 8. Navegação, formulários e movimento

- **Menos rolagem.** Telas com muitas partes usam abas em pílula (a ativa em `cor.primaria`): no app, o início (Rotina, Agenda, Vacinas, com o número de pendências) e o perfil do pet (Resumo, Saúde, Dia a dia, Família); na web, o perfil da empresa. Listas longas rolam dentro do próprio bloco, como na tela Hoje da web, e cartões que se repetem no mesmo dia passam de lado no app.
- **Tela parada, componente que rola.** No computador a Enterprise ocupa a janela inteira: topo e menu ficam parados, o cabeçalho de cada página também, e só a lista, a tabela ou o painel rola por dentro (com o cabeçalho das colunas à vista). Na agenda, as sete colunas têm a mesma largura e os cartões a mesma altura, com uma linha para cada informação. No início do app, o botão de + fica fixo no canto com as ações principais.
- **Telas ralas se juntam, telas cheias viram abas.** Segurança e privacidade são abas das Configurações; serviços e salas são abas do catálogo; no lado direito da tela Hoje, pedidos, vacinas e cobranças são abas.
- **Voltar sempre à mão.** O topo da Enterprise e de cada tela do app tem o botão de voltar para a página anterior.
- **Sem faixa lateral.** Alertas, cartões e destaques usam contorno inteiro e fino, fundo suave e o ícone num quadrado arredondado; nada de faixa colorida num lado só.
- **Formulários em etapas.** Formulário com mais de seis campos vira etapas curtas: indicador com número e check das feitas na web, barra com "Etapa 1 de 2" no app, Voltar e Continuar, e a etapa é conferida antes de seguir. Ex.: cadastro da empresa, cadastro do pet, registro do atendimento e cadastro de medicamento.
- **Ação é botão.** Ações aparecem como botão em pílula; link sublinhado fica só no meio de uma frase. Caixas de seleção e opções seguem o produto: cantos arredondados, marcadas em `cor.primaria` com o ícone de check.
- **Movimento simples.** Conteúdo entra com um deslize curto (até 220 ms), botões afundam de leve ao toque, e o + do app gira para virar X enquanto os atalhos sobem um a um. Quem pede menos movimento no sistema, ou marca "Reduzir as animações" nas configurações da web, fica sem as animações.
- **Sensação de app no celular.** Telas novas deslizam da direita e voltam com o gesto da borda. As abas ficam numa dock de vidro que flutua acima da borda da tela, com ícone e nome em cada aba e uma pílula que desliza até a aba ativa; trocar de aba desliza o conteúdo de leve, e o fim de cada tela ganha espaço para nada ficar atrás da dock. Enquanto carrega, cartões cinza pulsando (esqueleto) no lugar da rodinha. Confirmações rápidas viram um aviso curto que sobe do rodapé e some sozinho. Puxar a tela para baixo atualiza. O topo é feito de pílulas que flutuam sobre o conteúdo (voltar, título e ações), que passa por baixo delas ao rolar; o fundo de vidro aparece suave, e o título pequeno surge numa pílula quando o grande sai da tela. Nas conversas, a caixa de mensagem é uma pílula de vidro flutuando no rodapé, com o botão redondo de enviar. Página da empresa com a logo grande no topo, que encolhe ao rolar, e o resto em abas. No início, a barra do topo é de vidro, como nos apps nativos: a inicial de quem está logado à esquerda (leva ao Perfil) e, à direita, uma pílula com o + (abre as ações numa gaveta que sobe do rodapé, também usada para escolher o pet) e o sino; o conteúdo passa por baixo dela ao rolar. O anel "3/5" mostra os cuidados do dia de cada pet e arrastar a linha para a direita marca como feito. Formulários de novo e alterar (remédio, vacina, despesa, exame, alergia, rotina, plano alimentar) e todas as confirmações (excluir, finalizar, remover, cancelar) abrem numa gaveta que sobe do rodapé, nunca no meio da tela; a ação principal de cada tela é uma pílula com + no topo, à direita. Tela vazia tem ilustração e convite, não uma frase solta. Sem vibração.
- **Configurações num lugar só.** Aparência (igual ao sistema, claro ou escuro) e demais preferências ficam na tela Configurações, aberta pelo Perfil no app e pelo ícone de engrenagem no topo da Enterprise.

## Questões em aberto

| ID | Questão | Encaminhamento |
|---|---|---|
| QA-01 | Levar a identidade Selvagem para os protótipos do Figma ([UX-03](UX-03-prototipos.md)) | JAG-28; após aprovar, mudar o status para Aprovado e a versão para 1.0 |
