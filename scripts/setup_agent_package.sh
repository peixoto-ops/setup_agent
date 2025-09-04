#!/usr/bin/env bash
# Script para inicializar o pacote do agente de codificação em um projeto existente
# Uso: ./setup_agent_package.sh [CAMINHO_DO_PROJETO]

set -euo pipefail

PROJECT_DIR="${1:-$(pwd)}"

# Carregar variáveis do .env se existir
if [ -f ".env" ]; then
  export $(grep -v '^#' .env | xargs)
fi

# Tenta obter usuário e nome do repositório a partir do git remoto
REPO_URL="$(git -C "$PROJECT_DIR" remote get-url origin 2>/dev/null || true)"
if [[ -n "$REPO_URL" && "$REPO_URL" =~ github.com[:/](.+)/(.+)\.git ]]; then
  GITHUB_USER="${BASH_REMATCH[1]}"
  GITHUB_REPO="${BASH_REMATCH[2]}"
else
  # Fallback seguro para repositórios novos
  GITHUB_USER="seu-usuario"
  GITHUB_REPO="$(basename "$PROJECT_DIR")"
fi

# Cria a estrutura de diretórios
mkdir -p "$PROJECT_DIR/docs/templates"
mkdir -p "$PROJECT_DIR/docs/registro-de-sessao"
mkdir -p "$PROJECT_DIR/logs"

# Atualiza README.md com links e badges
cat > "$PROJECT_DIR/README.md" <<EOF
# Projeto: $GITHUB_REPO

[![GitHub issues](https://img.shields.io/github/issues/$GITHUB_USER/$GITHUB_REPO)](https://github.com/$GITHUB_USER/$GITHUB_REPO/issues)
[![GitHub pull requests](https://img.shields.io/github/issues-pr/$GITHUB_USER/$GITHUB_REPO)](https://github.com/$GITHUB_USER/$GITHUB_REPO/pulls)
[![GitHub stars](https://img.shields.io/github/stars/$GITHUB_USER/$GITHUB_REPO)](https://github.com/$GITHUB_USER/$GITHUB_REPO/stargazers)
[![GitHub license](https://img.shields.io/github/license/$GITHUB_USER/$GITHUB_REPO)](LICENSE)

Descrição breve do projeto.

> Este repositório segue o [Pacote de Instruções do Agente de Codificação](QWEN.md) e o [Protocolo do Agente](docs/AGENT_PROTOCOL.md).
EOF

# QWEN.md
curl -sSL "https://raw.githubusercontent.com/peixoto-ops/setup_agent/main/QWEN.md" -o "$PROJECT_DIR/QWEN.md"

# AGENT_PROTOCOL.md - híbrido
if [ -n "${AGENT_PROTOCOL_PATH:-}" ] && [ -f "$AGENT_PROTOCOL_PATH" ]; then
  cp "$AGENT_PROTOCOL_PATH" "$PROJECT_DIR/docs/AGENT_PROTOCOL.md"
else
  curl -sSL "https://raw.githubusercontent.com/peixoto-ops/setup_agent/main/docs/AGENT_PROTOCOL.md" -o "$PROJECT_DIR/docs/AGENT_PROTOCOL.md"
fi

# Templates
curl -sSL "https://raw.githubusercontent.com/peixoto-ops/setup_agent/main/templates/ISSUE_TEMPLATE.md" -o "$PROJECT_DIR/docs/templates/ISSUE_TEMPLATE.md"
curl -sSL "https://raw.githubusercontent.com/peixoto-ops/setup_agent/main/templates/PR_TEMPLATE.md" -o "$PROJECT_DIR/docs/templates/PR_TEMPLATE.md"
curl -sSL "https://raw.githubusercontent.com/peixoto-ops/setup_agent/main/templates/SESSION_LOG_TEMPLATE.md" -o "$PROJECT_DIR/docs/templates/SESSION_LOG_TEMPLATE.md"

echo "✅ Pacote do agente configurado em: $PROJECT_DIR"
