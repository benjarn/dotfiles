#!/bin/bash

readarray -t PROPS < <(xwinfo -it $1)

INST=${PROPS[0]}
TYPE=${PROPS[1]}

case "$TYPE" in
    desktop)
        echo "lower=on manage=off" ;;
esac

case "$INST" in
    xv|vlc|mplayer)
        echo "desktop=media" ;;
    firefox)
        echo "desktop=web" ;;
    urxvt)
        echo "desktop=term" ;;
    gimp|Pidgin|fbmessenger)
        echo "desktop=other" ;;
    thunar)
        echo "desktop=files" ;;
    
    floating)
        echo "floating=on" ;;
esac
