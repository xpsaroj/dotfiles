#!/usr/bin/env bash
set -euo pipefail

BAT_PATH="/sys/class/power_supply/BAT0"

if [ ! -d "$BAT_PATH" ]; then
    echo "󰂎 0%"
    exit 0
fi

PERCENT=0
STATUS="Unknown"
ICON="󰂎"

# Read capacity
if [ -r "$BAT_PATH/capacity" ]; then
    read -r PERCENT < "$BAT_PATH/capacity" || PERCENT=0
fi

# Read status (Charging / Discharging / Full)
if [ -r "$BAT_PATH/status" ]; then
    read -r STATUS < "$BAT_PATH/status"
fi

# Choose icon
if [ "$STATUS" = "Charging" ]; then
    ICON="󰂄"
elif [ "$STATUS" = "Full" ]; then
    ICON="󰁹"
else
    # Discharging — choose based on percent
    if   [ "$PERCENT" -ge 90 ]; then ICON="󰁹"
    elif [ "$PERCENT" -ge 70 ]; then ICON="󰂁"
    elif [ "$PERCENT" -ge 50 ]; then ICON="󰁿"
    elif [ "$PERCENT" -ge 30 ]; then ICON="󰁽"
    elif [ "$PERCENT" -ge 10 ]; then ICON="󰁻"
    else ICON="󰂎"
    fi
fi

printf '%s %s%%\n' "$ICON" "$PERCENT"
exit 0
