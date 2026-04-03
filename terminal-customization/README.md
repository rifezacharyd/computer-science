# Customizing the Terminal and Productivity Tools

Configuration files and setup scripts for building a productive terminal environment. Covers shell configuration, multiplexing, modern CLI tools, and prompt customization.

## Configurations Included

| Tool | Config | Purpose |
|------|--------|---------|
| Zsh | `zsh/.zshrc` | Shell config with aliases, history, prompt |
| Bash | `bash/.bashrc` | Equivalent bash configuration |
| tmux | `tmux/.tmux.conf` | Terminal multiplexer with sane defaults |
| Starship | `starship/starship.toml` | Cross-shell prompt with git info |
| Alacritty | `alacritty/alacritty.toml` | GPU-accelerated terminal emulator |

## Quick Start

```bash
# Install productivity tools
chmod +x scripts/install_tools.sh
./scripts/install_tools.sh

# Copy configs (back up originals first)
cp zsh/.zshrc ~/.zshrc
cp tmux/.tmux.conf ~/.tmux.conf
mkdir -p ~/.config/starship && cp starship/starship.toml ~/.config/starship.toml
```

---

*Part of a Computer Science portfolio. See the accompanying blog post for conceptual background.*
