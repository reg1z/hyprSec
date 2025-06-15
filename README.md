# hyprsec dots

>
> ### ⚠️ **Notice**
> This configuration is a **Work-In-Progress** and designed for use with a **fresh** Arch installation. Though, it might also work with EndeavourOS.
>
> If you choose to daily-drive these dotfiles, keep in mind their development has been a personal learning exercise for me.

## Description

A set of secure-by-default dotfiles for use with Hyprland on Arch Linux. Included is an interactive installation script to enable/disable optional features. Agency and choice of the end-user is emphasized.


### 🤔 But why?
*Why make a new set of dotfiles when there are already so many [awesome, practical setups](https://wiki.hyprland.org/Getting-Started/Preconfigured-setups/)?*

**While maintaining simplicity**, the number one goal here is to create an easy-to-setup, easy-to-customize, intuitive Hyprland desktop experience with a *minimal attack surface **BY DEFAULT**.* Options to opt-in/install "riskier" conveniences such as an AUR helper are provided. The idea is to have a hardened set of configurations behaving just as smoothly as most other pre-packaged Hyprland setups, allowing end-users to opt-in to more convenience and risk as they deem necessary.

Please note: I'm not saying ALL existing configs out there are inherently insecure. It depends on your threat model. However, there are no options known to me that aim to provide a "feature-complete" Hyprland desktop experience with an emphasis on security.

Many popular pre-packaged setups have some quirks that have been irksome to me, plus a few (what I consider to be) insecure defaults:

- Security is often sacrificed for aesthetics.
- Security is often sacrificed for convenience. This is more forgiveable than the first point, but I believe its possible to attain a setup that is just as convenient using official packages to reduce overall risk.
- Most utilize the **Arch User Repository (AUR)** to some extent, including an AUR helper and AUR-sourced packages by DEFAULT, not giving the user an opportunity to opt-out. The AUR is not a stable trustworthy source of software packages. Packages often abandoned, left to go out-of-date, or change hands between users. It's a convenient option for most, but should remain opt-in only (an option is included in the installer).
- ML4W uses symbolic link/ GNU stow to implement large portions of its functionality/directory structure. If the end-user had planned on augmenting a pre-configured setup with their own symbolic links and configs, this can drastically complicate things.


### Goals

- Minimalist. Functionality beyond standard desktop expectations should be opt-in.
- Give the user a choice. With default selections, `install.sh` is intended to provide a basic functional Hyprland setup. However, installer prompts should facilitate the installation of "riskier" packages (AUR helper, convenience, bells and whistles, etc...) ONLY if the user consciously opts in.
- Aside from the optional choice of an AUR helper, **ALL packages** included in the default installation script are sourced from the official Arch repositories.
- In the installation script, optional selections are opt-out (`[N]o`) by default.
- Secure-by-default. Functionality should be implemented using reputable packages where possible. Functionality should be implemented with as few packages as possible.
- UWSM-managed.
- Default configuration uses no symbolic links. This gives end-users more agency to personally customize.
- Similar to the [philosophy of EndeavourOS](https://discovery.endeavouros.com/audio/bluetooth/2021/03/), Bluetooth support is included, but *disabled* by default.


## UWSM Quirks
Because this setup uses UWSM, you might want to check out the [systemd startup guide on the Hyprland wiki](https://wiki.hyprland.org/Useful-Utilities/Systemd-start/)

For example, here's an excerpt from that page on the importance of properly prefacing startup commands within your configs:

> The concept of a session managed by Systemd implies also running applications as units. Uwsm provides a helper to do it. Running applications as child processes inside compositor’s unit is discouraged.
>
> Prefix application startup commands with uwsm app --. It also supports launching Desktop Entries by IDs or paths. See man uwsm or uwsm app --help.
>
> Examples for autostart and bind entries:
>
> ```bash
> exec-once = uwsm app -- mycommand --arg1 --arg2
> bind = SUPER, E, exec, uwsm app -- pcmanfm-qt.desktop
> ```

## Feedback
I'd love to hear any criticisms you might have. What blindspots am I missing?

## ‍Credits:
- Thank you to Stephen Raabe and other contributors of the [MyLinuxForWork dotfiles](https://github.com/mylinuxforwork/dotfiles). This configuration has been significantly inspired by ML4W!
- w8ste for their [tokyonight rofi theme](https://github.com/w8ste/Tokyonight-rofi-theme)