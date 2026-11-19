# Chromebook compatibility

Nightfall Search's goal is to work on the widest practical range of Chromebook models. The plan is to build and test separate packages for supported architectures, not assume every Chromebook has the same processor.

## Compatibility targets

| Chromebook hardware | Planned support |
| --- | --- |
| Intel 64-bit | x86_64 Linux build |
| AMD 64-bit | x86_64 Linux build |
| ARM 64-bit | aarch64 Linux build |
| 32-bit ARM / older devices | Best-effort research; may be unsupported by current Chromium/Brave requirements |

These are architecture targets, not a claim that builds already exist or have passed device testing. A matching CPU architecture alone does not guarantee compatibility.

## Other requirements and limitations

A Chromebook also needs a ChromeOS version and Linux environment that can run the browser's required libraries and graphics stack. Compatibility can vary with:
- ChromeOS version and Linux (Crostini) support.
- CPU features and architecture.
- Available RAM and storage.
- Graphics drivers and hardware acceleration.
- Whether the device is managed by a school or workplace.

Some older Chromebooks may not support a sufficiently recent Linux environment. Some managed devices have Linux development disabled by an administrator. If Linux is disabled, ask the device administrator; do not try to bypass management restrictions.

## 1. Check Linux availability

Open **Settings → About ChromeOS → Developers → Linux development environment** and check whether Linux can be set up.

Google's setup guide: https://support.google.com/chromebook/answer/9145439

## 2. Check CPU architecture

Open the Linux Terminal and run:

```sh
uname -m
```

Common results:
- `x86_64`: 64-bit Intel/AMD.
- `aarch64`: 64-bit ARM.
- `armv7l` or another `arm*` value: 32-bit ARM or another ARM variant; support is not guaranteed.

The package must match the device architecture. Do not install an x86_64 package on an ARM Chromebook or vice versa.

Google's architecture notes: https://developers.google.com/chromeos/app-development/develop/linux-on-chromeos-faq

## 3. Build and testing strategy

A full Chromium-based browser is too large to assume every Chromebook can compile locally. The project should use separate, reproducible build environments for x86_64 and ARM64, then test the resulting packages on real Chromebooks. A suitable remote Linux build machine or CI runner may be needed.

Before calling a device supported, test installation, startup, tabs, browsing, graphics, audio, downloads, suspend/resume, and updates on that device family.

**Current status:** no installer or architecture-specific browser package has been built or tested yet. The compatibility matrix above is the project target, not a guarantee of current support.
