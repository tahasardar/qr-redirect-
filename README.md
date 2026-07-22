# 🔗 Updatable QR Code — free forever, no services, no accounts

One QR code, printed once, that you can re-point to **any URL, anytime**,
by editing **one line** in this repo. Powered entirely by GitHub Pages (free).

## How it works

```
[Printed QR code]  →  your GitHub Pages URL  →  redirect.js says where to go
      never changes         never changes            YOU edit this anytime
```

The QR code doesn't contain your destination. It contains your permanent
GitHub Pages URL. When someone scans it, `index.html` instantly forwards
them to whatever URL is written in `redirect.js`. Change that line, push,
and the same printed QR now goes somewhere new.

If the destination is empty, scanners see a friendly "not linked yet" page.

## 1 · Put this on GitHub Pages (one-time setup, ~5 minutes)

**a. Create the repo on GitHub**

1. Go to <https://github.com/new>
2. Repository name: `qr-redirect` (or anything you like)
3. Keep it **Public** (required for free GitHub Pages)
4. Don't add a README/license (this folder already has files)
5. Click **Create repository**

**b. Push this folder to it** — run in this folder (`qr-redirect/`):

```bash
git remote add origin https://github.com/YOUR-USERNAME/qr-redirect.git
git branch -M main
git push -u origin main
```

**c. Enable GitHub Pages**

1. In your repo: **Settings → Pages** (left sidebar)
2. Under *Build and deployment* → Source: **Deploy from a branch**
3. Branch: **main**, folder: **/ (root)** → **Save**
4. Wait ~1 minute, refresh — GitHub shows your live URL:

```
https://YOUR-USERNAME.github.io/qr-redirect/
```

Open it in a browser. You should see the "isn't linked yet" page. 🎉

## 2 · Generate your permanent QR code (one-time)

```bash
./make-qr.sh https://YOUR-USERNAME.github.io/qr-redirect/
```

This creates, using the free open-source `qrcode` npm package:

- **`qr.png`** — 1024 px, high error-correction, print-ready
- **`qr.svg`** — vector, scales from sticker to billboard

No third-party QR service is involved, so the code **never expires**,
has no scan limits, and shows no ads. Print it anywhere.

## 3 · Change where the QR points (anytime, forever)

Open `redirect.js` and edit the one marked line:

```js
const DESTINATION = "https://wherever-you-want.com";   // <<< EDIT THIS LINE
```

Then push:

```bash
git commit -am "Point QR to new destination"
git push
```

Live in about a minute. **The printed QR never changes** — only the place
it forwards to. Set it back to `""` to "empty" the QR again.

## FAQ

- **Cost?** $0. GitHub Pages is free for public repos; the QR is generated
  locally by an open-source package.
- **Update speed?** GitHub Pages redeploys in ~30–60 s after a push.
- **Can I have multiple QR codes?** Yes — copy `index.html` + `redirect.js`
  into subfolders (`menu/`, `card/`…). Each subfolder gets its own URL
  (`…github.io/qr-redirect/menu/`), its own QR, its own editable line.
- **Editing without a computer?** Edit `redirect.js` right on github.com
  (or the GitHub mobile app) and commit — the pencil icon on the file page.
