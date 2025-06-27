
# Checklist / Roadmap

> ### ✅ Checklist Key
>
> - `[ ]` -> Not yet worked on
> - `[/]` -> Partially implemented, not functional
> - `[-]` -> Functionally implemented, changes pending/not yet complete
> - `[x]` -> Fully implemented
> - [?] -> Idea. Might implement someday. Might not.
>

## System

- Hyprland Keybindings
    - [ ] Keybinds for managing window groups. See the window group [Dispatchers](https://wiki.hypr.land/Configuring/Dispatchers/#list-of-dispatchers) for bindable actions.
    - [ ] "Game Mode"
      - [ ] Animations on/off toggle
      - [ ] Gaps & rounding on/off toggle
      - [ ] Waybar on/off toggle
    - [?] QWERTY-oriented layout?
      - 🤔 The keys for many bindings have semantic associations with their function. It might be that a significant portion of the keybindings could be considered layout-agnostic.

- [-] Hyprland Extended Ecosystem
    - [x] hyprpaper/wallpaper config
    - [x] hyprpolkitagent
    - [-] hyprlock
    - [-] hypridle
    - [-] hyprcursor

- [-] Networking
    - [-] firewalld
    - [-] bluetooth
    - [-] networkmanager + applet
    - [-] SSH

- [/] Notifications
    - [-] Notification daemon (currently mako)
    - [ ] Notification daemon configuration

- [-] Display Manager config + install (GDM/sddm/etc)

- [-] Waybar + config
  - [ ] notfication daemon integration
  - [ ] current workspace focus indicator

### User Experience

- [ ] Keybinding cheatsheet/shortcut menu. Similar/corresponding to the rofi implementation ML4W uses.
  - [ ] Able to parse hyprland bind flags. See [the hyprland wiki page](https://wiki.hypr.land/Configuring/Binds/#bind-flags) for details.




#### Hyprland Keymaps

- [ ] QWERTY (default) layout
  - [ ] Set of common standard keybinds. Include all functionality enabled in the enthium-style layout (but for normies).

- [-] Enthium Layout
Refine current layout. The current layout is made with the enthium KB layout in mind.
  - [-] Drop-in: Terminals. 3-4 special workspaces for simple on-demand screen space / managing terminal sprawl
  - [x] Drop-in: Dictionary/Thesaurus. Special workspace that opens a browser window immediately on the OneLook reverse dictionary page.
    - [?] Make this a locally-installed solution?
  - [?] Drop-in: Virtual Machine workspace. Special workspace(s) for 1-3 VMs that have VM passthru submappings automatically enabled when activated. Pressing the binding again within this special workspace will drop-out the VM and re-enable the primary keymap (disable passthru).


### Tools
- [-] Terminal Stuff
  - [ ] Script for selection of preferred terminal EMULATOR (default: kitty)
    - [x] kitty
    - [ ] alacritty
    - [ ] wezterm
    - [ ] ???
 - [ ] Script for selection of preferred SHELL (default: bash)
    - [x] bash
    - [ ] zsh
    - [ ] fish
    - [ ] xonsh?
    - [ ] ???
  - [ ] Script for interactive selection of preferred terminal EDITOR (nano, vi, vim, nvim, emacs, etc.)
    - [ ] Includes ability to change visudo default editor
  - [/] Script for selection of terminal multiplexer
    - [-] tmux
    - [/] zellij

- [-] File Manager
  - [ ] Script for selection of preferred file manager (default: thunar)
    - [x] Thunar
    - [ ] Dolphin
    - [ ] ???
  - [ ] Integrate default file manager with other system tools
    - [ ] "Open terminal here" works correctly with selected terminal emulator
    - [ ] ???

- [-] Screenshots (grim, slurp, and custom script)
  - [x] grim
  - [x] slurp
  - [-] Custom script (currently only facilitates area-select "crop" screenshots)
    - [/] Fullscreen screenshots to clipboard/file
    - [-] Area-select screensots to clipboard/file
  - [?] screenshot editor (like flameshot, etc.)
  
- [-] Clipboard
- [-] Audio and media control (pipewire, wireplumber, playerctl, etc)
- [ ] GTK theming
- [ ] Qt theming

- [/] Web Browsers
  - [-] Firefox
  - [ ] Qute Browser configuration + installation


- [/] Media Tools
  - [x] Media Player (vlc, etc)
  - [ ] Photo Editing (GIMP, etc)
  - [ ] Video Editing software (kdenlive, davinci resolve, etc)

- [x] Locally-hosted (on-device) speech-to-text implementation.
  - [x] To text input currently in-focus
  - [ ] To clipboard


- [ ] Emoji Selector

### Editors

- [-] Neovim / Vim / Vi
  - [ ] Optional basic `.vimrc` with best-practice configs compatible w/ both vim & nvim
  - [-] Neovim
    - [x] vanilla installation
    - Optional script for selection of popular nvim pre-configurations
      - [-] LazyVim
      - [ ] nvchad
      - [ ] AstroNvim
      - [ ] LunarVim
      - [ ] ???
  - [ ] Vim
  - [ ] Vi

- [ ] VSCode + its popular forks
  - [ ] code / vs codium
  - [?] Cursor
  - [ ] ???


## Misc


### Virtualization

- [x] KVM + QEMU + virt-manager
- [ ] Virtualbox


### Programming Languages

- [ ] NodeJS / npm installation script
  - [?] npm/pnpm/yarn/etc

- [ ] Programming Language installation script
  - [ ] Python
  - [ ] TypeScript
  - [ ] rust
  - [ ] c++
  - [ ] go
  - [ ] ???

- [ ] Misc. scripts / support for linux packaging types in a way that is more user-friendly
  - [x] Flatpak
  - [?] AppImage support that is more convenient.
    - Something like: Download AppImage -> set required perms -> put in "AppImage/" directory -> this would do the equivalent of adding a .desktop file and making the AppImage itself accessible from `$PATH`/terminal.

### Communications / Messengers

- [ ] Choice of matrix client
- [ ] Discord
- [ ] Signal

### Third Party Repositories / Distros

- [x] BlackArch optional script (Arch-based pentesting distro)
