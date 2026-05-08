#!/usr/bin/env bash

# ─────────────────────────────────────────
#  mythe run <naam>
# ─────────────────────────────────────────

TASK_NAME="$1"

if [ -z "$TASK_NAME" ]; then
  echo "❌ Please provide a task name. Example: mythe run \"backup-home\""
  exit 1
fi

# Check if task is installed
if ! grep -qx "$TASK_NAME" "$INSTALLED_FILE" 2>/dev/null; then
  echo "❌ '$TASK_NAME' is not installed."
  echo "   Install it first with: mythe install \"$TASK_NAME\""
  exit 1
fi

# Find the script file
TASK_FILE=""
if [ -f "$LOCAL_TASKS_DIR/$TASK_NAME.sh" ]; then
  TASK_FILE="$LOCAL_TASKS_DIR/$TASK_NAME.sh"
elif [ -f "$COMMUNITY_TASKS_DIR/$TASK_NAME.sh" ]; then
  TASK_FILE="$COMMUNITY_TASKS_DIR/$TASK_NAME.sh"
fi

if [ -z "$TASK_FILE" ]; then
  echo "❌ Script file for '$TASK_NAME' not found."
  exit 1
fi

echo "▶ Running: $TASK_NAME"
echo "──────────────────────────────"
bash "$TASK_FILE" "${@:2}"
