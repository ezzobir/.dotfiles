#!/bin/bash
#!bin/sh


# -------------------------------
# Permute CapsLock with R_Ctrl
# -------------------------------

# xmodmap ~/.Xmodmap 

xset r rate 200 30 &
sxhkd &
xbindkeys &
brightnessctl set 40% &
dunst &
nm-applet &
pasystray &
xss-lock -- slock &
# nitrogen --restore &
DISPLAY=:0 feh --no-fehbg --bg-fill --randomize ~/Pictures/wallpapers/*.{png,jpg} &
picom -b &

# -------------------------------
# Start Qtile
# -------------------------------

# exec qtile start


# -------------------------------
# Start i3wm
# -------------------------------

exec i3

# -------------------------------
# Start EXWM
# -------------------------------

# Fire it up
# exec dbus-launch --exit-with-session emacs -mm --debug-init -l ~/.config/emacs/desktop.el
