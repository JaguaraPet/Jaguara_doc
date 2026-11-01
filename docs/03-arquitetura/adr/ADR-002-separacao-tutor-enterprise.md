# ADR-002 · Separação dos contextos Tutor e Enterprise

| Campo | Valor |
|---|---|
| Status | Aceita |
| Data | 18/08/2026 |
| Autores | Equipe Jaguara |
| Tarefa Jira | JAG-38, JAG-39 |

## Contexto

O Jaguara atende dois públicos com necessidades, permissões e complexidade diferentes: tutores e empresas do setor pet (clínicas, pet shops, hotéis).

## Decisão

O sistema separa os contextos Tutor e Enterprise, com controle de acesso baseado em papéis e permissões (RBAC). No backend, cada contexto é um conjunto de módulos; os dados compartilhados (pet, saúde) são acessados pela Enterprise somente por compartilhamento autorizado pelo tutor.

## Alternativas consideradas

- Um único contexto com permissões caso a caso: menos código inicial, mas mistura regras dos dois públicos.
- Dois sistemas independentes: isolamento máximo, mas duplica o cadastro do pet e impede a integração que é a proposta de valor.

## Consequências

- Positiva: maior segurança e isolamento dos dados (RN21, RN24, RN26).
- Negativa: a autenticação e a autorização ficam mais complexas.

## Notas

Registrada originalmente na atividade de ADR de 18/08/2026.
