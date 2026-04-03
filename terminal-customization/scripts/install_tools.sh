#!/usr/bin/env bash
set -euo pipefail

# Terminal Productivity Tools Installer
# Detects OS and installs common CLI productivity tools.

echo "========================================="
echo "  Terminal Productivity Tools Installer"
echo "========================================="

# Detect package manager
if command -v brew > /dev/null 2>&1; then
    PM="brew"
    INSTALL="brew install"
elif command -v apt > /dev/null 2>&1; then
    PM="apt"
    INSTALL="sudo apt install -y"
elif command -v dnf > /dev/null 2>&1; then
    PM="dnf"
    INSTALL="sudo dnf install -y"
else
    echo "[!] No supported package manager found (brew, apt, dnf)"
    exit 1
fi

echo "[*] Package manager: $PM"

# Tool list
TOOLS=(
    "tmux"          # Terminal multiplexer
    "fzf"           # Fuzzy finder
    "ripgrep"       # Fast grep alternative (rg)
    "bat"           # cat with syntax highlighting
    "eza"           # Modern ls replacement
    "jq"            # JSON processor
    "htop"          # Interactive process viewer
    "tree"          # Directory tree viewer
    "wget"          # File downloader
    "curl"          # HTTP client
)

echo "[*] Installing tools..."
for tool in "${TOOLS[@]}"; do
    if command -v "$tool" > /dev/null 2>&1; then
        echo "  [OK] $tool (already installed)"
    else
        echo "  [*] Installing $tool..."
        $INSTALL "$tool" 2>/dev/null || echo "  [!] Failed to install $tool"
    fi
done

# Starship prompt (special install)
if ! command -v starship > /dev/null 2>&1; then
    echo "[*] Installing Starship prompt..."
    if [ "$PM" = "brew" ]; then
        brew install starship
    else
        curl -sS https://starship.rs/install.sh | sh -s -- -y
    fi
else
    echo "  [OK] starship (already installed)"
fi

echo ""
echo "========================================="
echo "  Installation complete!"
echo "  Restart your shell or run: source ~/.zshrc"
echo "========================================="
