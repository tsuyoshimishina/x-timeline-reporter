#!/bin/bash
# Sync SKILL.md to the OpenClaw skills directory.
#
# OpenClaw rejects symlinks in the skills directory (see openclaw/openclaw@c275932).
# This script copies the file instead. Run after editing SKILL.md to deploy changes.
#
# Usage:
#   ./sync-skill.sh          # Sync the skill
#   ./sync-skill.sh status   # Check for differences (no copy)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILL_NAME="x-timeline-reporter"
SRC="$SCRIPT_DIR/SKILL.md"
DEST_DIR="$HOME/.openclaw/workspace/skills/$SKILL_NAME"
DEST="$DEST_DIR/SKILL.md"

status_only=false
if [[ "${1:-}" == "status" ]]; then
  status_only=true
fi

if [[ ! -f "$SRC" ]]; then
  echo "ERROR: Source not found: $SRC"
  exit 1
fi

# Create destination directory if missing
if [[ ! -d "$DEST_DIR" ]]; then
  if $status_only; then
    echo "NEW: $SKILL_NAME (directory not created)"
    exit 0
  fi
  mkdir -p "$DEST_DIR"
fi

# Replace symlink with a regular copy
if [[ -L "$DEST" ]]; then
  if $status_only; then
    echo "LINK: $SKILL_NAME (symlink needs conversion to copy)"
    exit 0
  fi
  rm "$DEST"
  cp "$SRC" "$DEST"
  echo "CONVERTED: $SKILL_NAME (symlink -> copy)"
  exit 0
fi

# Diff check
if [[ -f "$DEST" ]] && diff -q "$SRC" "$DEST" > /dev/null 2>&1; then
  echo "OK: $SKILL_NAME (up to date)"
else
  if $status_only; then
    if [[ -f "$DEST" ]]; then
      echo "DIFF: $SKILL_NAME (has changes)"
    else
      echo "NEW: $SKILL_NAME (not yet copied)"
    fi
  else
    cp "$SRC" "$DEST"
    echo "SYNC: $SKILL_NAME"
  fi
fi
