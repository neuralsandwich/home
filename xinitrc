#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
      [ -x "$f" ] && . "$f"
  done
  unset f
fi

if [ -f ~/.Xresources ]; then
  xrdb -merge ~/.Xresources
fi

while true; do
  xsetroot -name "$( date +"%F %T" )"
  sleep 1
done &

if [ `hostname` = 'Sean-PC' ]; then
  xrandr --output DVI-I-1 --rotate left --mode 1680x1050 --left-of DVI-I-2
  xrandr --output DVI-I-2 --rotate normal --mode 1680x1050 --right-of DVI-I-1
fi

# Command for i3 Session
exec i3 -V >> ~/.i3/i3log 2>&1
