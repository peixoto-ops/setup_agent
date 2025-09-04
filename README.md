Boa 🚀 — se já vamos usar o repositório `peixoto-ops/setup_agent`, podemos transformá-lo no seu **repositório central de bootstrap do agente**.

Aqui está um **`README.md`** com badges e instruções de uso, já ajustado para o seu repositório, e os ajustes necessários nos arquivos (`setup_agent_package.sh`, `.env.example`, etc.) para apontarem para o GitHub remoto.

---

## 📄 `README.md`

````markdown
# 🤖 setup_agent

[![GitHub issues](https://img.shields.io/github/issues/peixoto-ops/setup_agent)](https://github.com/peixoto-ops/setup_agent/issues)
[![GitHub pull requests](https://img.shields.io/github/issues-pr/peixoto-ops/setup_agent)](https://github.com/peixoto-ops/setup_agent/pulls)
[![GitHub stars](https://img.shields.io/github/stars/peixoto-ops/setup_agent)](https://github.com/peixoto-ops/setup_agent/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/peixoto-ops/setup_agent)](https://github.com/peixoto-ops/setup_agent/network)
[![License](https://img.shields.io/github/license/peixoto-ops/setup_agent)](./LICENSE)

Repositório central para inicializar e gerenciar **agentes de codificação** em qualquer projeto.  
Este repositório contém:

- 📜 Protocolo detalhado do agente (`AGENT_PROTOCOL.md`)  
- ⚡ Script de bootstrap (`scripts/setup_agent_package.sh`)  
- 📝 Templates de Issues, PRs e Sessões (`templates/`)  
- ⚙️ Exemplo de configuração `.env.example`  

---

## 🚀 Como usar em qualquer projeto

Na raiz do seu projeto, execute:

```bash
curl -sSL https://raw.githubusercontent.com/peixoto-ops/setup_agent/main/scripts/setup_agent_package.sh | bash
````

Isso irá:

* Criar a estrutura de diretórios necessária (`docs/`, `logs/`, `templates/`)
* Copiar o `AGENT_PROTOCOL.md` e templates do repositório central
* Configurar um `.env` com variáveis padrão

---

## ⚙️ Configuração

Edite o arquivo `.env` do seu projeto para personalizar:

```bash
AGENT_PROTOCOL_PATH="./docs/AGENT_PROTOCOL.md"
FEATURE_BRANCH_PREFIX="feature/"
MAIN_BRANCH="main"
LOGS_DIR="./logs"
TEMPLATES_DIR="./docs/templates"
AGENT_NAME="QWEN"
AGENT_LOG_LEVEL="INFO"
```

---

## 🛠 Estrutura final do projeto

```
.
├── .env
├── QWEN.md
├── docs/
│   ├── AGENT_PROTOCOL.md
│   └── templates/
│       ├── ISSUE_TEMPLATE.md
│       ├── PR_TEMPLATE.md
│       └── SESSION_LOG_TEMPLATE.md
├── logs/
│   └── .gitkeep
└── scripts/
    └── setup_agent_package.sh
```

---

## 🤝 Contribuindo

Abra uma [Issue](https://github.com/peixoto-ops/setup_agent/issues) para discutir melhorias ou reporte problemas.
Pull requests são bem-vindos!

---

## 📄 Licença

Distribuído sob a licença MIT. Consulte [LICENSE](./LICENSE) para mais detalhes.

````

---

## 📜 Ajustes no `setup_agent_package.sh`

Troque o trecho onde antes estava embed/local por:

```bash
# Se AGENT_PROTOCOL_PATH não estiver definido, usa remoto do GitHub
if [ -z "$AGENT_PROTOCOL_PATH" ]; then
  echo "ℹ️ Nenhum AGENT_PROTOCOL_PATH definido. Baixando protocolo remoto..."
  curl -sSL "https://raw.githubusercontent.com/peixoto-ops/setup_agent/main/docs/AGENT_PROTOCOL.md" -o "docs/AGENT_PROTOCOL.md"
else
  echo "📂 Usando protocolo local definido em AGENT_PROTOCOL_PATH=$AGENT_PROTOCOL_PATH"
  cp "$AGENT_PROTOCOL_PATH" "docs/AGENT_PROTOCOL.md"
fi

# Baixar templates sempre do remoto
curl -sSL "https://raw.githubusercontent.com/peixoto-ops/setup_agent/main/templates/ISSUE_TEMPLATE.md" -o "docs/templates/ISSUE_TEMPLATE.md"
curl -sSL "https://raw.githubusercontent.com/peixoto-ops/setup_agent/main/templates/PR_TEMPLATE.md" -o "docs/templates/PR_TEMPLATE.md"
curl -sSL "https://raw.githubusercontent.com/peixoto-ops/setup_agent/main/templates/SESSION_LOG_TEMPLATE.md" -o "docs/templates/SESSION_LOG_TEMPLATE.md"
````

---

## 📜 Ajuste no `.env.example`

```bash
# Caminho para protocolo mestre (opcional)
# Se não definido, o script baixa direto do GitHub remoto
# AGENT_PROTOCOL_PATH="$HOME/agent-protocol/AGENT_PROTOCOL.md"

FEATURE_BRANCH_PREFIX="feature/"
MAIN_BRANCH="main"
LOGS_DIR="./logs"
TEMPLATES_DIR="./docs/templates"
AGENT_NAME="QWEN"
AGENT_LOG_LEVEL="INFO"
```

---


