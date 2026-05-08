#!/usr/bin/env bash

# ─────────────────────────────────────────
#  mythe install <naam>
# ─────────────────────────────────────────

TASK_NAME="$1"

if [ -z "$TASK_NAME" ]; then
  echo "❌ Please provide a task name. Example: mythe install \"backup-home\""
  exit 1
fi

# Check if already installed
if grep -qx "$TASK_NAME" "$INSTALLED_FILE" 2>/dev/null; then
  echo "✓ '$TASK_NAME' is already installed."
  exit 0
fi

echo "🔍 Searching for '$TASK_NAME'..."

# Check local tasks first
if [ -f "$LOCAL_TASKS_DIR/$TASK_NAME.sh" ]; then
  echo "$TASK_NAME" >> "$INSTALLED_FILE"
  echo "✅ '$TASK_NAME' installed (local)."
  exit 0
fi

# Check community tasks
if [ -f "$COMMUNITY_TASKS_DIR/$TASK_NAME.sh" ]; then
  echo "$TASK_NAME" >> "$INSTALLED_FILE"
  echo "✅ '$TASK_NAME' installed (community)."
  exit 0
fi

# Try downloading from community repo
if [ -n "$COMMUNITY_REPO_URL" ]; then
  DEST="$COMMUNITY_TASKS_DIR/$TASK_NAME.sh"
  if curl -sf "$COMMUNITY_REPO_URL/tasks/$TASK_NAME.sh" -o "$DEST" 2>/dev/null; then
    chmod +x "$DEST"
    echo "$TASK_NAME" >> "$INSTALLED_FILE"
    echo "✅ '$TASK_NAME' downloaded and installed."
    exit 0
  fi
fi

echo "❌ Task '$TASK_NAME' not found."
echo "   Tip: use 'mythe add' to add your own task."
exit 1
