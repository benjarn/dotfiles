#!/bin/bash
X1=1553
Y1=961
X2=1519
Y2=468
X3=1290
Y3=620
X4=914
Y4=705

while true
do
  sleep 0.5
  xdotool mousemove $X1 $Y1
  xdotool click 1
  sleep 1.5
  xdotool mousemove $X2 $Y2
  xdotool click 1
  sleep 0.5
  xdotool mousemove $X3 $Y3
  xdotool click 1
  sleep 0.5
  xdotool mousemove $X4 $Y4
  xdotool click 1
done

xdotool getmouselocation --shell

