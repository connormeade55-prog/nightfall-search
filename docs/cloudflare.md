# Cloudflare Pages deployment

This repository includes a static project landing page in `public/`. Cloudflare Pages can host that website. It cannot run the native Brave-based browser or turn the browser source into a Chromebook app.

## Important: use Pages, not Workers deploy

The command `npx wrangler deploy` is for deploying a Worker. It is not the right command for this static Pages site and can fail with a missing Worker entry-point error.

For this project, use the Pages command:

```sh
npx wrangler pages deploy public --project-name nightfall-search
```

The Pages project named `nightfall-search` must exist before running that command.

## Deploy with Cloudflare Pages Git integration (recommended)

1. In the Cloudflare dashboard, open **Workers & Pages**.
2. Choose **Create application** → **Pages** → **Connect to Git**.
3. Select `connormeade55-prog/nightfall-search` and the `main` branch.
4. Use these build settings:
   - Framework preset: **None**
   - Build command: leave blank (there is no build step for this plain HTML site)
   - Build output directory: `public`
   - Root directory: leave as the repository root
5. Save and deploy. Pages Git integration builds and publishes the static output; do not add `npx wrangler deploy` as a custom deploy command.

## If your Cloudflare setup asks for a deploy command

Some Workers Builds configurations show a separate **Deploy command** field. If you are using that workflow for this Pages project, replace `npx wrangler deploy` with:

```sh
npx wrangler pages deploy public --project-name nightfall-search
```

Keep the build command blank for this static site. If the dashboard is creating a Worker rather than a Pages project, go back and create a **Pages** project instead.

## Deploy with Wrangler from a terminal

Authenticate with Cloudflare, create the Pages project once, then deploy:

```sh
npx wrangler pages project create nightfall-search
npx wrangler pages deploy public --project-name nightfall-search
```

The included `wrangler.toml` records the Pages output directory.

## What is and is not deployed

- **Deployed:** the static Nightfall Search project landing page.
- **Not deployed:** a browser engine, Chromebook installer, Linux package, update service, or browser download.
- **Next engineering work:** create reproducible x86_64 and aarch64 browser builds in CI, test those packages on supported Chromebook/Linux configurations, and publish verified release artifacts. Do not advertise a package as compatible until it has been tested.

Cloudflare Pages is a hosting service for the website, not a substitute for building and packaging the native browser.
