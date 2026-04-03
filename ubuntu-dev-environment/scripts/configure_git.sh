#!/usr/bin/env bash
set -euo pipefail

echo "--- Configuring Git ---"

# Check if git is configured
CURRENT_NAME=$(git config --global user.name 2>/dev/null || echo "")
CURRENT_EMAIL=$(git config --global user.email 2>/dev/null || echo "")

if [ -n "$CURRENT_NAME" ] && [ -n "$CURRENT_EMAIL" ]; then
    echo "[OK] Git already configured:"
    echo "  Name: $CURRENT_NAME"
    echo "  Email: $CURRENT_EMAIL"
else
    echo "[*] Git user not configured."
    echo "  Run manually:"
    echo "    git config --global user.name 'Your Name'"
    echo "    git config --global user.email 'you@example.com'"
fi

# Useful defaults
echo ""
echo "[*] Setting recommended defaults..."

git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global push.autoSetupRemote true
git config --global core.editor "vim"
git config --global core.autocrlf input
git config --global color.ui auto

# Useful aliases
git config --global alias.st "status"
git config --global alias.co "checkout"
git config --global alias.br "branch"
git config --global alias.ci "commit"
git config --global alias.lg "log --oneline --graph --decorate -20"
git config --global alias.last "log -1 HEAD --stat"
git config --global alias.unstage "reset HEAD --"
git config --global alias.amend "commit --amend --no-edit"

echo "[+] Git configured with aliases: st, co, br, ci, lg, last, unstage, amend"
