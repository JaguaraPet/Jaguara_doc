# GES-05 · Registro de riscos

| Campo | Valor |
|---|---|
| Projeto | Jaguara |
| Documento | GES-05 · Registro de riscos |
| Versão | 1.0 |
| Status | Em revisão |
| Autores | Ricardo Guilhen |
| Data | 01/11/2026 |
| Tarefa Jira | JAG-56 |
| Padrão de referência | PMBOK, gerenciamento de riscos; Matriz GUT para priorização |

## Histórico de revisões

| Versão | Data | Autor | Descrição |
|---|---|---|---|
| 1.0 | 01/11/2026 | Ricardo Guilhen | Consolidação dos riscos do TAP, da SWOT e da Matriz GUT, com acréscimo dos riscos de execução da Sprint 7. |

## 1. Objetivo

Manter em um só lugar os riscos do projeto, com probabilidade, impacto, resposta e dono, para que sejam revistos a cada planejamento de sprint.

## 2. Origem

- Riscos iniciais do [TAP (GES-01)](GES-01-TAP.md), seção 8.
- SWOT e Matriz GUT da [pesquisa de mercado (GES-08)](GES-08-pesquisa-de-mercado.md), com a mesma numeração (R01 a R08 = IDs 1 a 8 da GUT).
- Riscos de execução identificados na padronização da documentação (R09 a R14).

## 3. Escalas

- **Probabilidade (P)** e **Impacto (I):** 1 (muito baixo) a 5 (muito alto). **Exposição = P × I.**
- **GUT:** pontuação Gravidade × Urgência × Tendência da matriz original, mantida para os riscos R01 a R08.
- **Resposta:** evitar, mitigar, transferir ou aceitar.

## 4. Registro

| ID | Risco | Origem | GUT | P | I | P×I | Resposta | Ação | Dono | Situação |
|---|---|---|---|---|---|---|---|---|---|---|
| R01 | Conhecimento limitado da área veterinária | SWOT, ponto fraco | 100 | 4 | 5 | 20 | Mitigar | Validar campos de saúde, terminologia e regras com veterinário parceiro; nenhuma recomendação clínica automatizada | Miguel Drozino | Aberto |
| R02 | Baixa adesão das clínicas à integração | SWOT, oportunidades | 80 | 3 | 5 | 15 | Mitigar | Validar o módulo Enterprise com clínicas antes do desenvolvimento; piloto gratuito para as primeiras parceiras | Miguel Drozino | Aberto |
| R03 | Incidente de segurança com dados pessoais de tutores e pets | Mapeamento LGPD | 75 | 3 | 5 | 15 | Mitigar | Criptografia em trânsito e em repouso, RBAC, auditoria e minimização de dados ([ARQ-02](../03-arquitetura/ARQ-02-seguranca-e-lgpd.md)) | Ricardo Guilhen | Em tratamento |
| R04 | Conflito ou indeferimento do registro da marca "Jaguara Pet" (NCL 42) | Pesquisa INPI | 64 | 2 | 4 | 8 | Evitar | Depositar o pedido de marca e registrar os domínios antes da divulgação | Miguel Drozino | Aberto |
| R05 | Mudanças na legislação (LGPD, CDC, CFMV) | SWOT, ameaça | 60 | 2 | 4 | 8 | Aceitar e monitorar | Revisar termos de uso e política de privacidade a cada semestre | Miguel Drozino | Aberto |
| R06 | Baixa conversão para versões pagas (plano PANTERA) | SWOT, ameaça | 48 | 4 | 3 | 12 | Mitigar | Testar percepção de valor e preço com tutores antes de fechar a monetização | Micaela Dorneles | Aberto |
| R07 | Falta de capital inicial para infraestrutura e marketing | SWOT, ponto fraco e ameaça | 36 | 4 | 3 | 12 | Mitigar | MVP enxuto, hospedagem de baixo custo ([ADR-006](../03-arquitetura/adr/ADR-006-hospedagem-e-implantacao.md)) | Miguel Drozino | Em tratamento |
| R08 | Responsabilização por indisponibilidade ou por conteúdo tomado como orientação veterinária | CDC, art. 8 e 14 | 30 | 2 | 4 | 8 | Mitigar | Aviso de que a plataforma não substitui o veterinário; metas de disponibilidade no [REQ-01](../02-requisitos/REQ-01-ERS.md) | Miguel Drozino | Aberto |
| R09 | Escopo de 45 requisitos funcionais maior que a capacidade de quatro pessoas até a v1.0 | Análise da EAP | – | 4 | 4 | 16 | Mitigar | Priorizar por MoSCoW no [REQ-01](../02-requisitos/REQ-01-ERS.md) e implementar primeiro os "Must" | Miguel Drozino | Aberto |
| R10 | Dependência de serviços externos (pagamento, calendário, e-mail, push, IA) | TAP, risco 3 | – | 3 | 3 | 9 | Mitigar | Isolar cada integração atrás de uma interface própria ([ARQ-03](../03-arquitetura/ARQ-03-integracoes.md)) e usar *sandbox* nos testes | Ricardo Guilhen | Em tratamento |
| R11 | Divergência entre documentação e código durante a implementação | Padronização da documentação | – | 3 | 3 | 9 | Mitigar | Documentação versionada no repositório, revisão por pull request e DoD | Ricardo Guilhen | Em tratamento |
| R12 | Decisões de domínio ainda não confirmadas (modelo de cliente, plano PANTERA) | MOD-01, questões em aberto | – | 3 | 3 | 9 | Mitigar | Registrar como ADR e validar com o time (JAG-65) | Ricardo Guilhen | Em tratamento |
| R13 | Alterações nos requisitos durante o desenvolvimento | TAP, risco 1 | – | 3 | 3 | 9 | Aceitar | Mudanças passam pelo backlog e atualizam a matriz de rastreabilidade | Miguel Drozino | Aberto |
| R14 | Atrasos por concorrência com outras disciplinas | TAP, risco 2 | – | 3 | 3 | 9 | Mitigar | Sprints de duas semanas com meta única e revisão do cronograma a cada sprint | Miguel Drozino | Aberto |

## 5. Revisão

O registro é revisto no planejamento de cada sprint. Riscos com exposição maior ou igual a 15 são discutidos na abertura da sprint, e qualquer integrante pode registrar um risco novo como tarefa no Jira com o prefixo "Risco:".
