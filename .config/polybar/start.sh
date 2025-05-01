#!/usr/bin/env bash

# Terminate already running bar instances
polybar-msg cmd quit

# Launch polybar
# echo "---" | tee -a /tmp/polybar.log
# polybar 2>&1 | tee -a /tmp/polybar.log & disown

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload mybar &
  done
else
  polybar --reload mybar &
fi

echo "Polybar launched..."
