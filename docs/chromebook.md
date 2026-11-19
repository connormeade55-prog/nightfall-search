# Chromebook compatibility

Nightfall Search is planned as a Linux desktop browser package for compatible Chromebooks, rather than a Chrome extension or a website pretending to be a full browser.

## 1. Check Linux availability

On the Chromebook, open **Settings → About ChromeOS → Developers → Linux development environment** and check whether Linux can be set up. On managed school or work devices, an administrator may disable this feature. Do not attempt to bypass device management.

Google's setup guide: https://support.google.com/chromebook/answer/9145439

## 2. Check CPU architecture

Open the Linux Terminal and run:

```sh
uname -m
```

- `x86_64`: 64-bit Intel/AMD.
- `aarch64`: 64-bit ARM.
- `armv7l` or another `arm*` value: 32-bit ARM or another ARM variant.

The build and package must target the same architecture. Do not install an amd64 package on an ARM Chromebook or vice versa.

Google's architecture notes: https://developers.google.com/chromeos/app-development/develop/linux-on-chromeos-faq

## 3. Build-host reality

Building a complete Chromium-based browser is a large development task. Brave's upstream Linux instructions require a supported Linux environment and a substantial set of build dependencies. A Chromebook's Linux container may not have enough memory, storage, or CPU capacity to compile the full browser comfortably. A suitable Linux build machine or CI runner may be needed; the resulting package can then be tested on a compatible Chromebook.

This repository does not yet provide a tested Chromebook installer. Do not treat the project as installable until a matching package has been built and tested.
