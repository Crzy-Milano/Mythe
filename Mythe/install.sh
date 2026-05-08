#!/usr/bin/env bash

# ─────────────────────────────────────────
#  Mythe - Installation Script
#  Adds 'mythe' to your Terminal
# ─────────────────────────────────────────

MYTHE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MYTHE_BIN="$MYTHE_DIR/mythe"
INSTALL_PATH="/usr/local/bin/mythe"

echo ""
echo "  Installing Mythe..."
echo ""

# Make executable
chmod +x "$MYTHE_BIN"

# Create symlink in /usr/local/bin
if [ -L "$INSTALL_PATH" ] || [ -f "$INSTALL_PATH" ]; then
  echo "⚠️  Mythe is already installed at $INSTALL_PATH"
  echo "   Overwrite? (y/n)"
  read -r ANSWER
  [[ "$ANSWER" != "y" ]] && echo "Cancelled." && exit 0
fi

ln -sf "$MYTHE_BIN" "$INSTALL_PATH"

if [ $? -eq 0 ]; then
  echo "✅ Mythe is installed!"
  echo ""
  echo "   Try it out:"
  echo "   mythe help"
  echo ""
else
  echo "❌ Installation failed. Try with sudo:"
  echo "   sudo bash install.sh"
fi
