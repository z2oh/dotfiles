#!/bin/bash

# Raise the DPI so the 4k screen becomes usable.
xrandr --dpi 192

# Turn on the laptop monitor.
xrandr --output VIRTUAL1 --off --output eDP1 --primary --mode 3840x2160 --pos 0x0 --rotate normal --output DP1 --off --output HDMI2 --off --output HDMI1 --off --output DP2 --off

# Switch to Colemak, since I am probably using the laptop keyboard.
setxkbmap us -variant colemak

nitrogen --restore

# Start polybar
sh /home/jaday/bin/polybar_xps.sh
