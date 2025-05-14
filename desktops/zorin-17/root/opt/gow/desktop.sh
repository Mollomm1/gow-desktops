#!/bin/bash

function launch_desktop() {
  # Launching X11 desktop, xorg server has already been launched.

  # for flatpaks apps to appair in menus
  export XDG_DATA_DIRS=/var/lib/flatpak/exports/share:/home/retro/.local/share/flatpak/exports/share:/usr/local/share/:/usr/share/

  # environement variables to ensure apps integrate well with our wm or de, https://wiki.archlinux.org/title/Xdg-utils#Environment_variables
  export XDG_CURRENT_DESKTOP=zorin:GNOME
  export DE=zorin
  export DESKTOP_SESSION=zorin
  export GNOME_SHELL_SESSION_MODE="zorin"
  export XDG_SESSION_TYPE=x11

  # Various envs to help with apps compability
  export XDG_SESSION_CLASS="user"
  export _JAVA_AWT_WM_NONREPARENTING=1
  export GDK_BACKEND=x11
  export MOZ_ENABLE_WAYLAND=0
  export QT_QPA_PLATFORM="xcb"
  export QT_AUTO_SCREEN_SCALE_FACTOR=1
  export QT_ENABLE_HIGHDPI_SCALING=1

  # gnome related env
  export GNOME_SHELL_SESSION_MODE="zorin"

  # set display, unset wayland display and get dbus envs
  export DISPLAY=:9
  unset WAYLAND_DISPLAY
  export $(dbus-launch)

  gsettings set org.gnome.desktop.interface scaling-factor 1
  flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  
  # start de
  dbus-run-session -- /usr/bin/gnome-session
}

launch_desktop