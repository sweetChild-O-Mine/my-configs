#!/bin/sh

# Set initial random wallpaper and extract theme
WALLPAPER=$(find /home/aryan/Pictures/aesthetic-wallpapers -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | shuf -n 1)
feh --bg-fill "$WALLPAPER"
~/.config/polybar/material/scripts/pywal.sh "$WALLPAPER"

# Loop indefinitely to change wallpaper and theme every 10 minutes
while true; do
    sleep 600
    WALLPAPER=$(find /home/aryan/Pictures/aesthetic-wallpapers -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | shuf -n 1)
    feh --bg-fill "$WALLPAPER"
    ~/.config/polybar/material/scripts/pywal.sh "$WALLPAPER"
done