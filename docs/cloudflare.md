# Cloudflare Pages deployment

This repository includes a static project landing page in `public/`. Cloudflare Pages can host that website. It cannot run the native Brave-based browser or turn the browser source into a Chromebook app.

## Deploy with the Cloudflare dashboard

1. Push this repository to GitHub.
2. In the Cloudflare dashboard, open **Workers & Pages** and choose **Create application** → **Pages** → **Connect to Git**.
3. Select `connormeade55-prog/nightfall-search` and the `main` branch.
4. Use these build settings:
   - Framework preset: **None**
   - Build command: leave blank
   - Build output directory: `public`
   - Root directory: leave as the repository root
5. Start the deployment. Cloudflare should publish the static files from `public/`.

## Deploy with Wrangler

Install Wrangler in a local development environment, authenticate with Cloudflare, then run:

```sh
npx wrangler pages project create nightfall-search
npx wrangler pages deploy public --project-name nightfall-search
```

The included `wrangler.toml` records the Pages output directory. Dashboard Git integration is the easiest option for automatic deployments on pushes to `main`.

## What is and is not deployed

- **Deployed:** the static Nightfall Search project landing page.
- **Not deployed:** a browser engine, Chromebook installer, Linux package, update service, or browser download.
- **Next engineering work:** create reproducible x86_64 and aarch64 browser builds in CI, test those packages on supported Chromebook/Linux configurations, and publish verified release artifacts. Do not advertise a package as compatible until it has been tested.

Cloudflare Pages is a hosting service for the website, not a substitute for building and packaging the native browser.
