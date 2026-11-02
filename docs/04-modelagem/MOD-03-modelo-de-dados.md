# MOD-03 · Modelo de dados

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | MOD-03 · Modelo de dados (DER lógico, modelo físico e dicionário de dados) |
| Versão | 1.1 |
| Status | Em revisão |
| Autores | Ricardo Guilhen |
| Data | 01/11/2026 |
| Tarefa Jira | JAG-47 (modelo lógico), JAG-48 (modelo físico) |
| Padrão de referência | Diagrama Entidade-Relacionamento em notação pé de galinha (Information Engineering); PostgreSQL 16 |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 1.0 | 01/11/2026 | Ricardo Guilhen | Modelo derivado do MOD-01: DER por área, dicionário de dados e DDL PostgreSQL. |
| 1.1 | 01/11/2026 | Ricardo Guilhen | `cliente` com dados próprios e conta opcional, tabela `cliente_pet` (ADR-010, item 3). Dicionário de dados passa a ser o próprio script. |

## 1. Objetivo

Definir como as classes persistentes do [modelo de classes (MOD-01)](MOD-01-modelo-de-classes.md) são armazenadas no PostgreSQL ([ADR-005](../03-arquitetura/adr/ADR-005-banco-de-dados.md)): tabelas, colunas, tipos, chaves, restrições e índices.

## 2. Escopo

- **Modelo lógico:** os DER da seção 4, um por área do domínio.
- **Modelo físico:** o script [`MOD-03-schema.sql`](modelo-de-dados/MOD-03-schema.sql), executável em PostgreSQL 16, que funciona como dicionário de dados (seção 7).
- Fora do escopo: migrações versionadas, que vivem no repositório do backend e são geradas a partir deste modelo (Prisma Migrate, [ADR-004](../03-arquitetura/adr/ADR-004-stack-backend.md)).

## 3. Regras de mapeamento classe → tabela

| Elemento do MOD-01 | Mapeamento | Exemplo |
|---|---|---|
| Classe persistente | Uma tabela com nome em `snake_case` | `SolicitacaoServico` → `solicitacao_servico` |
| Identidade | Coluna `id uuid` gerada pelo banco (`gen_random_uuid()`) | todas as tabelas |
| Herança (`Usuario`, `RegistroClinico`) | Tabela por classe com chave primária compartilhada: a subclasse usa o mesmo `id` da superclasse | `tutor.id` → `usuario.id` |
| Atributo `[0..1]` | Coluna que aceita nulo | `pet.data_falecimento` |
| Atributo `[1..*]` | Coluna do tipo vetor do PostgreSQL | `compartilhamento_pet.escopos escopo_acesso[]` |
| Enumeração | Tipo `ENUM` do PostgreSQL com os mesmos valores | `status_pagamento` |
| `«dataType» Endereco` | Colunas embutidas com prefixo | `tutor.endereco_cep` |
| Associação 1 para N | Chave estrangeira no lado N | `pet.raca_id` |
| Composição | Chave estrangeira com `ON DELETE CASCADE` | `item_memorial.memorial_id` |
| Associação N para N sem atributos | Tabela de junção | `perfil_permissao` |
| Classe de associação | Tabela com as duas chaves estrangeiras e restrição de unicidade | `responsavel_pet`, `cliente` |
| Interface `Notificavel` | Referência polimórfica (`origem_tipo`, `origem_id`) | `notificacao` |
| `{unique}` | `UNIQUE` | `usuario.email` |
| Atributo derivado (`/idade`) | Não é armazenado; calculado na consulta | — |
| Todas as tabelas | `criado_em` e `atualizado_em` para auditoria | — |

## 4. Diagramas ER

Entidades em cinza pertencem a outra área e aparecem só como referência. Colunas com `*` são obrigatórias.

### 4.1 DER-01 · Acesso

![DER-01](modelo-de-dados/img/DER-01-acesso.svg)

### 4.2 DER-02 · Pet e saúde

![DER-02](modelo-de-dados/img/DER-02-pet-e-saude.svg)

### 4.3 DER-03 · Rotina e notificação

![DER-03](modelo-de-dados/img/DER-03-rotina-e-notificacao.svg)

### 4.4 DER-04 · Atendimento (Enterprise)

![DER-04](modelo-de-dados/img/DER-04-atendimento.svg)

### 4.5 DER-05 · Financeiro, comunicação e privacidade

![DER-05](modelo-de-dados/img/DER-05-financeiro-comunicacao-privacidade.svg)

### 4.6 DER-06 · Administração

![DER-06](modelo-de-dados/img/DER-06-administracao.svg)

Fontes: [`modelo-de-dados/`](modelo-de-dados).

## 5. Modelo físico

O script [`MOD-03-schema.sql`](modelo-de-dados/MOD-03-schema.sql) cria os 39 tipos enumerados, as 56 tabelas (54 entidades e as associativas `perfil_permissao` e `cliente_pet`), as 87 chaves estrangeiras, as restrições de negócio e os índices. Ele é validado executando-o em um PostgreSQL 16 limpo.

## 6. Restrições de negócio no banco

As regras que o banco consegue garantir sozinho ficam no banco; as demais ficam nos serviços de domínio ([MOD-01](MOD-01-modelo-de-classes.md), seção 9).

| Restrição | Regra | Implementação |
|---|---|---|
| CPF, CNPJ e e-mail únicos | RN01 | `UNIQUE` |
| Conta ativa só com e-mail confirmado | RN02, RC-01 | `CHECK` em `usuario` |
| Responsável e cliente sem duplicidade | RN09, RN25 | `UNIQUE (pet_id, tutor_id)` e `UNIQUE (empresa_id, tutor_id)` |
| Despesa sempre com categoria | RN10 | `categoria_id NOT NULL` |
| Vacinação com responsável | RN17 | `NOT NULL` e `CHECK` de texto não vazio |
| Sem sobreposição de agendamentos ativos | RN14, RN29, RC-19 | `EXCLUDE USING gist` por pet, profissional e recurso |
| Horário de atuação de profissional ou de recurso | RC-20 | `CHECK` de exclusividade |
| Pagamento de agendamento ou de assinatura | RC-27 | `CHECK` de exclusividade |
| Pagamento aceito só com confirmação | RN39, RC-26 | `CHECK (status <> 'ACEITO' OR data_confirmacao IS NOT NULL)` |
| Webhook só HTTPS | RN36, RC-29 | `CHECK (url LIKE 'https://%')` |
| Preço contratado imutável | RN27, RC-21 | Coluna própria em `agendamento`; o serviço de domínio não atualiza |
| Pet com histórico não é excluído | RN08 | `ON DELETE RESTRICT` em `registro_clinico`, `despesa` e `agendamento`, mais regra no serviço |

## 7. Dicionário de dados

Tipos, obrigatoriedade, chaves e restrições de cada coluna estão definidos no script [`MOD-03-schema.sql`](modelo-de-dados/MOD-03-schema.sql), na mesma ordem das tabelas dos DER da seção 4.
