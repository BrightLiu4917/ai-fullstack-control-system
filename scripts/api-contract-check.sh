#!/usr/bin/env bash
set -euo pipefail

FILE="${1:-}"
if [[ -z "$FILE" || ! -f "$FILE" ]]; then
  echo "Usage: $0 <api-contract-file>"
  exit 1
fi

fail=0

require_heading() {
  local heading="$1"
  if ! grep -Eq "^##[[:space:]]+$heading" "$FILE"; then
    echo "[FAIL] Missing section: $heading"
    fail=1
  fi
}

require_heading "Endpoint"
require_heading "Request"
require_heading "Response"
require_heading "Compatibility"

if [[ "$fail" -eq 1 ]]; then
  echo "API contract check failed."
  exit 2
fi

echo "API contract check passed."
