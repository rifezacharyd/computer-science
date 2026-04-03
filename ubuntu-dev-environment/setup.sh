#!/usr/bin/env bash
set -euo pipefail

# Master Setup Script
# Orchestrates the complete Ubuntu development environment setup.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "============================================="
echo "  Ubuntu Development Environment Setup"
echo "  $(date)"
echo "============================================="

# Check we're on a Debian-based system
if ! command -v apt > /dev/null 2>&1; then
    echo "[!] This script is designed for Ubuntu/Debian systems."
    echo "    apt package manager not found."
    exit 1
fi

echo ""
echo "[1/5] Installing essential tools..."
bash "$SCRIPT_DIR/scripts/install_essentials.sh"

echo ""
echo "[2/5] Installing programming languages..."
bash "$SCRIPT_DIR/scripts/install_languages.sh"

echo ""
echo "[3/5] Installing code editors..."
bash "$SCRIPT_DIR/scripts/install_editors.sh"

echo ""
echo "[4/5] Installing Docker..."
bash "$SCRIPT_DIR/scripts/install_docker.sh"

echo ""
echo "[5/5] Configuring Git..."
bash "$SCRIPT_DIR/scripts/configure_git.sh"

# Install aliases
echo ""
echo "[*] Installing bash aliases..."
if [ -f "$SCRIPT_DIR/configs/bash_aliases" ]; then
    cp "$SCRIPT_DIR/configs/bash_aliases" ~/.bash_aliases
    echo "[+] Aliases installed to ~/.bash_aliases"
fi

echo ""
echo "============================================="
echo "  Setup complete!"
echo "  Please restart your terminal or run:"
echo "    source ~/.bashrc"
echo "============================================="
