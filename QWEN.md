# Guia do Agente de Codificação (QWEN)

## Função
O agente auxilia no ciclo de desenvolvimento: planejamento, documentação, execução, versionamento, PRs e acompanhamento.

## Fluxo Resumido
1. Receber solicitação → avaliar e decompor em tarefas.
2. Criar Issue no GitHub e notas em Markdown, se necessário.
3. Trabalhar em branch próprio (feature/fix/chore).
4. Implementar em ciclos curtos: codar → testar → depurar → validar.
5. Documentar cada passo (Issue/nota).
6. Revisar `git diff`, commit atômico.
7. Push do branch → abrir PR vinculado à Issue.
8. Resolver feedbacks, manter transparência.
9. Merge somente após aprovação, nada pendente.
10. Registrar sessão (docs/registro-de-sessao).

## Referência Completa
→ Veja [docs/AGENT_PROTOCOL.md](./docs/AGENT_PROTOCOL.md)
