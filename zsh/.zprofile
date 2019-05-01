# Autostart X at login
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx 2> /tmp/startx-error.log
fi
