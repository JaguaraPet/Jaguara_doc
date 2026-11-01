# TST-01 · Plano de testes

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | TST-01 · Plano de testes |
| Versão | 1.0 |
| Status | Em revisão |
| Autores | Ricardo Guilhen |
| Data | 01/11/2026 |
| Tarefa Jira | JAG-72, JAG-43 (testes unitários) |
| Padrão de referência | ISO/IEC/IEEE 29119-3, plano de testes |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 1.0 | 01/11/2026 | Ricardo Guilhen | Estratégia, níveis, ferramentas, ambientes e critérios de entrada e saída da v1.0. |

## 1. Objetivo

Definir como o Jaguara será testado para demonstrar que atende aos requisitos do [REQ-01](../02-requisitos/REQ-01-ERS.md) antes da entrega da versão 1.0.

## 2. Itens de teste

| Item | Versão |
|---|---|
| API (NestJS) | Cada release `vX.Y.Z` |
| App do tutor (Expo) | Build de homologação |
| Web Enterprise e administração | Build de homologação |
| Banco de dados (esquema do [MOD-03](../04-modelagem/MOD-03-modelo-de-dados.md)) | Migrações da release |

Fora do escopo: testes dos serviços externos em si (pagamento, calendário, e-mail, *push*, IA), que são substituídos por *sandbox* ou *mocks*.

## 3. Estratégia

| Nível | O que verifica | Ferramenta | Responsável | Automação |
|---|---|---|---|---|
| Unitário | Regras de domínio (entidades e serviços), validações e funções puras | Jest | Autor do código | 100% automatizado, executado na CI |
| Integração | Repositórios com PostgreSQL real, adaptadores com *mocks* de HTTP | Jest + Testcontainers | Autor do código | Automatizado na CI |
| Sistema (API) | Cada caso de teste do [TST-02](TST-02-casos-de-teste.md) via HTTP | Jest + Supertest | Dupla da funcionalidade | Automatizado na CI |
| Ponta a ponta | Fluxos críticos DS-01 a DS-06 pela interface | Playwright (web) e Maestro (app) | Responsável de testes | Automatizado antes de cada release |
| Aceitação | Cenários Gherkin do [REQ-05](../02-requisitos/REQ-05-historias-de-usuario.md) com usuários | Roteiro manual | *Product Owner* | Manual, a cada sprint |
| Não funcional | RNF01, RNF03, RNF05, RNF06, RNF08 | OWASP ZAP, k6, Lighthouse, teste de usabilidade (SUS) | Responsável de testes | Semiautomático |

### 3.1 Testes unitários (JAG-43)

- **Escopo obrigatório:** toda regra de negócio de domínio (RN01 a RN40) tem pelo menos um teste unitário que a viola e outro que a respeita. Exemplos: `Agendamento.verificarConflitos` (RN14, RN29), `Usuario.registrarFalhaLogin` (RN03), `Pet.excluir` (RN08), `Atendimento.alterarComAuditoria` (RN28).
- **Convenções:** arquivo `*.spec.ts` ao lado do código; nome do teste em português no formato "deve ... quando ..."; padrão *Arrange, Act, Assert*; sem acesso a rede ou banco.
- **Meta de cobertura:** 70% de linhas nos módulos de domínio e aplicação (RNF09), medida pelo Jest na CI; o pull request falha abaixo da meta.
- **Frontend:** componentes com regra de exibição (por exemplo, alerta de alergia grave) testados com React Testing Library.

## 4. Ambientes

| Ambiente | Uso | Dados |
|---|---|---|
| Local | Unitários e integração | Banco efêmero (Testcontainers) |
| CI (GitHub Actions) | Unitários, integração e sistema em todo pull request | Banco efêmero com dados semente |
| Homologação | Ponta a ponta, aceitação e não funcionais | Dados fictícios; nenhum dado real de pessoas |

Dados de teste nunca usam CPF, e-mail ou telefone reais; são gerados com bibliotecas de dados fictícios.

## 5. Critérios

### 5.1 Entrada (para começar a testar uma funcionalidade)

- Caso de uso especificado e história com critérios de aceitação ([REQ-04](../02-requisitos/REQ-04-especificacao-casos-de-uso.md), [REQ-05](../02-requisitos/REQ-05-historias-de-usuario.md)).
- Build da CI verde e implantado em homologação.

### 5.2 Saída (para liberar a v1.0)

- 100% dos casos de teste *Must* executados e aprovados.
- Pelo menos 90% dos casos *Should* aprovados; falhas restantes com contorno documentado.
- Cobertura de testes unitários de pelo menos 70% no domínio.
- Nenhum defeito aberto de severidade crítica ou alta.
- RNF01, RNF03 e RNF06 medidos e dentro das metas.

### 5.3 Suspensão e retomada

Os testes de uma release são suspensos quando a funcionalidade de login ou de agenda falha, e retomados após a correção e um novo build.

## 6. Defeitos

| Severidade | Definição | Prazo de correção |
|---|---|---|
| Crítica | Perda de dados, falha de segurança ou bloqueio de fluxo *Must* | Antes do próximo build |
| Alta | Regra de negócio violada sem contorno | Na sprint atual |
| Média | Falha com contorno | Até a próxima sprint |
| Baixa | Cosmético | Backlog |

Defeitos são registrados no Jira como tarefa com o prefixo "Defeito:" e a referência do caso de teste.

## 7. Entregáveis

- [TST-02 · Casos de teste](TST-02-casos-de-teste.md)
- [TST-03 · Relatório de execução](TST-03-relatorio-de-testes.md)
- Relatórios de cobertura e de execução da CI

## 8. Riscos

| Risco | Mitigação |
|---|---|
| Falta de tempo para testes no fim do semestre | Testes escritos junto com o código e exigidos pela DoD |
| Serviços externos instáveis | *Sandbox* e *mocks* nos níveis automatizados |
| Poucos usuários para o teste de usabilidade | Recrutar tutores conhecidos e clínicas parceiras (risco R02) |
