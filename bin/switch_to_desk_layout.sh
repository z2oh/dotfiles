#!/bin/bash

# Lower the DPI back from 4k resolution.
xrandr --dpi 96


# Add my ROG PG278Q, which isn't autodetected correctly for some reason
# ** That was a fun couple nights of debugging! I had to "fix" this right after
# ** I moved to Mountain View, CA, as my desktop's GPU was fried during the
# ** move. Oh well! It came in handy anyway. :)
xrandr --newmode "2560x1440@60" 241,500 2560 2608 2640 2720 1440 1443 1448 1481 +hsync -vsync

# Add the correct mode to my second monitor.
xrandr --addmode DP2 2560x1440@60

# Set up both monitors.
xrandr --output VIRTUAL1 --off --output eDP1 --off --output DP1 --off --output HDMI2 --off --output HDMI1 --mode 2560x1440 --pos 2560x0 --rotate normal --output DP2 --mode 2560x1440@60 --pos 0x0 --rotate normal

# Restore the background image.
nitrogen --restore
