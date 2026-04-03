#!/usr/bin/env bash
set -euo pipefail

# Terminal Commands Practice Exercises
# Run this script and follow the prompts to practice commands.

PRACTICE_DIR=$(mktemp -d)
trap 'rm -rf "$PRACTICE_DIR"' EXIT

echo "========================================="
echo "  Terminal Commands Practice"
echo "  Working directory: $PRACTICE_DIR"
echo "========================================="

cd "$PRACTICE_DIR"

# Setup practice files
mkdir -p project/{src,tests,docs}
echo "Hello World" > project/src/main.py
echo "import os" >> project/src/main.py
echo "print('hello')" >> project/src/main.py
echo "Test file" > project/tests/test_main.py
echo "# Documentation" > project/docs/readme.md
echo "Secret key: abc123" > project/.env
echo "Log entry 1" > project/app.log
echo "Error: something failed" >> project/app.log
echo "Log entry 2" >> project/app.log

echo ""
echo "--- Exercise 1: Navigation ---"
echo "Practice files have been created in: $PRACTICE_DIR/project/"
echo ""
echo "Try these commands:"
echo "  ls -la project/"
echo "  find project/ -name '*.py'"
echo "  find project/ -type f"
echo ""
read -rp "Press Enter to continue..."

echo ""
echo "--- Exercise 2: Text Processing ---"
echo ""
echo "Try these commands:"
echo "  cat project/src/main.py"
echo "  grep -r 'hello' project/"
echo "  grep -rn 'Error' project/"
echo "  awk '{print NR, \$0}' project/app.log"
echo ""
read -rp "Press Enter to continue..."

echo ""
echo "--- Exercise 3: File Operations ---"
echo ""
echo "Try these commands:"
echo "  cp project/src/main.py project/src/main_backup.py"
echo "  mkdir -p project/archive"
echo "  mv project/app.log project/archive/"
echo "  ls -la project/archive/"
echo ""
read -rp "Press Enter to continue..."

echo ""
echo "--- Exercise 4: Permissions ---"
echo ""
echo "Try these commands:"
echo "  ls -la project/src/main.py"
echo "  chmod +x project/src/main.py"
echo "  ls -la project/src/main.py"
echo ""
read -rp "Press Enter to continue..."

echo ""
echo "--- Exercise 5: System Info ---"
echo ""
echo "Try these commands:"
echo "  du -sh project/*"
echo "  df -h ."
echo "  uname -a"
echo ""
read -rp "Press Enter to finish..."

echo ""
echo "========================================="
echo "  Practice complete! Cleaning up..."
echo "========================================="
