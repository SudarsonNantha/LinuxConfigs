#!/bin/sh

instance=$(qdbus| grep MediaPlayer2.chromium | awk -F '[.]' '{print $5}')

if [ -z "$instance" ]
then
    echo ""
else
    song=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.chromium.$instance /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata | sed -n '/title/{n;p}' | cut -d '"' -f 2)

    artist=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.chromium.$instance /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:'Metadata' | awk '/artist/{getline; getline; split($0,a,"\""); print a[2]}' | awk -F '[-]' '{print $1}')

    echo " $song - $artist"
fi
