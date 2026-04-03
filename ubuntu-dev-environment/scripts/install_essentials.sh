#!/usr/bin/env bash
set -euo pipefail

echo "--- Installing Essential Tools ---"

sudo apt update

PACKAGES=(
    build-essential
    git
    curl
    wget
    unzip
    software-properties-common
    apt-transport-https
    ca-certificates
    gnupg
    lsb-release
    htop
    tree
    jq
    ripgrep
    fd-find
    tmux
    net-tools
    openssh-client
)

for pkg in "${PACKAGES[@]}"; do
    if dpkg -l "$pkg" > /dev/null 2>&1; then
        echo "  [OK] $pkg"
    else
        echo "  [*] Installing $pkg..."
        sudo apt install -y "$pkg"
    fi
done

echo "[+] Essential tools installed"
