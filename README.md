# My i3 + Polybar Rice :)

Beautiful, automated i3 window manager setup with dynamic theming.

## Features (they say...)

- **Auto-changing wallpapers** every 10 minutes
- **Dynamic color themes** extracted from wallpapers
- **Battery monitoring** with smart alerts
- **Beautiful polybar** with borders and transparency
- **Rofi integration** with matching themes
- **20+ color schemes** built-in



## Installation

```bash
git clone https://github.com/yourusername/dotfiles.git
cd dotfiles
chmod +x install.sh
./install.sh
```

## Dependencies

- i3-wm
- polybar 
- rofi
- feh
- imagemagick
- dunst

## Key Features

### Auto Wallpaper + Theme Sync
- Wallpapers from `~/Pictures/aesthetic-wallpapers/`
- Colors automatically extracted and applied
- Polybar and rofi themes update automatically

### Battery Protection
- 20% low battery warning
- 10% critical alert with sound
- 5% emergency auto-suspend

### Manual Controls
- `$mod+Shift+w` - Change wallpaper + theme
- `$mod+Shift+p` - Reload polybar

## Customization

Edit `~/.config/polybar/material/colors.ini` for manual themes.

## Credits

Based on Aditya Shakya's polybar themes with custom enhancements.
