# Build the Nightfall browser from source

Nightfall is planned as an independently branded desktop browser based on the open-source Brave/Chromium codebase. The browser engine is not stored in this repository. The upstream source checkout is created locally under `src/brave/` and is excluded from Git.

## Before starting

Brave's current Linux guide lists Git 2.41+, Python 3, and Node.js 24+ as prerequisites. A supported Linux build environment is also required. Chromium's source checkout can use tens of gigabytes of storage, and compiling can take hours and require substantial RAM.

A Chromebook's Linux container is not assumed to be powerful enough to compile the browser. A separate Linux build machine or CI runner is likely the practical first build host. ARM64 support will need its own build and device testing; an x86_64 build will not run on an ARM Chromebook.

## 1. Read the current upstream requirements

- [Brave Linux development environment](https://github.com/brave/brave-browser/wiki/Linux-Development-Environment)
- [Brave Core source and build instructions](https://github.com/brave/brave-core)
- [Brave Linux package instructions](https://github.com/brave/brave-browser/wiki/Linux-packages)
- [Chromium Linux build instructions](https://chromium.googlesource.com/chromium/src/+/main/docs/linux/build_instructions.md)

Upstream requirements and commands can change. Follow the current Brave guide if it differs from this document.

## 2. Clone the upstream source

From a local clone of this Nightfall Search repository, run:

```bash
bash scripts/bootstrap-brave.sh
```

The script checks for Git, Node.js, Python 3, and pnpm, then clones the official `brave-core` repository into `src/brave/`. It does not download Chromium or start a build.

You can also clone it manually:

```bash
mkdir -p src
git clone https://github.com/brave/brave-core.git src/brave
```

Do not commit the upstream checkout into the Nightfall Search repository.

## 3. Install and initialize upstream dependencies

Review the current Brave instructions first. From the Nightfall repository:

```bash
cd src/brave
pnpm install
pnpm run init
```

Initialization downloads Chromium and its dependencies. Expect a very large download and long setup time. Do not run this on a device without enough storage, memory, and a reliable connection.

On supported Debian/Ubuntu Linux systems, Brave's guide also documents a dependency-install step after initialization:

```bash
./src/build/install-build-deps.sh
```

Only run that command if the current upstream guide still recommends it for your Linux distribution.

## 4. Build and launch

After initialization and platform dependencies are installed, the upstream development commands are:

```bash
pnpm run build
pnpm start
```

For a release build:

```bash
pnpm run build Release
pnpm start Release
```

These commands build and launch upstream Brave. At this stage they do not yet produce a Nightfall-branded browser. Do not describe the result as Nightfall until Nightfall branding changes have been implemented and tested.

## 5. Nightfall customization plan

Keep Nightfall-specific work as a small, reviewable patch set rather than rewriting Chromium or copying the entire upstream tree into this repository.

1. Create original Nightfall name, icons, colors, and startup experience.
2. Identify supported upstream branding/configuration points.
3. Apply changes without removing upstream security updates or license notices.
4. Build and test a local development version.
5. Add reproducible x86_64 packaging.
6. Investigate ARM64 build and runtime support.
7. Test on real, supported Chromebook models before claiming compatibility.

Do not use Brave logos or imply that Nightfall is an official Brave product. Nightfall Search is independent and is not endorsed by Brave Software.

## Current status

This repository has a source-bootstrap script and build instructions. The script has not been run here, Chromium has not been downloaded, and no browser binary or installer has been built or tested yet.