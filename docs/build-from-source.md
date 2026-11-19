# Building from upstream Brave

This project will maintain Nightfall-specific changes separately from upstream Brave rather than copying the entire upstream source tree into this repository.

## Upstream references

- Source repository: https://github.com/brave/brave-browser
- Current Linux development guide: https://github.com/brave/brave-browser/wiki/Linux-Development-Environment
- Linux package guide: https://github.com/brave/brave-browser/wiki/Linux-packages

Always follow the current upstream instructions. Dependencies and build commands can change.

## Important constraints

- Check the current upstream system requirements before starting.
- Confirm the build host architecture and intended Chromebook package architecture.
- Expect a large source checkout, significant disk use, and a long compile.
- Do not build as root unless upstream documentation explicitly requires a particular privileged step.
- Preserve upstream license notices and required attributions.
- Do not reuse Brave logos or imply official Brave endorsement. Nightfall Search needs its own identity and appropriate trademark review.

## Planned build pipeline

1. Pin a reviewed Brave upstream revision.
2. Apply Nightfall branding and configuration patches.
3. Build using the documented upstream Linux process.
4. Package for a supported target architecture.
5. Test startup, updates, tabs, private windows, and Shields behavior on the target Chromebook.
6. Publish checksums and release notes with each tested package.

No automated build or installer is configured in this repository yet.
