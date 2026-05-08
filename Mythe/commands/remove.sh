#!/usr/bin/env bash

# ─────────────────────────────────────────
#  mythe remove <name>
# ─────────────────────────────────────────

TASK_NAME="$1"

if [ -z "$TASK_NAME" ]; then
  echo "❌ Please provide a task name. Example: mythe remove \"backup-home\""
  exit 1
fi

if ! grep -qx "$TASK_NAME" "$INSTALLED_FILE" 2>/dev/null; then
  echo "❌ '$TASK_NAME' is not installed."
  exit 1
fi

# Remove from installed list
grep -vx "$TASK_NAME" "$INSTALLED_FILE" > "$INSTALLED_FILE.tmp"
mv "$INSTALLED_FILE.tmp" "$INSTALLED_FILE"

echo "🗑  '$TASK_NAME' removed."
