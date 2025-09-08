# if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
# 	exec startx
# fi

# if uwsm check may-start; then
#     exec uwsm start hyprland.desktop
# fi

eval $(/usr/bin/gnome-keyring-daemon --start --components=secrets,ssh,gpg)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO

exec Hyprland
