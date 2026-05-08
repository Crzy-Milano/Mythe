#!/usr/bin/env bash

# ─────────────────────────────────────────
#  mythe help
# ─────────────────────────────────────────

cat << 'EOF'

  __  __       _   _          
 |  \/  |_   _| |_| |__   ___ 
 | |\/| | | | | __| '_ \ / _ \
 | |  | | |_| | |_| | | |  __/
 |_|  |_|\__, |\__|_| |_|\___|
         |___/                 

  Mythe - Terminal Task Manager v0.1.0

USAGE:
  mythe <command> [options]

COMMANDS:
  install <name>     Install a task from the community
  run <name>         Run an installed task
  list               Show all tasks (installed + available)
  add <name>         Add your own local task
  remove <name>      Remove an installed task
  version            Show the current version
  help               Show this overview

EXAMPLES:
  mythe install "backup-home"
  mythe run "backup-home"
  mythe list
  mythe add "my-script"

EOF
