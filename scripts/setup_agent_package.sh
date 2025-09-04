#!/usr/bin/env bash
# Script para inicializar o pacote do agente de codificação em um projeto existente
# Uso: ./setup_agent_package.sh [CAMINHO_DO_PROJETO]

set -euo pipefail

PROJECT_DIR="${1:-$(pwd)}"

# Carregar variáveis do .env se existir
if [ -f ".env" ]; then
  export $(grep -v '^#' .env | xargs)
fi

# Cria a estrutura de diretórios
mkdir -p "$PROJECT_DIR/docs/templates"
mkdir -p "$PROJECT_DIR/docs/registro-de-sessao"
mkdir -p "$PROJECT_DIR/logs"

# README.md
if [ ! -f "$PROJECT_DIR/README.md" ]; then
  cat > "$PROJECT_DIR/README.md" <<'EOF'
# Projeto

Descrição breve do projeto.

> Este repositório segue o [Pacote de Instruções do Agente de Codificação](./QWEN.md).
EOF
fi

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
