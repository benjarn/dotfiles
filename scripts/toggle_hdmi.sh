#! /bin/bash
IN="LVDS"
EXT="HDMI-0"
EXT2="VGA-0"

if (xrandr | grep "$EXT disconnected"); then
    xrandr --output $EXT --off
else
    xrandr --output $EXT --auto --right-of $IN
fi

if (xrandr | grep "$EXT2 disconnected"); then
    xrandr --output $EXT2 --off
else
    xrandr --output $EXT2 --auto --left-of $IN
fi
