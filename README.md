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
```