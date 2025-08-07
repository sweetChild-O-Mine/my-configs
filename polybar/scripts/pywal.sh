#!/usr/bin/env bash
# Simple wallpaper theme generator without pywal

PFILE="$HOME/.config/polybar/material/colors.ini"
RFILE="$HOME/.config/polybar/material/scripts/rofi/colors.rasi"

if [[ "$1" ]]; then
    # Check if ImageMagick is installed
    if ! command -v convert &> /dev/null; then
        echo "ImageMagick is not installed. Installing..."
        sudo apt install imagemagick -y  # For Ubuntu/Debian
        # sudo pacman -S imagemagick      # For Arch
    fi
    
    echo "Extracting colors from wallpaper..."
    
    # Use imagemagick to get dominant colors
    COLORS=($(convert "$1" +dither -colors 8 -format "%c" histogram:info:- | sort -nr | head -6 | grep -o '#[0-9A-F]\{6\}'))
    
    # Set colors with fallbacks
    BG="${COLORS[0]:-#1e1e1e}"
    FG="#ffffff"
    FGA="#cccccc"
    MF="#ffffff"
    AC="${COLORS[1]:-#ff6b6b}"
    SC="${COLORS[2]:-#4ecdc4}"
    AL="${COLORS[3]:-#45b7d1}"
    FI="${BG}22"  # Semi-transparent background
    
    echo "Extracted colors:"
    echo "Background: $BG"
    echo "Primary: $AC"
    echo "Secondary: $SC"
    echo "Alternate: $AL"
    
    # Update polybar colors
    sed -i -e "s/background = #.*/background = $BG/g" $PFILE
    sed -i -e "s/filler = #.*/filler = $FI/g" $PFILE
    sed -i -e "s/foreground = #.*/foreground = $FG/g" $PFILE
    sed -i -e "s/foreground-alt = #.*/foreground-alt = $FGA/g" $PFILE
    sed -i -e "s/module-fg = #.*/module-fg = $MF/g" $PFILE
    sed -i -e "s/primary = #.*/primary = $AC/g" $PFILE
    sed -i -e "s/secondary = #.*/secondary = $SC/g" $PFILE
    sed -i -e "s/alternate = #.*/alternate = $AL/g" $PFILE
    
    # Update rofi colors
    cat > $RFILE <<- EOF
/* colors */

* {
  al:   #00000000;
  bg:   ${BG}FF;
  bga:  ${AC}33;
  bar:  ${MF}FF;
  fg:   ${FG}FF;
  ac:   ${AC}FF;
}
EOF
    
    echo "Colors extracted and applied!"
    pkill polybar && ~/.config/polybar/launch.sh --material
else
    echo "Usage: ./pywal.sh path/to/wallpaper.jpg"
    echo "Example: ./pywal.sh ~/Pictures/my-wallpaper.jpg"
fi