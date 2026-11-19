# Build the Nightfall browser from source

Nightfall is planned as an independently branded desktop browser based on the open-source Brave/Chromium codebase. The browser engine is not stored in this repository. The upstream source checkout is created locally under `src/brave/` and is excluded from Git.

## Before starting

Brave's current Linux guide lists Git 2.41+, Python 3, and Node.js 24+ as prerequisites. The build also requires pnpm, a supported Linux environment, Debian package tools (`dpkg-deb`), substantial free storage, and plenty of RAM. Chromium's source checkout can use tens of gigabytes of storage, and compiling can take hours.

A Chromebook's Linux container is not assumed to be powerful enough to compile the browser. A separate Linux build machine is likely the practical first build host. ARM64 support requires a separate target build and device testing; an x86_64 build will not run on an ARM Chromebook.

## 1. Read the current upstream requirements

- [Brave Linux development environment](https://github.com/brave/brave-browser/wiki/Linux-Development-Environment)
- [Brave Core source and build instructions](https://github.com/brave/brave-core)
- [Brave Linux package instructions](https://github.com/brave/brave-browser/wiki/Linux-packages)
- [Chromium Linux build instructions](https://chromium.googlesource.com/chromium/src/+/main/docs/linux/build_instructions.md)

Upstream requirements and commands can change. Follow the current Brave guide if it differs from this document.

## 2. Build and package

From a local clone of this Nightfall Search repository, run:

```bash
bash scripts/build-nightfall-linux.sh
```

The script performs these steps:

1. Checks for Git, Node.js, Python 3, pnpm, and `dpkg-deb`.
2. Clones Brave Core into `src/brave/` if it is not already present.
3. Installs Brave Core's JavaScript dependencies with `pnpm install`.
4. Runs `pnpm run init`, which downloads Chromium and its dependencies.
5. Runs Brave's documented Linux Release packaging command: `pnpm run create_dist Release`.
6. Finds the generated Debian package and calls `scripts/package-nightfall-linux.sh` to insert the Nightfall `initial_preferences` file beside the installed browser executable.
7. Writes the repackaged Debian package under `dist/`.

Initialization is a very large download. Do not run this on a device without enough storage, memory, and a reliable connection. Run as a normal user, not root, as the upstream guide warns that initialization may fail when run as root.

## 3. Package homepage preferences separately

If you already have an upstream Brave Debian package, you can apply the Nightfall startup defaults without repeating the full browser build:

```bash
bash scripts/package-nightfall-linux.sh path/to/brave-browser.deb
```

The script extracts the package, locates the actual executable instead of assuming an install directory, installs `packaging/linux/initial_preferences` beside it, and rebuilds a Debian package under `dist/`. It stops if it cannot find the executable. The package's internal Debian package name and browser UI remain upstream Brave at this stage.

Chromium-based browsers generally read initial preferences when creating a profile for the first time. These are defaults, not remote controls: existing profiles may retain their settings, and users can change the homepage or startup behavior later.

## 4. Current branding and build status

The current pipeline builds the upstream Brave Release package and integrates the Nightfall homepage defaults. It does **not** yet change all Brave product names, icons, dialogs, or other browser UI to Nightfall. That requires a separately maintained and reviewed branding patch set against the upstream source.

The scripts have been committed but have not been executed in this environment. Chromium has not been downloaded here, and no package has been built or tested. Do not treat the existence of the scripts as proof of a successful build.

## 5. Chromebook compatibility

The initial pipeline targets the Linux package produced by the upstream build. x86_64 and ARM64 need separate build environments and outputs. Test on physical Chromebooks before claiming compatibility. Linux app support, device architecture, graphics, RAM, storage, and device-management policy all affect whether a package can run.

Do not try to bypass a device administrator's restrictions. If Linux development is disabled on a managed Chromebook, ask its administrator about approved development options.
