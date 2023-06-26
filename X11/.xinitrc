xrdb -merge $HOME/.config/X11/.Xresources
urxvtd -o -q -f

# montaje automtico
udiskie &

exec i3
