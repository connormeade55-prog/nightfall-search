# Nightfall Search

Nightfall Search is a planned, independently branded desktop browser project based on the open-source Brave Browser codebase. Its primary goal is broad compatibility across Chromebook models.

> **Current status:** project scaffold plus a static landing page. This repository does not yet contain a compiled browser, a Brave source checkout, a working installer, or verified multi-architecture builds.

## Website and Cloudflare

A static project landing page is available in `public/` and is configured for Cloudflare Pages using `wrangler.toml`. See [Cloudflare deployment instructions](docs/cloudflare.md).

Cloudflare Pages hosts the website only. It does not run the native browser engine or produce Chromebook installers.

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
4. Build, test, and sign each architecture's Linux package.
5. Test on physical Chromebooks from multiple device families and document known limitations.
6. Publish packages only after the matching builds pass testing.

See [Chromebook notes](docs/chromebook.md), [upstream build notes](docs/build-from-source.md), and [Cloudflare deployment instructions](docs/cloudflare.md).

## Upstream project and trademarks

Nightfall Search is not affiliated with or endorsed by Brave Software. Brave and its logos are trademarks of their respective owners. This project intends to preserve required open-source notices and licenses and will use its own Nightfall branding. Review the upstream licenses and trademark requirements before distributing modified builds.

- Brave source: https://github.com/brave/brave-browser
- Brave Linux development guide: https://github.com/brave/brave-browser/wiki/Linux-Development-Environment
- Brave Linux packaging guide: https://github.com/brave/brave-browser/wiki/Linux-packages

## Privacy note

The project intends to retain Brave's privacy protections, but no browser can guarantee complete anonymity or prevent every form of tracking. Keep the browser and operating system updated, review site permissions, and avoid entering sensitive information on untrusted sites.
