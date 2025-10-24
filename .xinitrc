#!/bin/sh

# DWM 

setxkbmap es
/usr/lib/notification-daemon-1.0/notification-daemon &
exec dwm
