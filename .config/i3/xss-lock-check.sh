#!/usr/bin/env bash

# If *any* player is playing (generic MPRIS or Firefox-specific), keep the screen on
if playerctl status 2>/dev/null | grep -q "Playing" \
   || playerctl -p firefox status 2>/dev/null | grep -q "Playing"; then
    xset dpms force on
else
    i3lock -te -i "$HOME/Pictures/rick_morty_blurred.png" \
    && xset dpms force off \
    && sleep 1
fi
