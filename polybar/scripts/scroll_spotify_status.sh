#!/bin/bash

# First make sure get_spotify_status.sh supports --status flag
SCRIPT_DIR="$(dirname "$0")"

# see man zscroll for documentation of the following parameters
zscroll -l 30 \
        --delay 0.1 \
        --scroll-padding "  " \
        --match-command "$SCRIPT_DIR/get_spotify_status.sh --status" \
        --match-text "Playing" "--scroll 1" \
        --match-text "Paused" "--scroll 0" \
        --update-check true "$SCRIPT_DIR/get_spotify_status.sh" &

wait