#!/usr/bin/env bash
set -euo pipefail

echo "--- Installing Docker ---"

if command -v docker > /dev/null 2>&1; then
    echo "[OK] Docker already installed ($(docker --version))"
else
    # Remove old versions
    sudo apt remove -y docker docker-engine docker.io containerd runc 2>/dev/null || true

    # Add Docker's official GPG key
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg

    # Add repository
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    # Add current user to docker group (avoids needing sudo)
    sudo usermod -aG docker "$USER"

    echo "[+] Docker installed"
    echo "    NOTE: Log out and back in for group changes to take effect"
fi

# Verify
echo ""
echo "[*] Docker version:"
docker --version 2>/dev/null || echo "  (restart required)"
echo "[*] Docker Compose version:"
docker compose version 2>/dev/null || echo "  (restart required)"
