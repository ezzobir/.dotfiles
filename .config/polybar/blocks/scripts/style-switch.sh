#!/usr/bin/env bash

SDIR="$HOME/.config/polybar/blocks/scripts"

# Launch Rofi
MENU="$(rofi -no-config -no-lazy-grab -sep "|" -dmenu -i -p '' \
-theme $SDIR/rofi/styles.rasi \
<<< " Gruvbox| Default| Nord| Adapta| Cherry|")"
            case "$MENU" in
				*Gruvbox) "$SDIR"/styles.sh --gruvbox ;;
				*Default) "$SDIR"/styles.sh --default ;;
				*Nord) "$SDIR"/styles.sh --nord ;;
				*Adapta) "$SDIR"/styles.sh --adapta ;;
				*Cherry) "$SDIR"/styles.sh --cherry ;;
            esac
