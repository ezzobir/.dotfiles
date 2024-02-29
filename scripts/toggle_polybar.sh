#!/bin/bash

# Get the Polybar process ID
polybar_pid=$(pgrep -x polybar)

# Toggle Polybar visibility
if [ -z "$polybar_pid" ]; then
    polybar example &  # Replace "example" with your Polybar config name
else
    pkill polybar
fi
