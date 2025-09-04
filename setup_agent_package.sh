#!/usr/bin/env bash
# Script para inicializar o pacote do agente de codificação em um projeto existente
# Uso: ./setup_agent_package.sh [CAMINHO_DO_PROJETO]

set -euo pipefail

PROJECT_DIR="${1:-$(pwd)}"

# Cria a estrutura de diretórios
mkdir -p "$PROJECT_DIR/docs/templates"
mkdir -p "$PROJECT_DIR/docs/registro-de-sessao"

# README.md (apenas cria se não existir)
if [ ! -f "$PROJECT_DIR/README.md" ]; then
  cat > "$PROJECT_DIR/README.md" <<'EOF'
# Projeto

Descrição breve do projeto.

> Este repositório segue o [Pacote de Instruções do Agente de Codificação](./QWEN.md).
EOF
fi

# QWEN.md (guia resumido)
cat > "$PROJECT_DIR/QWEN.md" <<'EOF'
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
EOF

# AGENT_PROTOCOL.md
# Híbrido: se variável de ambiente AGENT_PROTOCOL_PATH existir e for arquivo, copia de lá.
# Caso contrário, gera versão embed completa.
AGENT_PROTOCOL_FILE="$PROJECT_DIR/docs/AGENT_PROTOCOL.md"

if [ -n "${AGENT_PROTOCOL_PATH:-}" ] && [ -f "$AGENT_PROTOCOL_PATH" ]; then
  cp "$AGENT_PROTOCOL_PATH" "$AGENT_PROTOCOL_FILE"
else
  cat > "$AGENT_PROTOCOL_FILE" <<'EOF'
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

*(conteúdo completo do protocolo com checklists, convenções, templates e boas práticas deve ser incluído aqui — idêntico ao documento mestre que já elaboramos anteriormente)*
EOF
fi

# Templates
cat > "$PROJECT_DIR/docs/templates/ISSUE_TEMPLATE.md" <<'EOF'
# <Título: ação/resultado esperado>

## Contexto
<resumo do problema/solicitação>

## Objetivo
<resultado esperado>

## Critérios de Aceite
- [ ] Critério 1
- [ ] Critério 2

## Plano
1. Passo 1
2. Passo 2

## Riscos e Dependências
- Dependência A
- Risco B

## Referências
- Link 1
- Nota técnica (docs/<arquivo>.md)
EOF

cat > "$PROJECT_DIR/docs/templates/PR_TEMPLATE.md" <<'EOF'
# Resumo
<o que muda e por quê>

## Como Testar
<passos, comandos, dados de teste>

## Antes / Depois
<screenshots ou descrição do impacto>

## Checklist
- [ ] Critérios de aceite atendidos
- [ ] Documentação atualizada
- [ ] Testes passando no CI
- [ ] Sem pendências relacionadas

## Links
- Issue: #<id>
- Commits relevantes
EOF

cat > "$PROJECT_DIR/docs/templates/SESSION_LOG_TEMPLATE.md" <<'EOF'
---
data: YYYY-MM-DD hh:mm (America/Sao_Paulo)
responsavel: <nome>
issue: #<id>
pr: #<id>
branch: <nome-do-branch>
---

## Objetivo da Sessão

## O que Foi Feito
- Mudança X
- Mudança Y

## Decisões
- Decisão 1 (racional)

## Problemas e Soluções

## Ponto de Retomada
<próximo passo imediato>

## Links Úteis
- Issue / PR / Docs
EOF


echo "✅ Pacote do agente configurado em: $PROJECT_DIR"
