#!/usr/bin/env bash

# ─────────────────────────────────────────
#  mythe add <name>
# ─────────────────────────────────────────

TASK_NAME="$1"

if [ -z "$TASK_NAME" ]; then
  echo "❌ Please provide a task name. Example: mythe add \"my-script\""
  exit 1
fi

TASK_FILE="$LOCAL_TASKS_DIR/$TASK_NAME.sh"

if [ -f "$TASK_FILE" ]; then
  echo "⚠️  Task '$TASK_NAME' already exists at: $TASK_FILE"
  exit 1
fi

# Create a task file with a template
cat > "$TASK_FILE" << TEMPLATE
#!/usr/bin/env bash

# ─────────────────────────────────────────
#  Task: $TASK_NAME
#  Description: (fill in)
# ─────────────────────────────────────────

echo "▶ Running $TASK_NAME..."

# Write your code here:

TEMPLATE

chmod +x "$TASK_FILE"

# Register as installed
echo "$TASK_NAME" >> "$INSTALLED_FILE"

echo "✅ Task '$TASK_NAME' created at:"
echo "   $TASK_FILE"
echo ""
echo "   Open the file and write your script!"
