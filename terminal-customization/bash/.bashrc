# Bash Configuration

# --- History ---
HISTSIZE=10000
HISTFILESIZE=10000
HISTCONTROL=ignoreboth:erasedups  # Ignore duplicates and space-prefixed
shopt -s histappend               # Append to history, don't overwrite

# --- Navigation ---
shopt -s autocd 2>/dev/null       # cd by typing directory name
shopt -s cdspell                  # Autocorrect cd typos

# --- Aliases ---
alias ..="cd .."
alias ...="cd ../.."
alias ll="ls -lah"
alias la="ls -A"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# Git
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log --oneline -20"
alias gd="git diff"

# Development
alias py="python3"
alias serve="python3 -m http.server 8000"
alias ports="lsof -i -P -n | grep LISTEN"

# Modern tools
command -v eza > /dev/null && alias ls="eza" && alias ll="eza -la --git"
command -v bat > /dev/null && alias cat="bat --paging=never"
command -v rg > /dev/null && alias grep="rg"

# --- Prompt ---
if command -v starship > /dev/null; then
    eval "$(starship init bash)"
else
    PS1='\[\033[34m\]\w\[\033[0m\] \[\033[32m\]\$\[\033[0m\] '
fi
