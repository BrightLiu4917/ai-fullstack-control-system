#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-}"

if [[ -z "$TARGET" ]]; then
  echo "Usage: $0 /path/to/project"
  exit 1
fi

if [[ ! -d "$TARGET" ]]; then
  echo "Target directory does not exist: $TARGET"
  exit 1
fi

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

copy_path() {
  local src="$1"
  local dst="$TARGET/$src"
  mkdir -p "$(dirname "$dst")"
  cp -R "$ROOT/$src" "$dst"
}

copy_path "AGENTS.md"
copy_path "CODEX_TASK_TEMPLATE.md"
copy_path "openspec"
copy_path "docs"
copy_path ".codex"
copy_path "scripts"
copy_path "templates"
copy_path "tools"

echo "Installed AI Fullstack Control System to: $TARGET"
