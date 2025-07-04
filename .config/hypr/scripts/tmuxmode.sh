#!/usr/bin/env sh
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 1 ]; then
  hyprctl --batch "\
    keyword animations:enabled 0;\
    keyword general:gaps_in 1;\
    keyword general:gaps_out 1;\
    keyword general:border_size 1;\
    keyword decoration:rounding 0; \
    keyword decoration:shadow:enabled 0;\
    keyword decoration:blur:enabled 0;\
    keyword decoration:active_opacity 1.0;\
    keyword decoration:inactive_opacity 1.0;\
    keyword decoration:fullscreen_opacity 1.0;\
    #keyword dim_special 1.0;\
    "
  exit
fi
hyprctl reload
