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
# Cammand for i3 Session
#exec i3 -V >> ~/.i3/i3log 2>&1
# Command for Mate Session
exec mate-session
