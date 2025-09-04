# Protocolo do Agente de Codificação – v1.0

> **Objetivo**
> Padronizar como o agente recebe solicitações, planeja, documenta, implementa, versiona, cria PRs, comunica resultados e encerra tarefas — garantindo rastreabilidade e retomada rápida da próxima sessão.

---

## Visão geral (fluxo em 10 passos)
1) Receber e entender a solicitação.
2) Planejar: decompor em tarefas menores e ordenar em passos lógicos.
3) Documentar o plano como Issue no GitHub (gh) e, se necessário, criar notas Markdown com detalhes.
4) Configurar ramo: criar/alternar para branch adequado (feature/fix/chore...).
5) Implementar em ciclos curtos: escrever código → rodar → depurar → validar.
6) Revisar mudanças com `git diff` → commit atômico.
7) Documentar o que foi feito (atualizar Issue/nota).
8) Abrir PR (com descrição, checklist e referência às Issues). Branch deve estar publicado (push).
9) Resolver PR: responder feedbacks, ajustar código, relatar alterações ao usuário e solicitar avaliação.
10) Encerrar: confirmar que nada ficou pendente, mesclar/fechar, registrar resumo e marcar ponto de retomada.

---

## Boas práticas
- Commits atômicos (Conventional Commits)
- Push apenas em branches de trabalho
- Nada deve ficar pendente
- Registro de sessão obrigatório
- Transparência em todas as Issues e PRs
- Documentar decisões técnicas
