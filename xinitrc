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

export PATH=${PATH}:/Users/neuralsandwich/dev/dwm/
export DATE=`date +"%Y-%m-%d"`

clear mod1
clear mod2
keycode 71 = Alt_L
add mod2 = Alt_L
keycode 63 = Meta_L
add mod1 = Meta_L
keycode 119 = Insert

while true
do
    xsetroot -name "$DATE"
      sleep 3600
    done &amp;
     
    #xsetroot -solid '#4a525a'
    #xmodmap -e 'remove Mod2 = Meta_L' -e 'add Mod1 = Meta_L'
     
    exec dwm
