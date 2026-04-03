# Zsh Configuration

# --- History ---
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS       # Don't store duplicate commands
setopt HIST_IGNORE_SPACE      # Don't store commands starting with space
setopt SHARE_HISTORY          # Share history between sessions
setopt APPEND_HISTORY         # Append, don't overwrite

# --- Navigation ---
setopt AUTO_CD                # cd by typing directory name
setopt AUTO_PUSHD             # Push dirs onto stack automatically
setopt PUSHD_SILENT           # Don't print dir stack after pushd

# --- Completion ---
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # Case-insensitive completion
zstyle ':completion:*' menu select                     # Arrow-key menu
setopt COMPLETE_ALIASES

# --- Aliases ---
# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"

# Listing (use modern alternatives if available)
if command -v eza > /dev/null; then
    alias ls="eza"
    alias ll="eza -la --git"
    alias lt="eza -la --tree --level=2"
else
    alias ll="ls -lah"
    alias la="ls -A"
fi

# Safety
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# Git shortcuts
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log --oneline -20"
alias gd="git diff"
alias gb="git branch"

# Development
alias py="python3"
alias venv="python3 -m venv venv && source venv/bin/activate"
alias serve="python3 -m http.server 8000"

# System
alias ports="lsof -i -P -n | grep LISTEN"
alias myip="curl -s ifconfig.me"

# --- Modern Tool Integration ---
# fzf (fuzzy finder)
if command -v fzf > /dev/null; then
    source <(fzf --zsh) 2>/dev/null || true
fi

# Use bat instead of cat if available
if command -v bat > /dev/null; then
    alias cat="bat --paging=never"
fi

# Use ripgrep instead of grep if available
if command -v rg > /dev/null; then
    alias grep="rg"
fi

# --- Prompt ---
# Use Starship if installed, otherwise simple prompt
if command -v starship > /dev/null; then
    eval "$(starship init zsh)"
else
    PROMPT='%F{blue}%~%f %F{green}$%f '
fi
