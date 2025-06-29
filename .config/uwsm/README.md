# UWSM Quirks
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
