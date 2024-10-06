#!/usr/bin/bash
CACHE_DIR="$HOME/.cache/chromasync/out"

# Refreshes kitty theme
# NOTE: make sure to include the option "allow_remote_control yes" in
#       your kitty.conf file
kitty @ set-colors --all --configured "$CACHE_DIR/chromasync-kitty.conf"

# Refreshes fish colors
fish "$CACHE_DIR/chromasync-fish.fish"
