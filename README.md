# hyprSec dots

> ### ⚠️ **Notice**
> This configuration is a **Work-In-Progress** and designed for use with a **fresh** Arch installation. Though, it might also work with EndeavourOS.
>
> If you choose to daily-drive these dotfiles, keep in mind they are an active Work-In-Progress.

## Description
A set of secure-by-default dotfiles for use with Hyprland on Arch Linux. Included is an interactive installation script to enable/disable optional features. Agency and consent of the end-user is emphasized.


### 🤔 But why?
*Why make a new set of dotfiles when there are already so many [awesome, practical setups](https://wiki.hyprland.org/Getting-Started/Preconfigured-setups/)?*

**While maintaining simplicity**, the number one goal here is to create an easy-to-setup, easy-to-customize, intuitive Hyprland desktop experience with a *minimal attack surface **BY DEFAULT**.* Options to opt-in/install "riskier" conveniences such as an AUR helper are provided. The idea is to have a hardened set of configurations behaving just as smoothly as most other pre-packaged Hyprland setups, allowing end-users to opt-in to more convenience and risk as they deem necessary.

Please note: I'm not saying ALL existing configs out there are inherently insecure. However, there are no options known to me that aim to provide a "feature-complete" experience and setup process with an emphasis on the user's consent (user agency) and secure defaults.

Many popular pre-packaged setups have some quirks that've been irksome to me, plus a few (what I consider to be) insecure defaults:

- Security is often sacrificed for aesthetics.
- Security is often sacrificed for convenience. These aren't always mutually exclusive.
- Most utilize the **Arch User Repository (AUR)**, including an AUR helper and AUR-sourced packages by default. The AUR is not a stable trustworthy source of software packages. Packages are often abandoned, left to go out-of-date, or change hands between users.
- ML4W uses symbolic links/GNU stow to install most of its configuration. If the user had planned on using their own links or lines to the configs, this complicates things. At times it makes updating the dotfiles a pain.


### Goals

- Minimalist. Functionality beyond standard desktop expectations should be opt-in.
- Give the user a choice. With default selections, `install.sh` is intended to provide a basic functional Hyprland setup. However, installer prompts should facilitate the installation of "riskier" packages (AUR helper, convenience, bells and whistles, etc...) ONLY if the user consciously opts in.
- Aside from the OPTIONAL choice of certain external packages (AUR helpers, packages cloned from GitHub, etc), **ALL packages** included in the DEFAULT installation script are sourced EXCLUSIVELY from the official Arch repositories.
- In the installation script choices are opt-out (`[N]o`) by default.
- Secure-by-default. Functionality should be implemented using reputable packages where possible. Functionality should be implemented with as few packages as possible.
- UWSM-managed.
- Default configuration uses no symbolic links. This makes it easier to make it your own (if you so choose).
- Bluetooth support is included, but *disabled* by default. (Inspired by the [philosophy of EndeavourOS](https://discovery.endeavouros.com/audio/bluetooth/2021/03/)).


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
I'd love to hear any and all criticism.

## ‍Credits:
- Thank you to Stephen Raabe and other contributors of the [MyLinuxForWork dotfiles](https://github.com/mylinuxforwork/dotfiles). This configuration has been significantly inspired by ML4W!
- w8ste for their [tokyonight rofi theme](https://github.com/w8ste/Tokyonight-rofi-theme)
- phob1an for their [set of Reactionary Qt themes](https://www.opencode.net/phob1an/reactionary). Their SDDM theme is currently used in this config's sddm installation script.
- Joël K.for the [Future Cyan Hyprcursor Theme](https://gitlab.com/Pummelfisch/future-cyan-hyprcursor)
- fccapria for their [Tokyu Night Waybar theme](https://github.com/fccapria/myTokyo/tree/main/waybar)
