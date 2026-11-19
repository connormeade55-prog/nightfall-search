# Nightfall homepage configuration

Nightfall's hosted homepage is:

`https://nightfall-search.pages.dev/`

The repository includes a Chromium-style `initial_preferences` JSON template at `packaging/linux/initial_preferences`. It requests that a newly created browser profile:

- use the Nightfall Pages URL as its homepage;
- show the Home button;
- open the Nightfall Pages URL on browser startup.

## Important behavior

Chromium-based browsers generally consume initial preferences when creating a new profile for the first time. They are defaults, not a remote control: an existing user profile may keep its current preferences, and the user can change the homepage or startup pages later in browser settings.

The JSON file is only a template at this stage. The Nightfall packaging/build process has not yet been implemented to install it in the correct Brave distribution directory. Do not claim that an existing Nightfall browser binary already opens this page automatically; no Nightfall browser binary has been built or tested yet.

## Hosting

Cloudflare Pages serves the homepage independently of the Chromebook. The browser needs an internet connection to load it. If the Pages site is unavailable, the browser's normal new-tab or fallback behavior depends on the final browser integration.

The hosted page is a normal personal start page. It does not provide a remote Chromium engine or make the browser itself cloud-hosted.
