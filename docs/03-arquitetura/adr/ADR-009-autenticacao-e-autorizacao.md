# ADR-009 · Autenticação e autorização

| Campo | Valor |
|---|---|
| Status | Proposta |
| Data | 01/11/2026 |
| Autores | Ricardo Guilhen |
| Tarefa Jira | JAG-38, JAG-39 |

## Contexto

RN03 a RN06 definem bloqueio, expiração de sessão e política de senhas; RN20, RN22, RN24, RN26 e RN35 exigem permissões por perfil, por empresa e por compartilhamento.

## Decisão

Autenticação própria com **senha em hash Argon2id**, **access token JWT de 15 minutos** e **refresh token opaco** associado a uma `Sessao` no banco (permite revogar sessões, RN23, e aplicar a inatividade de 4 horas, RN04). Autorização em duas camadas: **RBAC** por `PerfilAcesso`/`Permissao` em cada rota (*guards* do NestJS) e **verificação de posse e compartilhamento** nos serviços (tutor dono do pet, empresa com `CompartilhamentoPet` ativo ou agendamento). Contadores de falha e bloqueio no próprio `Usuario` (RN03).

## Alternativas consideradas

- Provedor externo (Auth0, Cognito, Firebase Auth): menos código, mas custo por usuário e dados pessoais em terceiro.
- Sessão apenas em cookie no servidor: simples na web, menos prático para o app mobile.

## Consequências

- Positiva: controle total das regras de negócio de acesso e revogação imediata.
- Negativa: o time implementa e testa fluxos sensíveis de segurança; mitigado pela checagem do OWASP ASVS no [ARQ-02](../ARQ-02-seguranca-e-lgpd.md).

## Notas

Proposta pela padronização.
