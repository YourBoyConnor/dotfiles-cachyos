#!/bin/bash

# Get current profile
current=$(powerprofilesctl get)

# Cycle through profiles and switch GPU
case "$current" in
    power-saver)
        powerprofilesctl set balanced
        supergfxctl -m Integrated
        notify-send "Power Profile" "Balanced + Intel GPU"
        ;;
    balanced)
        powerprofilesctl set performance
        supergfxctl -m Hybrid
        notify-send "Power Profile" "Performance + NVIDIA GPU"
        ;;
    performance)
        powerprofilesctl set power-saver
        supergfxctl -m Integrated
        notify-send "Power Profile" "Power Saver + Intel GPU"
        ;;
esac
