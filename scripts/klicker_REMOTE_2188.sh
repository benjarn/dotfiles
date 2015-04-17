#!/bin/bash
X1=724
X2=1301
Y1=769
Y2=999

while true
do
  sleep 0.1
  xdotool mousemove $X1 $Y1
  xdotool click 1
  xdotool mousemove $X2 $Y2
  sleep 0.1
  xdotool click 1
done

#xdotool getmouselocation --shell
