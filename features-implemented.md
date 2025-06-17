
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

- [-] Hyprland Ecosystem
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

### Editors

- [-] Neovim
  - [x] vanilla installation
  - Optional script for selection of popular nvim pre-configurations
    - [-] LazyVim
    - [ ] nvchad
    - [ ] AstroNvim
    - [ ] LunarVim
    - [ ] ???

- [ ] VSCode + its popular works
  - [ ] code / vs codium
  - [?] Cursor
  - [ ] ???
