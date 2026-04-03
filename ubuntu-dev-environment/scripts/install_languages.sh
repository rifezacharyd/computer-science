#!/usr/bin/env bash
set -euo pipefail

echo "--- Installing Programming Languages ---"

# --- Python via pyenv ---
echo ""
echo "[*] Python (via pyenv)..."
if command -v pyenv > /dev/null 2>&1; then
    echo "  [OK] pyenv already installed"
else
    # Install pyenv dependencies
    sudo apt install -y make libssl-dev zlib1g-dev libbz2-dev \
        libreadline-dev libsqlite3-dev llvm libncursesw5-dev \
        xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

    curl -fsSL https://pyenv.run | bash

    # Add to bashrc
    cat >> ~/.bashrc << 'PYENV'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
PYENV

    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"

    # Install latest Python 3
    LATEST_PY=$(pyenv install --list | grep -E "^\s+3\.[0-9]+\.[0-9]+$" | tail -1 | tr -d ' ')
    echo "  [*] Installing Python $LATEST_PY..."
    pyenv install "$LATEST_PY"
    pyenv global "$LATEST_PY"
    echo "  [+] Python $LATEST_PY installed and set as default"
fi

# --- Node.js via nvm ---
echo ""
echo "[*] Node.js (via nvm)..."
if command -v nvm > /dev/null 2>&1 || [ -d "$HOME/.nvm" ]; then
    echo "  [OK] nvm already installed"
else
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

    echo "  [*] Installing Node.js LTS..."
    nvm install --lts
    nvm use --lts
    echo "  [+] Node.js LTS installed"
fi

# --- Ruby via rbenv ---
echo ""
echo "[*] Ruby (via rbenv)..."
if command -v rbenv > /dev/null 2>&1; then
    echo "  [OK] rbenv already installed"
else
    sudo apt install -y autoconf patch rustc libgdbm-dev \
        libncurses5-dev libyaml-dev libgmp-dev 2>/dev/null || true

    curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash

    cat >> ~/.bashrc << 'RBENV'

# rbenv
eval "$(~/.rbenv/bin/rbenv init - bash)"
RBENV

    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"

    LATEST_RUBY=$(rbenv install -l 2>/dev/null | grep -E "^\s+[0-9]+\.[0-9]+\.[0-9]+$" | tail -1 | tr -d ' ')
    if [ -n "$LATEST_RUBY" ]; then
        echo "  [*] Installing Ruby $LATEST_RUBY..."
        rbenv install "$LATEST_RUBY"
        rbenv global "$LATEST_RUBY"
        echo "  [+] Ruby $LATEST_RUBY installed"
    fi
fi

echo "[+] Programming languages installed"
