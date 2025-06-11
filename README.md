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

**While maintaining simplicity**, the number one goal here is to create an easy-to-setup, intuitive Hyprland desktop experience with a *minimal attack surface **BY DEFAULT**.* Options to opt-in/install "riskier" conveniences such as an AUR helper are provided. The idea is to have a hardened set of configurations behaving just as smoothly as most other pre-packaged Hyprland setups, allowing end-users to opt-in to more convenience and risk as they deem necessary.

Please note that I'm not saying that existing pre-configured setups are inherently insecure. It all depends on one's own threat model. However, for the more security-conscious, there are no convenient options that do a reliable job of minimizing bloat.

Popular pre-packaged setups have their own quirks a few (what I consider to be) insecure defaults:
- They utilize the **Arch User Repository (AUR)** to some extent, including an AUR helper and AUR-sourced packages as part of the default installation. The AUR is not a stable trustworthy source from which to obtain daily-driven software with peace of mind. An AUR helper should be opt-in only (an option is included in the installer).
- Inclusion of redundant or unnecessary packages.
- Utilize symbolic links in some form


## Details

### Goals

- Aside from the optional choice of an AUR helper, **ALL packages** included in the default installation script are sourced from the official Arch repositories.
- In the installation script, opt-in `[y]es/[N]o` choices are `[N]o` by default.
- Secure-by-default. Default functionality should use reputable packages. Functionality should be implemented with as few packages as possible.
- Minimalist. Functionality beyond standard expectations should be opt-in.
- UWSM-managed.
- Uses no symbolic links. This gives the end-user more agency over directory structure.
- Bluetooth is disabled by default. Must be manually enabled by user.

### Project Directory Topology

- The installation script is `install.sh`
- Most dotfiles are stored under `.config/`
    - hyprland dotfiles are stored under `.config/hypr/`
    - waybar dotfiles are stored under `.config/waybar/`
- Asset files (images, etc.) are stored under `assets/`

### UWSM Quirks
For these dotfiles, you might want to check out the [systemd startup guide on the Hyprland wiki](https://wiki.hyprland.org/Useful-Utilities/Systemd-start/)

For example, here's an excerpt from the docs on the importance of properly prefacing startup commands within your own custom configurations:

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

## ‍Credits:
- Thank you to Stephen Raabe and other contributors of the ML4W dotfiles. The hyprland config files for this setup use a similar topology to ML4W.
