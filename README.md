# hyprSec dots
A set of (soon-to-be) buttery-smooth secure-by-default dotfiles for use with Hyprland on Arch Linux. The installation script is interactive, emphasizing the agency and consent of the end-user.

> ### ⚠️ **Notice**
> This configuration is a **Work-In-Progress** and designed for use with a **fresh** Arch installation. Though, it might also work with EndeavourOS.
>
> If you choose to daily-drive these dotfiles, keep in mind they are an active Work-In-Progress.

### 🤔 But why?
*Why make a new set of dotfiles when there are already so many [awesome, practical setups](https://wiki.hyprland.org/Getting-Started/Preconfigured-setups/)?*

**While maintaining simplicity**, the number one goal here is to create an easy-to-setup, easy-to-customize, intuitive Hyprland desktop experience with a *minimal attack surface **BY DEFAULT**.* Options to consent to "riskier" conveniences such as an AUR helper are provided. The idea is to have a hardened set of configurations with all the bells and whistles of most other pre-packaged Hyprland setups, allowing end-users to opt-in to more convenience and risk as they deem necessary.

Many pre-packaged setups have a few certain quirks or insecure defaults:

- Security is often sacrificed for aesthetics.
- Security is often sacrificed for convenience. *These don't need to be mutually exclusive.*
- Most utilize the **Arch User Repository (AUR)**, including an AUR helper and AUR-sourced packages by default. The AUR is not a stable trustworthy source of software packages. Packages are often abandoned, left to go out-of-date, or change hands between users.
- Some use symbolic links and GNU `stow` to install necessary configurations. If the user had planned on using `stow` or configuring their own links, this complicates things. This can make updating the dotfiles a pain.

Please note: I'm not saying most existing configs out there are inherently insecure. Most users will probably be fine. However, there are no options known to me that aim to provide a feature-rich experience and setup process with an emphasis on the user's consent and secure defaults.


### Goals

- Give the user a choice. With default selections, `install.sh` is intended to provide a functional Hyprland setup. Prompts should facilitate the installation of "riskier" packages (AUR helper, nvim distros, convenience, etc...) ONLY if the user consciously opts in.
- **ALL packages** in a **DEFAULT** installation will be sourced **EXCLUSIVELY** from the **official Arch repositories**.
- Choices are opt-out (`[N]o`) by default.
- Reputable packages should be preferred where possible.
- Functionality should be implemented with as few packages as possible.
- Minimal. Anything beyond standard desktop expectations should be opt-in.
- UWSM-managed.
- Default configuration uses no symbolic links. This makes it easier to make it your own (if you so choose).
- Bluetooth support is included, but *disabled* by default. (Inspired by the [philosophy of EndeavourOS](https://discovery.endeavouros.com/audio/bluetooth/2021/03/)).


## Feedback
I'd love to hear any and all criticism.


## ‍Credits:
- Thank you to Stephen Raabe and other contributors of the [MyLinuxForWork dotfiles](https://github.com/mylinuxforwork/dotfiles). This configuration is significantly inspired by ML4W!
- w8ste for their [tokyonight rofi theme](https://github.com/w8ste/Tokyonight-rofi-theme)
- phob1an for their [set of Reactionary Qt themes](https://www.opencode.net/phob1an/reactionary). Their SDDM theme is currently used in this config's sddm installation script.
- Joël K.for the [Future Cyan Hyprcursor Theme](https://gitlab.com/Pummelfisch/future-cyan-hyprcursor)
- fccapria for their [Tokyu Night Waybar theme](https://github.com/fccapria/myTokyo/tree/main/waybar)
