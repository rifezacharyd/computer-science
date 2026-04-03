#!/usr/bin/env bash
set -euo pipefail

echo "--- Installing Code Editors ---"

# --- VS Code ---
echo "[*] Visual Studio Code..."
if command -v code > /dev/null 2>&1; then
    echo "  [OK] VS Code already installed"
else
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/packages.microsoft.gpg
    sudo install -D -o root -g root -m 644 /tmp/packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | \
        sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
    rm -f /tmp/packages.microsoft.gpg
    sudo apt update
    sudo apt install -y code
    echo "  [+] VS Code installed"
fi

# --- Neovim ---
echo ""
echo "[*] Neovim..."
if command -v nvim > /dev/null 2>&1; then
    echo "  [OK] Neovim already installed"
else
    sudo add-apt-repository -y ppa:neovim-ppa/unstable 2>/dev/null || true
    sudo apt update
    sudo apt install -y neovim
    echo "  [+] Neovim installed"
fi

echo "[+] Editors installed"
