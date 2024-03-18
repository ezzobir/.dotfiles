#!/usr/bin/env bash


# Get the Polybar process ID
polybar_pid=$(pgrep -x polybar)

# Toggle Polybar visibility
if [ -z "$polybar_pid" ]; then

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar example 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bars launched..."

else
    killall polybar
fi
