# Setting Up the Perfect Programming Environment on Ubuntu

Automated setup scripts for a complete development environment on Ubuntu. Installs essential tools, programming languages, editors, Docker, and configures git.

## Prerequisites

- Ubuntu 22.04 LTS or newer
- sudo access

## Quick Start

```bash
chmod +x setup.sh scripts/*.sh
./setup.sh
```

Or run individual components:

```bash
./scripts/install_essentials.sh    # Build tools, curl, wget, etc.
./scripts/install_languages.sh     # Python (pyenv), Node (nvm), Ruby (rbenv)
./scripts/install_editors.sh       # VS Code, Neovim
./scripts/install_docker.sh        # Docker + Docker Compose
./scripts/configure_git.sh         # Git config with useful aliases
```

## What Gets Installed

| Category | Tools |
|----------|-------|
| Essentials | git, curl, wget, build-essential, htop, tree, jq |
| Python | pyenv + latest Python 3 |
| Node.js | nvm + latest LTS |
| Ruby | rbenv + latest Ruby |
| Editors | VS Code, Neovim |
| Containers | Docker CE, Docker Compose |
| Shell | Useful aliases in `configs/bash_aliases` |

---

*Part of a Computer Science portfolio. See the accompanying blog post for conceptual background.*
