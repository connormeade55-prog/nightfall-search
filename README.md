# Nightfall Search

Nightfall Search is a planned, independently branded desktop browser project based on the open-source Brave Browser codebase. Its primary goal is broad compatibility across Chromebook models.

> **Current status:** static landing page, source-bootstrap script, and development documentation. No Nightfall-branded browser binary or installer has been built or tested yet.

## Website and Cloudflare

The hosted Nightfall start page is **https://nightfall-search.pages.dev/**. It includes a search-engine selector, editable quick links, and a light/dark theme toggle. Quick links and preferences are stored locally in the browser. It is a web start page, not the native browser interface or a proxy. Cloudflare Pages is configured using `wrangler.toml`; see [Cloudflare deployment instructions](docs/cloudflare.md).

Cloudflare Pages hosts the website only. It does not run the native browser engine or produce Chromebook installers.

The browser's planned first-run homepage and startup page are configured in [the Linux initial preferences template](packaging/linux/initial_preferences). See [homepage configuration notes](docs/homepage-configuration.md). This is a configuration template; it is not yet wired into a completed Nightfall installer.

## Start browser development

Read [Build the Nightfall browser from source](docs/build-from-source.md). The bootstrap script clones Brave Core into the ignored local path `src/brave/`; it does not download Chromium or compile the browser automatically.

```bash
bash scripts/bootstrap-brave.sh
```

A full Chromium-based build needs a supported Linux build host, current upstream dependencies, substantial storage, RAM, and build time. Building directly on a Chromebook may not be practical.

## Compatibility goal

The project will target the widest practical range of Chromebooks by producing separate builds for supported CPU architectures:

- **x86_64 (Intel/AMD 64-bit):** primary Linux package target.
- **aarch64 (ARM 64-bit):** separate ARM64 Linux package target.
- **32-bit ARM and older devices:** best-effort only; current Chromium/Brave requirements may not support them.

There cannot be a guarantee that one installer will work on literally every Chromebook. Compatibility also depends on the ChromeOS version, Linux (Crostini) availability, CPU features, graphics stack, memory/storage, and device-management policy. Some school/work-managed devices disable Linux apps, and some older Chromebooks cannot run a sufficiently recent Linux environment.

See [Chromebook compatibility details](docs/chromebook.md) for how to check a device.

## Planned browser features

- Brave's Chromium-based browser foundation.
- Brave Shields protections, subject to upstream configuration and licensing.
- Nightfall Search name, icon, startup page, and visual theme.
- Tabs, bookmarks, and private windows from the upstream browser.
- Separate Linux packages for supported Chromebook architectures.
- Installation and troubleshooting instructions for compatible Chromebooks.

## Development plan

1. Establish the supported ChromeOS/Linux baseline and architecture matrix.
2. Set up reproducible x86_64 and ARM64 build environments.
3. Track Brave upstream and implement Nightfall branding as a maintainable patch set.
4. Wire the Nightfall first-run preferences into the Linux packaging process.
5. Build, test, and sign each architecture's Linux package.
6. Test on physical Chromebooks from multiple device families and document known limitations.
7. Publish packages only after the matching builds pass testing.

See [Chromebook notes](docs/chromebook.md), [upstream build notes](docs/build-from-source.md), [homepage configuration](docs/homepage-configuration.md), and [Cloudflare deployment instructions](docs/cloudflare.md).

## Upstream project and trademarks

Nightfall Search is not affiliated with or endorsed by Brave Software. Brave and its logos are trademarks of their respective owners. This project intends to preserve required open-source notices and licenses and will use its own Nightfall branding. Review the upstream licenses and trademark requirements before distributing modified builds.

- Brave source: https://github.com/brave/brave-browser
- Brave Linux development guide: https://github.com/brave/brave-browser/wiki/Linux-Development-Environment
- Brave Linux packaging guide: https://github.com/brave/brave-browser/wiki/Linux-packages

## Privacy note

The project intends to retain Brave's privacy protections, but no browser can guarantee complete anonymity or prevent every form of tracking. Keep the browser and operating system updated, review site permissions, and avoid entering sensitive information on untrusted sites.
