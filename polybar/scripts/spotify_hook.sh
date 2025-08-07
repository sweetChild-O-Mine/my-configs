#!/bin/bash

# Function to update play/pause icon
update_play_pause_icon() {
    PLAYER=$(playerctl --list-all | head -n1)
    
    if [ -n "$PLAYER" ]; then
        STATUS=$(playerctl --player="$PLAYER" status 2>/dev/null)
        
        if [ "$STATUS" = "Playing" ]; then
            # Send hook-1 (pause icon) - because we want to show pause when playing
            polybar-msg hook spotify-play-pause 2
        else
            # Send hook-0 (play icon) - because we want to show play when paused
            polybar-msg hook spotify-play-pause 1
        fi
    fi
}

# Update the icon
update_play_pause_icon