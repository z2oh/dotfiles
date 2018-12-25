#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# wait until the processes have been shut down
while ps -ef | rg "polybar" | rg -v "(rg|launch.sh)" > /dev/null; do sleep 1; done

# launch polybar
polybar hdmi &
