#!/usr/bin/env bash

# ─────────────────────────────────────────
#  mythe list
# ─────────────────────────────────────────

# Collect installed tasks
INSTALLED=()
if [ -f "$INSTALLED_FILE" ]; then
  while IFS= read -r line; do
    [[ -n "$line" ]] && INSTALLED+=("$line")
  done < "$INSTALLED_FILE"
fi

# Collect all available tasks
AVAILABLE=()
for f in "$LOCAL_TASKS_DIR"/*.sh "$COMMUNITY_TASKS_DIR"/*.sh; do
  [ -f "$f" ] || continue
  AVAILABLE+=("$(basename "$f" .sh)")
done

INSTALLED_COUNT="${#INSTALLED[@]}"
AVAILABLE_COUNT="${#AVAILABLE[@]}"

# Column width
COL=28

# Header
printf "\n"
printf "┌%-${COL}s┬%-${COL}s┐\n" "$(printf '%.0s─' $(seq 1 $COL))" "$(printf '%.0s─' $(seq 1 $COL))"
printf "│ %-$((COL-2))s│ %-$((COL-2))s│\n" "Installed ($INSTALLED_COUNT)" "Available ($AVAILABLE_COUNT)"
printf "├%-${COL}s┼%-${COL}s┤\n" "$(printf '%.0s─' $(seq 1 $COL))" "$(printf '%.0s─' $(seq 1 $COL))"

# Rows
MAX=$(( INSTALLED_COUNT > AVAILABLE_COUNT ? INSTALLED_COUNT : AVAILABLE_COUNT ))

if [ "$MAX" -eq 0 ]; then
  printf "│ %-$((COL-2))s│ %-$((COL-2))s│\n" "(none)" "(none)"
else
  for (( i=0; i<MAX; i++ )); do
    LEFT=""
    RIGHT=""

    if [ $i -lt $INSTALLED_COUNT ]; then
      LEFT="✓ ${INSTALLED[$i]}"
    fi
    if [ $i -lt $AVAILABLE_COUNT ]; then
      RIGHT="${AVAILABLE[$i]}"
    fi

    printf "│ %-$((COL-2))s│ %-$((COL-2))s│\n" "$LEFT" "$RIGHT"
  done
fi

printf "└%-${COL}s┴%-${COL}s┘\n" "$(printf '%.0s─' $(seq 1 $COL))" "$(printf '%.0s─' $(seq 1 $COL))"
printf "\n"
