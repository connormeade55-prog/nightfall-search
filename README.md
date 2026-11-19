# Nightfall Search

Nightfall Search is a planned, independently branded desktop browser project based on the open-source Brave Browser codebase, with Chromebook users as the primary audience.

> **Current status:** project scaffold only. This repository does not yet contain a compiled browser, a Brave source checkout, or a working installer. The first milestone is to confirm the target Chromebook's CPU architecture and choose a supported build environment.

## Planned features

- Brave's Chromium-based browser foundation.
- Brave Shields protections, subject to upstream configuration and licensing.
- Nightfall Search name, icon, startup page, and visual theme.
- Tabs, bookmarks, and private windows from the upstream browser.
- A Linux package and Chromebook installation guide, where the device supports it.

## Chromebook compatibility

ChromeOS can run Linux desktop applications through its Linux development environment (Crostini), but compatibility depends on the Chromebook model and CPU architecture. In the Linux Terminal, run:

```sh
uname -m
```

Common results:
- `x86_64`: Intel/AMD 64-bit.
- `aarch64`: ARM 64-bit.

A Linux package must match the device architecture. Some school- or work-managed Chromebooks may have Linux development disabled by an administrator.

## Development plan

1. Confirm Chromebook architecture and whether Linux apps are enabled.
2. Set up a reproducible Linux build environment for the matching architecture.
3. Track the Brave upstream source and implement Nightfall branding as a maintainable patch set.
4. Build, test, and sign a Linux package.
5. Document installation and update procedures for compatible Chromebooks.

See [Chromebook notes](docs/chromebook.md) and [upstream build notes](docs/build-from-source.md).

## Upstream project and trademarks

Nightfall Search is not affiliated with or endorsed by Brave Software. Brave and its logos are trademarks of their respective owners. This project intends to preserve required open-source notices and licenses and will use its own Nightfall branding. Review the upstream licenses and trademark requirements before distributing modified builds.

- Brave source: https://github.com/brave/brave-browser
- Brave Linux development guide: https://github.com/brave/brave-browser/wiki/Linux-Development-Environment
- Brave Linux packaging guide: https://github.com/brave/brave-browser/wiki/Linux-packages

## Privacy note

The project intends to retain Brave's privacy protections, but no browser can guarantee complete anonymity or prevent every form of tracking. Keep the browser and operating system updated, review site permissions, and avoid entering sensitive information on untrusted sites.
