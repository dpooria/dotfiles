#!/bin/bash

if playerctl status | grep -q "Playing"; then
    # If audio is playing force dpms on
    xset dpms force on
else
    i3lock -te -i $HOME/Pictures/rick_morty_blurred.png && xset dpms force off && sleep 1
fi
