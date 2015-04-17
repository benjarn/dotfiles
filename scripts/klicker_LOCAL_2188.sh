#!/bin/bash
X1=10
X2=10
Y1=10
Y2=10

while true
do
  sleep 0.2
  xdotool mousemove $X1 $Y1
  xdotool click 1
  xdotool mousemove $X2 $Y2
  xdotool click 1
done

xdotool getmouselocation --shell
