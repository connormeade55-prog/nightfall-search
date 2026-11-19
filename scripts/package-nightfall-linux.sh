#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INPUT="${1:-}"
if [[ -z "$INPUT" || ! -f "$INPUT" ]]; then
  echo "Usage: $0 path/to/upstream-brave-package.deb" >&2
  exit 2
fi
for tool in dpkg-deb find; do
  command -v "$tool" >/dev/null 2>&1 || { echo "Missing required tool: $tool" >&2; exit 1; }
done

INPUT="$(realpath "$INPUT")"
VERSION="$(dpkg-deb --field "$INPUT" Version)"
ARCH="$(dpkg-deb --field "$INPUT" Architecture)"
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT
mkdir -p "$ROOT/dist"

dpkg-deb --extract "$INPUT" "$WORK/root"
BROWSER_BIN="$(find "$WORK/root" -type f -name brave -perm /111 -print -quit)"
if [[ -z "$BROWSER_BIN" ]]; then
  echo "Could not locate the Brave executable inside the package; refusing to guess the install path." >&2
  exit 1
fi

BROWSER_DIR="$(dirname "$BROWSER_BIN")"
install -m 0644 "$ROOT/packaging/linux/initial_preferences" "$BROWSER_DIR/initial_preferences"

OUTPUT="$ROOT/dist/nightfall-search-brave-base_${VERSION}_${ARCH}.deb"
dpkg-deb --build --root-owner-group "$WORK/root" "$OUTPUT"
echo "Created package with Nightfall first-run preferences:"
echo "$OUTPUT"
echo "Note: the upstream package identity and browser UI are still Brave until Nightfall branding is implemented."
