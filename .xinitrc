#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

export XDG_CURRENT_DESKTOP=GNOME
#export QT_AUTO_SCREEN_SCALE_FACTOR=1

$HOME/bin/vid init

/usr/lib/gnome-settings-daemon/gnome-settings-daemon &
/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets

(sleep 2s; /usr/bin/nextcloud) &
(sleep 2s; /usr/bin/enpass) &

compton -b
exec awesome

