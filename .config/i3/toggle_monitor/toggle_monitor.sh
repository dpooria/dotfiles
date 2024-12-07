#!/bin/bash

if [ -z $2 ]; then
    fm=HDMI-1
else
    fm=$2
fi
# Check the input argument for monitor setup
if [ "$1" = "dual" ]; then
    # Set to dual monitor
    i3-msg "workspace 1, move workspace to output $fm"
    i3-msg "workspace 2, move workspace to output $fm"
    i3-msg "workspace 3, move workspace to output $fm"
    i3-msg "workspace 4, move workspace to output $fm"
    i3-msg "workspace 5, move workspace to output $fm"
    i3-msg "workspace 6, move workspace to output $fm"
    i3-msg "workspace 7, move workspace to output eDP-1"
    i3-msg "workspace 8, move workspace to output eDP-1"
    i3-msg "workspace 9, move workspace to output eDP-1"
elif [ "$1" = "single" ]; then
    # Set to single monitor
    i3-msg 'workspace 1, move workspace to output eDP-1'
    i3-msg 'workspace 2, move workspace to output eDP-1'
    i3-msg 'workspace 3, move workspace to output eDP-1'
    i3-msg 'workspace 4, move workspace to output eDP-1'
    i3-msg 'workspace 5, move workspace to output eDP-1'
    i3-msg 'workspace 6, move workspace to output eDP-1'
    i3-msg 'workspace 7, move workspace to output eDP-1'
    i3-msg 'workspace 8, move workspace to output eDP-1'
    i3-msg 'workspace 9, move workspace to output eDP-1'
else
    echo "Invalid argument. Use 'single' or 'dual'."
fi

