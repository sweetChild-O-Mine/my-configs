#!/usr/bin/env bash

PDIR="$HOME/.config/polybar/material"
RDIR="$PDIR/scripts/rofi"
LAUNCH="polybar-msg cmd restart"

# Update rofi colors function
update_rofi() {
    cat > $RDIR/colors.rasi <<- EOF
/* colors */

* {
  al:   #00000000;
  bg:   ${BG};
  bga:  ${AC}33;
  bar:  ${MF};
  fg:   ${FG};
  ac:   ${AC};
}
EOF
}

# Apply colors function
apply_colors() {
    sed -i -e "s/background = #.*/background = $BG/g" $PDIR/colors.ini
    sed -i -e "s/filler = #.*/filler = $FI/g" $PDIR/colors.ini
    sed -i -e "s/foreground = #.*/foreground = $FG/g" $PDIR/colors.ini
    sed -i -e "s/foreground-alt = #.*/foreground-alt = $FGA/g" $PDIR/colors.ini
    sed -i -e "s/module-fg = #.*/module-fg = $MF/g" $PDIR/colors.ini
    sed -i -e "s/primary = #.*/primary = $AC/g" $PDIR/colors.ini
    sed -i -e "s/secondary = #.*/secondary = $SC/g" $PDIR/colors.ini
    sed -i -e "s/alternate = #.*/alternate = $AL/g" $PDIR/colors.ini
    
    update_rofi
    $LAUNCH
}

if  [[ $1 = "--catppuccin" ]]; then
    BG="#1e1e2e"; FI="#313244"; FG="#cdd6f4"; FGA="#a6adc8"; MF="#f9e2af"
    AC="#cba6f7"; SC="#f38ba8"; AL="#94e2d5"
    apply_colors
elif  [[ $1 = "--tokyo-night" ]]; then
    BG="#1a1b26"; FI="#24283b"; FG="#c0caf5"; FGA="#9aa5ce"; MF="#bb9af7"
    AC="#7aa2f7"; SC="#f7768e"; AL="#9ece6a"
    apply_colors
elif  [[ $1 = "--nord" ]]; then
    BG="#2e3440"; FI="#3b4252"; FG="#d8dee9"; FGA="#e5e9f0"; MF="#eceff4"
    AC="#88c0d0"; SC="#81a1c1"; AL="#8fbcbb"
    apply_colors
elif  [[ $1 = "--gruvbox" ]]; then
    BG="#282828"; FI="#3c3836"; FG="#ebdbb2"; FGA="#d5c4a1"; MF="#fbf1c7"
    AC="#fabd2f"; SC="#fe8019"; AL="#b8bb26"
    apply_colors
elif  [[ $1 = "--dracula" ]]; then
    BG="#282a36"; FI="#44475a"; FG="#f8f8f2"; FGA="#6272a4"; MF="#50fa7b"
    AC="#bd93f9"; SC="#ff79c6"; AL="#8be9fd"
    apply_colors
elif  [[ $1 = "--onedark" ]]; then
    BG="#1e222a"; FI="#282c34"; FG="#abb2bf"; FGA="#5c6370"; MF="#e06c75"
    AC="#61afef"; SC="#c678dd"; AL="#98c379"
    apply_colors
elif  [[ $1 = "--rosepine" ]]; then
    BG="#191724"; FI="#1f1d2e"; FG="#e0def4"; FGA="#908caa"; MF="#f6c177"
    AC="#c4a7e7"; SC="#ebbcba"; AL="#9ccfd8"
    apply_colors
elif  [[ $1 = "--ayu" ]]; then
    BG="#0a0e14"; FI="#1c2328"; FG="#b3b1ad"; FGA="#4d5566"; MF="#e6b450"
    AC="#39bae6"; SC="#ff8f40"; AL="#7fd962"
    apply_colors
elif  [[ $1 = "--solarized" ]]; then
    BG="#002b36"; FI="#073642"; FG="#839496"; FGA="#586e75"; MF="#93a1a1"
    AC="#268bd2"; SC="#dc322f"; AL="#859900"
    apply_colors
elif  [[ $1 = "--cyberpunk" ]]; then
    BG="#0d1117"; FI="#161b22"; FG="#c9d1d9"; FGA="#8b949e"; MF="#00d4aa"
    AC="#ff006e"; SC="#fb5607"; AL="#8338ec"
    apply_colors
elif  [[ $1 = "--sunset" ]]; then
    # Your existing sunset theme
    BG="#0a0e14"; FI="#1c2328"; FG="#e8d5ff"; FGA="#b8a1d4"; MF="#FFFFFF"
    AC="#d4a7ff"; SC="#ff7eb6"; AL="#7dd3fc"
    apply_colors

## TRANSPARENT THEMES FOR LIGHT WALLPAPERS (Dark Text)
elif  [[ $1 = "--trans-dark-elegant" ]]; then
    BG="#00000000"; FI="#22000000"; FG="#1a1a1a"; FGA="#2d2d2d"
    MF="#000000"; AC="#6366f1"; SC="#8b5cf6"; AL="#10b981"
    apply_colors
elif  [[ $1 = "--trans-dark-minimal" ]]; then
    BG="#00000000"; FI="#11000000"; FG="#0f172a"; FGA="#334155"
    MF="#000000"; AC="#0ea5e9"; SC="#06b6d4"; AL="#22c55e"
    apply_colors
elif  [[ $1 = "--trans-dark-warm" ]]; then
    BG="#00000000"; FI="#22000000"; FG="#292524"; FGA="#44403c"
    MF="#1c1917"; AC="#f59e0b"; SC="#ef4444"; AL="#10b981"
    apply_colors
elif  [[ $1 = "--trans-dark-purple" ]]; then
    BG="#00000000"; FI="#22000000"; FG="#1e1b4b"; FGA="#3730a3"
    MF="#312e81"; AC="#8b5cf6"; SC="#a855f7"; AL="#c084fc"
    apply_colors
elif  [[ $1 = "--trans-dark-ocean" ]]; then
    BG="#00000000"; FI="#22000000"; FG="#0c4a6e"; FGA="#075985"
    MF="#0369a1"; AC="#0ea5e9"; SC="#06b6d4"; AL="#67e8f9"
    apply_colors

## TRANSPARENT THEMES FOR DARK WALLPAPERS (Light Text)
elif  [[ $1 = "--trans-light-neon" ]]; then
    BG="#00000000"; FI="#22ffffff"; FG="#f8fafc"; FGA="#e2e8f0"
    MF="#ffffff"; AC="#00d4aa"; SC="#ff006e"; AL="#8338ec"
    apply_colors
elif  [[ $1 = "--trans-light-cyber" ]]; then
    BG="#00000000"; FI="#22ffffff"; FG="#fafafa"; FGA="#d4d4d8"
    MF="#ffffff"; AC="#06ffa5"; SC="#ff0080"; AL="#0080ff"
    apply_colors
elif  [[ $1 = "--trans-light-sunset" ]]; then
    BG="#00000000"; FI="#22ffffff"; FG="#fef3c7"; FGA="#fde68a"
    MF="#ffffff"; AC="#f59e0b"; SC="#f97316"; AL="#fb923c"
    apply_colors
elif  [[ $1 = "--trans-light-ice" ]]; then
    BG="#00000000"; FI="#22ffffff"; FG="#f0f9ff"; FGA="#e0f2fe"
    MF="#ffffff"; AC="#0ea5e9"; SC="#06b6d4"; AL="#67e8f9"
    apply_colors
elif  [[ $1 = "--trans-light-rose" ]]; then
    BG="#00000000"; FI="#22ffffff"; FG="#fdf2f8"; FGA="#fce7f3"
    MF="#ffffff"; AC="#ec4899"; SC="#f43f5e"; AL="#fb7185"
    apply_colors

## SEMI-TRANSPARENT THEMES (Best of Both Worlds)
elif  [[ $1 = "--trans-glass-dark" ]]; then
    BG="#22000000"; FI="#44000000"; FG="#f8fafc"; FGA="#e2e8f0"
    MF="#ffffff"; AC="#6366f1"; SC="#8b5cf6"; AL="#06b6d4"
    apply_colors
elif  [[ $1 = "--trans-glass-light" ]]; then
    BG="#22ffffff"; FI="#44ffffff"; FG="#1e293b"; FGA="#334155"
    MF="#000000"; AC="#6366f1"; SC="#8b5cf6"; AL="#06b6d4"
    apply_colors
elif  [[ $1 = "--trans-smoke-purple" ]]; then
    BG="#33000000"; FI="#55000000"; FG="#e879f9"; FGA="#c084fc"
    MF="#f3e8ff"; AC="#a855f7"; SC="#8b5cf6"; AL="#c084fc"
    apply_colors
elif  [[ $1 = "--trans-smoke-blue" ]]; then
    BG="#33000000"; FI="#55000000"; FG="#60a5fa"; FGA="#93c5fd"
    MF="#dbeafe"; AC="#3b82f6"; SC="#2563eb"; AL="#60a5fa"
    apply_colors
elif  [[ $1 = "--trans-smoke-green" ]]; then
    BG="#33000000"; FI="#55000000"; FG="#4ade80"; FGA="#86efac"
    MF="#dcfce7"; AC="#22c55e"; SC="#16a34a"; AL="#4ade80"
    apply_colors

## GRADIENT-STYLE TRANSPARENT THEMES
elif  [[ $1 = "--trans-aurora" ]]; then
    BG="#00000000"; FI="#22000000"; FG="#e0e7ff"; FGA="#c7d2fe"
    MF="#ffffff"; AC="#7c3aed"; SC="#a855f7"; AL="#06ffa5"
    apply_colors
elif  [[ $1 = "--trans-galaxy" ]]; then
    BG="#00000000"; FI="#22000000"; FG="#f1f5f9"; FGA="#e2e8f0"
    MF="#ffffff"; AC="#6366f1"; SC="#ec4899"; AL="#06b6d4"
    apply_colors
elif  [[ $1 = "--trans-forest" ]]; then
    BG="#00000000"; FI="#22000000"; FG="#f0fdf4"; FGA="#dcfce7"
    MF="#ffffff"; AC="#22c55e"; SC="#16a34a"; AL="#4ade80"
    apply_colors
elif  [[ $1 = "--trans-fire" ]]; then
    BG="#00000000"; FI="#22000000"; FG="#fef2f2"; FGA="#fecaca"
    MF="#ffffff"; AC="#ef4444"; SC="#f97316"; AL="#facc15"
    apply_colors
elif  [[ $1 = "--trans-ocean" ]]; then
    BG="#00000000"; FI="#22000000"; FG="#f0f9ff"; FGA="#e0f2fe"
    MF="#ffffff"; AC="#0ea5e9"; SC="#06b6d4"; AL="#67e8f9"
    apply_colors
fi