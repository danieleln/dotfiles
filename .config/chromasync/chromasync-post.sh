#!/usr/bin/bash

# Refreshes kitty theme
kitty @ set-colors --all --configured ~/.cache/chromasync/out/kitty-theme.conf

# Refreshes fish colors
# NOTE: make sure to include the option "allow_remote_control yes" in
#       your kitty.conf file
fish ~/.cache/chromasync/out/colors.fish
