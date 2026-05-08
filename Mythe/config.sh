#!/usr/bin/env bash

# ─────────────────────────────────────────
#  Mythe - Configuration
# ─────────────────────────────────────────

MYTHE_VERSION="0.1.0"
MYTHE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Directories
LOCAL_TASKS_DIR="$MYTHE_DIR/tasks/local"
COMMUNITY_TASKS_DIR="$MYTHE_DIR/tasks/community"
INSTALLED_FILE="$MYTHE_DIR/.installed"

# Community repository (connect to GitHub later)
COMMUNITY_REPO_URL="https://raw.githubusercontent.com/your-username/mythe-tasks/main"

# Make sure required files exist
touch "$INSTALLED_FILE"
