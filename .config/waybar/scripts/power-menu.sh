#!/bin/bash

# Path to menu JSON
MENU_JSON="$HOME/.config/waybar/scripts/power-menu.json"
TMP_SELECTION="/tmp/wofi-power-selection"

# Toggle off if already open
if pgrep -x "wofi" > /dev/null; then
    pkill -x wofi
    exit 0
fi

# Build menu display
options=$(jq -r '.[].name' "$MENU_JSON")

# Show menu and capture selection
selection=$(echo "$options" | wofi --show dmenu \
    --conf /dev/null \
    --style ~/.config/wofi/style.css \
    --location 3 \
    --width 200 \
    --height 150 \
    --hide-scroll \
    --no-input)

# Run command if matched
if [ -n "$selection" ]; then
    cmd=$(jq -r --arg name "$selection" '.[] | select(.name == $name) | .cmd' "$MENU_JSON")
    eval "$cmd"
fi
