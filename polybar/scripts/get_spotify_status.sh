#!/bin/bash

# Function to update play/pause icon
update_hooks() {
    PLAYER=$(playerctl --list-all | head -n1)
    
    if [ -n "$PLAYER" ]; then
        STATUS=$(playerctl --player="$PLAYER" status 2>/dev/null)
        
        if [ "$STATUS" = "Playing" ]; then
            polybar-msg hook spotify-play-pause 2 &>/dev/null
        else
            polybar-msg hook spotify-play-pause 1 &>/dev/null
        fi
    fi
}

# Check if any player is available
if ! playerctl --list-all &>/dev/null; then
    if [ "$1" == "--status" ]; then
        echo "Stopped"
    else
        echo "No player is running"
    fi
    exit 1
fi

# Use the default player (first available)
STATUS=$(playerctl status 2>/dev/null)

# If --status flag is used, just return the status
if [ "$1" == "--status" ]; then
    echo "$STATUS"
    exit 0
fi

# Update hooks based on status
update_hooks

case "$STATUS" in
    "Playing")
        playerctl metadata --format "{{ title }} - {{ artist }}" 2>/dev/null || echo "Playing"
        ;;
    "Paused")
        playerctl metadata --format "{{ title }} - {{ artist }}" 2>/dev/null || echo "Paused"
        ;;
    *)
        echo " "
        ;;
esac