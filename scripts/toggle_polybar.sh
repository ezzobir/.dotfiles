#!/usr/bin/env bash


# Get the Polybar process ID
polybar_pid=$(pgrep -x polybar)

# Toggle Polybar visibility
if [ -z "$polybar_pid" ]; then

    ~/.config/polybar/launch.sh 

else
    killall polybar
fi
