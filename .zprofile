# if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
# 	exec startx
# fi

if uwsm check may-start; then
    exec uwsm start hyprland.desktop
fi
