
#!/bin/sh

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

DEFAULT_SESSION=xfce4-session
case $1 in
  xfce) exec dbus-launch xfce4-session ;;
  *) exec dbus-launch  $DEFAULT_SESSION ;;
esac

# exec i3 -v >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1

setxkbmap -option caps:escape
