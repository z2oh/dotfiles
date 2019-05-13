#!/usr/bin/env sh

# Terminate already running bar instances.
killall -q polybar

# Wait until the processes have been shut down.
while ps -ef | rg "polybar" | rg -v "(rg|polybar_xps.sh)" > /dev/null; do sleep 1; done

# Launch Polybar for laptop screen.
polybar xps &
