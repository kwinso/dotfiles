#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar.bottom.log /tmp/polybar.top.log
polybar bottom >> /tmp/polybar.bottom.log 2>&1 & disown
polybar top >> /tmp/polybar.top.log 2>&1 & disown
echo "Bars launched..."
