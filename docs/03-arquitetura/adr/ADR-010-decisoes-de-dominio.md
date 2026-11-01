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
3. **Cliente:** todo cliente de uma empresa é um tutor cadastrado no Jaguara; `Cliente` é a classe de associação entre empresa e tutor. **Proposta**, a confirmar pelo time.

## Alternativas consideradas

- Só chat com empresa na v1.0: menor escopo, mas descarta a principal oportunidade de monetização identificada na SWOT.
- Cliente sem conta na plataforma: atende clientes de balcão, mas duplica o cadastro do pet e quebra o compartilhamento controlado pelo tutor.

## Consequências

- Positiva: o MOD-01 já suporta os dois modos de chat e a assinatura, sem mudança de modelo.
- Negativa: o assistente virtual depende de um provedor de IA externo ([ARQ-03](../ARQ-03-integracoes.md)) e precisa de aviso de que não substitui o veterinário (risco R08).
- Negativa: clientes que não usam o app precisam ser convidados a criar conta.

## Notas

Itens 1 e 2 decididos em 01/11/2026; item 3 pendente na tarefa JAG-65.
