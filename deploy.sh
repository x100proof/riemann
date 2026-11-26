#!/usr/bin/env bash
# Copy the site into a web server's document root. No build step; the app is one HTML file.
# Usage: ./deploy.sh DOCROOT   (or set DEST=DOCROOT)
set -euo pipefail
SRC="$(cd "$(dirname "$0")" && pwd)"
DEST="${1:-${DEST:-}}"
if [ -z "$DEST" ]; then
  echo "usage: $0 DOCROOT" >&2
  exit 1
fi
mkdir -p "$DEST"
install -m 0644 "$SRC/index.html" "$DEST/index.html"
echo "deployed to $DEST"
