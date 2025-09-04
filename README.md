
# Projeto: setup_agent

[![GitHub issues](https://img.shields.io/github/issues/peixoto-ops/setup_agent)](https://github.com/peixoto-ops/setup_agent/issues)
[![GitHub pull requests](https://img.shields.io/github/issues-pr/peixoto-ops/setup_agent)](https://github.com/peixoto-ops/setup_agent/pulls)
[![GitHub stars](https://img.shields.io/github/stars/peixoto-ops/setup_agent)](https://github.com/peixoto-ops/setup_agent/stargazers)
[![GitHub license](https://img.shields.io/github/license/peixoto-ops/setup_agent)](LICENSE)

Pacote de inicialização para padronizar o **Agente de Codificação** em múltiplos projetos.  
Este repositório contém instruções, protocolos e templates para organizar tarefas, issues e sessões de trabalho.

---

## 📦 Estrutura do pacote

```

.
├── docs
│   ├── AGENT\_PROTOCOL.md        # Protocolo principal do agente
│   ├── registro-de-sessao/      # Local para registros de sessões
│   └── templates/               # Modelos de issues, PRs e sessões
├── logs/                        # Logs de execução do agente
├── QWEN.md                      # Pacote de instruções do agente
├── README.md                    # Este arquivo
└── scripts/
└── setup\_agent\_package.sh   # Script de inicialização do pacote

````

---

## 🚀 Uso

Para aplicar este pacote em qualquer repositório:

```bash
curl -sSL https://raw.githubusercontent.com/peixoto-ops/setup_agent/main/scripts/setup_agent_package.sh | bash
````

Isso criará toda a estrutura necessária (`docs/`, `logs/`, templates e protocolos) no repositório de destino.

---

## 📑 Referências

* [Pacote de Instruções do Agente de Codificação](QWEN.md)
* [Protocolo do Agente](docs/AGENT_PROTOCOL.md)

---

## 📜 Licença

Distribuído sob a licença MIT. Consulte o arquivo [LICENSE](LICENSE) para mais detalhes.
