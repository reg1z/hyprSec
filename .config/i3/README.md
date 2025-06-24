# Why are there i3 configurations here?

1. i3 is included as an option in the installer in the case one wants to use an X11-based environment with the other dotfiles present.

2. nvidia + hyprland can be annoying to deal with. X11 environments can serve as a temporary stand-in when certain desired features are unsupported in hyprland.

3. Virtual machines run decently enough in hyprland, but there can be quirks and difficulties with SPICE, automatic screen resizing, shared clipboards, etc.

4. When using these dotfiles WITHIN a guest VM, i3 tends to be more stable.

5. Alternate desktop environments / window managers can be handy in the case of accidental misconfigurations of the main environment.

