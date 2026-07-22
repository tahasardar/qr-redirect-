#!/usr/bin/env bash
# ============================================================
#  Generate your permanent QR code (PNG + SVG)
# ============================================================
#  Usage:
#    ./make-qr.sh https://YOUR-USERNAME.github.io/YOUR-REPO/
#
#  Uses the free open-source "qrcode" npm package via npx —
#  nothing to install, no accounts, no expiry, no tracking.
#  Run it ONCE after your GitHub Pages URL is live. You never
#  need to run it again: the QR encodes your Pages URL, and
#  only the destination in redirect.js ever changes.
# ============================================================
set -e

# Use a private npm cache — sidesteps a permissions bug where the
# global ~/.npm cache contains root-owned files on some machines.
export npm_config_cache="${TMPDIR:-/tmp}/qr-npm-cache"

URL="$1"
if [ -z "$URL" ]; then
  echo "Usage: ./make-qr.sh <your-github-pages-url>"
  echo "Example: ./make-qr.sh https://taha.github.io/qr-redirect/"
  exit 1
fi

# -e H : highest error correction — QR still scans with up to
#        30% of it damaged/covered (good for print + logos)
# -q 4 : standard quiet-zone margin so scanners lock on easily
# -w   : pixel width for the PNG (1024 is crisp for print)
npx -y qrcode -e H -q 4 -w 1024 -o qr.png "$URL"
npx -y qrcode -e H -q 4 -t svg -o qr.svg "$URL"

echo ""
echo "✅ Done!"
echo "   qr.png — 1024px, ready for flyers, menus, stickers"
echo "   qr.svg — vector, scales to any size (billboards!)"
echo ""
echo "QR encodes: $URL"
echo "This never changes. Edit redirect.js to change where it goes."
