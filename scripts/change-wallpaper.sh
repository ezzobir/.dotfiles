#!/bin/sh
# This file lives at `~/scripts/change-wallpaper.sh`
# Sets background wallpaper of X display :0 to a random JPG file chosen from
# the directory `~/Pictures/wallpapers`
DISPLAY=:0 feh --no-fehbg --bg-fill --randomize ~/Pictures/wallpapers/*.{png,jpg}
