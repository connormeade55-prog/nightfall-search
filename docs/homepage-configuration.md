# Nightfall homepage configuration

Nightfall's hosted homepage is:

`https://nightfall-search.pages.dev/`

The Chromium-style `initial_preferences` JSON template at `packaging/linux/initial_preferences` requests that a newly created browser profile:

- use the Nightfall Pages URL as its homepage;
- show the Home button;
- open the Nightfall Pages URL on browser startup.

## Packaging integration

The Linux Debian packaging flow now includes the preference file:

- `scripts/build-nightfall-linux.sh` runs the upstream Brave Release packaging process and then calls the Nightfall package integration script.
- `scripts/package-nightfall-linux.sh` extracts the generated .deb, finds the installed Brave executable, places `initial_preferences` beside it, and rebuilds the .deb under `dist/`.
- The package integration script deliberately fails if it cannot find the browser executable rather than guessing an installation directory.

You can apply the preference file to an existing Brave Debian package with:

```bash
bash scripts/package-nightfall-linux.sh path/to/brave-browser.deb
```

## First-run behavior

Chromium-based browsers generally consume initial preferences when creating a profile for the first time. They are defaults, not a remote control: an existing user profile may keep its current preferences, and the user can change the homepage or startup pages later in browser settings.

## Current limitations

The pipeline currently produces a repackaged upstream Brave Debian package with Nightfall homepage defaults. The internal package identity, application name, icons, and browser UI are still Brave; full Nightfall branding has not been implemented. The build scripts have not yet been run in this environment, so there is no verified Nightfall installer yet.

## Hosting

Cloudflare Pages serves the homepage independently of the Chromebook. The browser needs an internet connection to load it. If the Pages site is unavailable, fallback behavior depends on the browser's normal new-tab behavior.
