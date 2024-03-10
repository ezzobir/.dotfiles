#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# -------------------------------
# My autostart programms
# -------------------------------

#  xmodmap ~/.Xmodmap 

# set the X11 typematic delay and repeat
xset r rate 200 30 &

# set random backgroun
DISPLAY=:0 feh --no-fehbg --bg-fill --randomize ~/Pictures/wallpapers/*.{png,jpg} &

# nitrogen --restore &

sxhkd &

# xbindkeys &

brightnessctl set 40% &

dunst &

nm-applet &

pasystray &

xss-lock -- slock &

# picom &

# -------------------------------
# Start Qtile
# -------------------------------

# exec qtile start

# -------------------------------
# Start EXWM
# -------------------------------

# Fire it up
# exec dbus-launch --exit-with-session emacs -mm --debug-init -l ~/.config/emacs/desktop.el

# -------------------------------
# Start i3wm
# -------------------------------

exec i3

