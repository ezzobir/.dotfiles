#!bin/sh


sxhkd &
brightnessctl set 40% &

xss-lock -- slock &

# wallpaper
nitrogen --restore &

# systemtray
blueman-applet &
nm-applet &
pasystray &

# programs
dunst &
picom &
