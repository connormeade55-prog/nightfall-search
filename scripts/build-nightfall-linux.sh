#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BRAVE="$ROOT/src/brave"
OUT="$BRAVE/src/out/Release"

for tool in git node python3 pnpm; do
  command -v "$tool" >/dev/null 2>&1 || { echo "Missing required tool: $tool" >&2; exit 1; }
done
command -v dpkg-deb >/dev/null 2>&1 || { echo "dpkg-deb is required to package the Linux build." >&2; exit 1; }

if [[ ! -d "$BRAVE/.git" ]]; then
  "$ROOT/scripts/bootstrap-brave.sh"
fi

cd "$BRAVE"
echo "Installing Brave Core JavaScript dependencies..."
pnpm install
echo "Initializing Chromium and Brave dependencies (large download; can take a long time)..."
pnpm run init
echo "Building and packaging the upstream Linux Release..."
pnpm run create_dist Release

PACKAGE="$(find "$OUT" -maxdepth 1 -type f -name '*.deb' -printf '%T@ %p\n' | sort -nr | head -n1 | cut -d' ' -f2-)"
if [[ -z "$PACKAGE" || ! -f "$PACKAGE" ]]; then
  echo "No .deb package found in $OUT. Check the upstream build output and current Brave packaging instructions." >&2
  exit 1
fi

"$ROOT/scripts/package-nightfall-linux.sh" "$PACKAGE"
