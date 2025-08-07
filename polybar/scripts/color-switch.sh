#!/usr/bin/env bash

SDIR="$HOME/.config/polybar/material/scripts"

# Launch Rofi
MENU="$(rofi -no-config -no-lazy-grab -sep "|" -dmenu -i -p '' \
-theme $SDIR/rofi/styles.rasi \
<<< "♥ trans-dark-elegant|♥ trans-dark-minimal|♥ trans-dark-warm|♥ trans-dark-purple|♥ trans-dark-ocean|♥ trans-light-neon|♥ trans-light-cyber|♥ trans-light-sunset|♥ trans-light-ice|♥ trans-light-rose|♥ trans-glass-dark|♥ trans-glass-light|♥ trans-smoke-purple|♥ trans-smoke-blue|♥ trans-smoke-green|♥ trans-aurora|♥ trans-galaxy|♥ trans-forest|♥ trans-fire|♥ trans-ocean|♥ catppuccin|♥ tokyo-night|♥ nord|♥ gruvbox|♥ dracula|♥ onedark|♥ rosepine|♥ ayu|♥ solarized|♥ cyberpunk|♥ sunset|♥ amber|♥ blue|♥ blue-gray|♥ brown|♥ cyan|♥ deep-orange|\
♥ deep-purple|♥ green|♥ gray|♥ indigo|♥ blue-light|♥ green-light|\
♥ lime|♥ orange|♥ pink|♥ purple|♥ red|♥ teal|♥ yellow|♥ amber-dark|\
♥ blue-dark|♥ blue-gray-dark|♥ brown-dark|♥ cyan-dark|♥ deep-orange-dark|\
♥ deep-purple-dark|♥ green-dark|♥ gray-dark|♥ indigo-dark|♥ blue-light-dark|\
♥ green-light-dark|♥ lime-dark|♥ orange-dark|♥ pink-dark|♥ purple-dark|♥ red-dark|♥ teal-dark|♥ yellow-dark|")"
            case "$MENU" in
                ## TRANSPARENT THEMES
                *trans-dark-elegant) "$SDIR"/colors-custom.sh --trans-dark-elegant ;;
                *trans-dark-minimal) "$SDIR"/colors-custom.sh --trans-dark-minimal ;;
                *trans-dark-warm) "$SDIR"/colors-custom.sh --trans-dark-warm ;;
                *trans-dark-purple) "$SDIR"/colors-custom.sh --trans-dark-purple ;;
                *trans-dark-ocean) "$SDIR"/colors-custom.sh --trans-dark-ocean ;;
                *trans-light-neon) "$SDIR"/colors-custom.sh --trans-light-neon ;;
                *trans-light-cyber) "$SDIR"/colors-custom.sh --trans-light-cyber ;;
                *trans-light-sunset) "$SDIR"/colors-custom.sh --trans-light-sunset ;;
                *trans-light-ice) "$SDIR"/colors-custom.sh --trans-light-ice ;;
                *trans-light-rose) "$SDIR"/colors-custom.sh --trans-light-rose ;;
                *trans-glass-dark) "$SDIR"/colors-custom.sh --trans-glass-dark ;;
                *trans-glass-light) "$SDIR"/colors-custom.sh --trans-glass-light ;;
                *trans-smoke-purple) "$SDIR"/colors-custom.sh --trans-smoke-purple ;;
                *trans-smoke-blue) "$SDIR"/colors-custom.sh --trans-smoke-blue ;;
                *trans-smoke-green) "$SDIR"/colors-custom.sh --trans-smoke-green ;;
                *trans-aurora) "$SDIR"/colors-custom.sh --trans-aurora ;;
                *trans-galaxy) "$SDIR"/colors-custom.sh --trans-galaxy ;;
                *trans-forest) "$SDIR"/colors-custom.sh --trans-forest ;;
                *trans-fire) "$SDIR"/colors-custom.sh --trans-fire ;;
                *trans-ocean) "$SDIR"/colors-custom.sh --trans-ocean ;;

                ## NEW AESTHETIC THEMES
                *catppuccin) "$SDIR"/colors-custom.sh --catppuccin ;;
                *tokyo-night) "$SDIR"/colors-custom.sh --tokyo-night ;;
                *nord) "$SDIR"/colors-custom.sh --nord ;;
                *gruvbox) "$SDIR"/colors-custom.sh --gruvbox ;;
                *dracula) "$SDIR"/colors-custom.sh --dracula ;;
                *onedark) "$SDIR"/colors-custom.sh --onedark ;;
                *rosepine) "$SDIR"/colors-custom.sh --rosepine ;;
                *ayu) "$SDIR"/colors-custom.sh --ayu ;;
                *solarized) "$SDIR"/colors-custom.sh --solarized ;;
                *cyberpunk) "$SDIR"/colors-custom.sh --cyberpunk ;;

                ## Custom Colors
                *sunset) "$SDIR"/colors-custom.sh --sunset ;;
				## Light Colors
				*amber) "$SDIR"/colors-light.sh --amber ;;
				*blue) "$SDIR"/colors-light.sh --blue ;;
				*blue-gray) "$SDIR"/colors-light.sh --blue-gray ;;
				*brown) "$SDIR"/colors-light.sh --brown ;;
				*cyan) "$SDIR"/colors-light.sh --cyan ;;
				*deep-orange) "$SDIR"/colors-light.sh --deep-orange ;;
				*deep-purple) "$SDIR"/colors-light.sh --deep-purple ;;
				*green) "$SDIR"/colors-light.sh --green ;;
				*gray) "$SDIR"/colors-light.sh --gray ;;
				*indigo) "$SDIR"/colors-light.sh --indigo ;;
				*blue-light) "$SDIR"/colors-light.sh --light-blue ;;
				*green-light) "$SDIR"/colors-light.sh --light-green ;;
				*lime) "$SDIR"/colors-light.sh --lime ;;
				*orange) "$SDIR"/colors-light.sh --orange ;;
				*pink) "$SDIR"/colors-light.sh --pink ;;
				*purple) "$SDIR"/colors-light.sh --purple ;;
				*red) "$SDIR"/colors-light.sh --red ;;
				*teal) "$SDIR"/colors-light.sh --teal ;;
				*yellow) "$SDIR"/colors-light.sh --yellow ;;
				## Dark Colors
				*amber-dark) "$SDIR"/colors-dark.sh --amber ;;
				*blue-dark) "$SDIR"/colors-dark.sh --blue ;;
				*blue-gray-dark) "$SDIR"/colors-dark.sh --blue-gray ;;
				*brown-dark) "$SDIR"/colors-dark.sh --brown ;;
				*cyan-dark) "$SDIR"/colors-dark.sh --cyan ;;
				*deep-orange-dark) "$SDIR"/colors-dark.sh --deep-orange ;;
				*deep-purple-dark) "$SDIR"/colors-dark.sh --deep-purple ;;
				*green-dark) "$SDIR"/colors-dark.sh --green ;;
				*gray-dark) "$SDIR"/colors-dark.sh --gray ;;
				*indigo-dark) "$SDIR"/colors-dark.sh --indigo ;;
				*blue-light-dark) "$SDIR"/colors-dark.sh --light-blue ;;
				*green-light-dark) "$SDIR"/colors-dark.sh --light-green ;;
				*lime-dark) "$SDIR"/colors-dark.sh --lime ;;
				*orange-dark) "$SDIR"/colors-dark.sh --orange ;;
				*pink-dark) "$SDIR"/colors-dark.sh --pink ;;
				*purple-dark) "$SDIR"/colors-dark.sh --purple ;;
				*red-dark) "$SDIR"/colors-dark.sh --red ;;
				*teal-dark) "$SDIR"/colors-dark.sh --teal ;;
				*yellow-dark) "$SDIR"/colors-dark.sh --yellow				
            esac
