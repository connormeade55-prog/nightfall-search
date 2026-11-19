#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="${ROOT}/src/brave"

for tool in git node python3 pnpm; do
  if ! command -v "$tool" >/dev/null 2>&1; then
    echo "Missing required tool: $tool" >&2
    exit 1
  fi
done

git_version="$(git --version | awk '{print $3}')"
node_version="$(node --version | sed 's/^v//')"
if [[ "$(printf '%s\n' 2.41.0 "$git_version" | sort -V | head -n1)" != "2.41.0" ]]; then
  echo "Git 2.41 or newer is required (found $git_version)." >&2; exit 1
fi
if [[ "$(printf '%s\n' 24.0.0 "$node_version" | sort -V | head -n1)" != "24.0.0" ]]; then
  echo "Node.js 24 or newer is required (found $node_version)." >&2; exit 1
fi

if [[ -e "$TARGET" ]]; then
  echo "Refusing to overwrite existing path: $TARGET" >&2
  exit 1
fi

mkdir -p "$(dirname "$TARGET")"
echo "Cloning official Brave Core source into $TARGET"
git clone https://github.com/brave/brave-core.git "$TARGET"

echo "Clone complete. Read docs/build-from-source.md before running pnpm install and pnpm run init."
echo "Initialization downloads Chromium source and can require tens of gigabytes of storage."