#!/bin/bash

while true; do
    output=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep 'state')

    if [[ $output == *"discharging"* ]]; then
        current_rate=$(xrandr | grep -oP '\d+.\d+\*' | head -n1)
        if [ "$current_rate" != "59.96*" ]; then
            xrandr -r 60.00
            notify-send "The Refresh Rate has been set to 60hz"
        fi
    elif [[ $output == *"charging"* ]]; then
        current_rate=$(xrandr | grep -oP '\d+.\d+\*' | head -n1)
        if [ "$current_rate" != "144.00*" ]; then
            xrandr -r 144.00
            notify-send "The Refresh Rate has been set to 144hz"
        fi
    fi

done
