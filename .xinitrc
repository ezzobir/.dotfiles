#!/bin/bash
#!bin/sh


# -------------------------------
# Permute CapsLock with R_Ctrl
# -------------------------------

xmodmap ~/.Xmodmap 

sxhkd &
brightnessctl set 40% &
dunst &
nm-applet &
pasystray &
xss-lock -- slock &
nitrogen --restore &
picom &

# -------------------------------
# Start Qtile
# -------------------------------

exec qtile start

# -------------------------------
# Start EXWM
# -------------------------------

# Run the screen compositor
# picom &

# Enable screen locking on suspend
# xss-lock -- slock &

# Fire it up
# exec dbus-launch --exit-with-session emacs -mm --debug-init -l ~/.config/emacs/desktop.el
