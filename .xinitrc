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

export WINEDLLOVERRIDES="winemenubuilder.exe=d"
export XDG_CURRENT_DESKTOP=GNOME
#export QT_AUTO_SCREEN_SCALE_FACTOR=1

$HOME/bin/vid init

(exec picom) &

(exec /usr/lib/gsd-a11y-settings) &
(exec /usr/lib/gsd-color) &
(exec /usr/lib/gsd-datetime) &
(exec /usr/lib/gsd-housekeeping) &
(exec /usr/lib/gsd-keyboard) &
(exec /usr/lib/gsd-media-keys) &
(exec /usr/lib/gsd-power) &
(exec /usr/lib/gsd-print-notifications) &
(exec /usr/lib/gsd-rfkill) &
(exec /usr/lib/gsd-screensaver-proxy) &
(exec /usr/lib/gsd-sharing) &
(exec /usr/lib/gsd-smartcard) &
(exec /usr/lib/gsd-sound) &
(exec /usr/lib/gsd-usb-protection) &
(exec /usr/lib/gsd-wacom) &
(exec /usr/lib/gsd-wwan) &
(exec /usr/lib/gsd-xsettings) &

(exec /usr/bin/gnome-keyring-daemon -f--components=pkcs11,secrets) &
(exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1) &

(sleep 2s; exec /usr/bin/udiskie --no-automount --no-notify --tray) &
(sleep 2s; exec /usr/bin/nextcloud) &
(sleep 2s; exec /usr/bin/enpass -minimize) &
(sleep 2s; exec /home/spheenik/bin/jetbrains-toolbox --minimize) &

exec awesome

