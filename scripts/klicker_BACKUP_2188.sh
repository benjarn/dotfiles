#!/bin/bash
<<<<<<< HEAD
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
=======
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
>>>>>>> f4a01b6be4cbc30dc010c4afcadae084922318e3
