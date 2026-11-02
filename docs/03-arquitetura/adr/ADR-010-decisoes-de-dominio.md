# ADR-010 · Decisões de domínio: chat, plano PANTERA e cliente

| Campo | Valor |
|---|---|
| Status | Aceita |
| Data | 01/11/2026 |
| Autores | Ricardo Guilhen |
| Tarefa Jira | JAG-38, JAG-39 |

## Contexto

O modelo de classes deixou três questões em aberto (QA-02 a QA-04 do MOD-01): o RF42 descreve chat entre tutor e empresa e o JGR044 descreve um assistente com plano PANTERA; o plano só aparece no chat; e não estava definido se todo cliente da empresa é um tutor cadastrado.

## Decisão

1. **Chat:** a v1.0 tem os dois modos: conversa entre tutor e empresa e conversa com o **assistente virtual**, distinguidos por `TipoConversa`. Decidido pelo time em 01/11/2026.
2. **Plano PANTERA:** entra na v1.0 como requisito do assistente virtual (`Assinatura`); a conversa com empresas é gratuita. Decidido pelo time em 01/11/2026.
3. **Cliente:** o cliente de uma empresa **não precisa** ter conta no Jaguara. `Cliente` é um cadastro da empresa, com nome, CPF e contato; quando o cliente tem conta, o cadastro fica ligado ao `Tutor`. Pets de clientes sem conta ficam ligados ao `Cliente` e passam para o tutor quando ele cria a conta. Decidido pelo time em 01/11/2026.

## Alternativas consideradas

- Só chat com empresa na v1.0: menor escopo, mas descarta a principal oportunidade de monetização identificada na SWOT.
- Todo cliente com conta obrigatória (`Cliente` como classe de associação entre empresa e tutor): modelo mais simples e o tutor controla todos os dados do pet, mas a empresa não conseguiria atender clientes de balcão que não usam o app. Rejeitada porque as empresas precisam registrar todos os atendimentos desde o primeiro dia.

## Consequências

- Positiva: o MOD-01 já suporta os dois modos de chat e a assinatura, sem mudança de modelo.
- Negativa: o assistente virtual depende de um provedor de IA externo e precisa de aviso de que não substitui o veterinário (risco R08).
- Positiva: a empresa registra qualquer cliente; o e-mail do cadastro serve para convidar o cliente a criar conta.
- Negativa: pets de clientes sem conta existem sem responsável tutor até o vínculo, o que exige a regra RC-09 com exceção e a tabela `cliente_pet` ([MOD-01](../../04-modelagem/MOD-01-modelo-de-classes.md), [MOD-03](../../04-modelagem/MOD-03-modelo-de-dados.md)).

## Notas

Os três itens foram decididos pelo time em 01/11/2026 (tarefa JAG-65).
