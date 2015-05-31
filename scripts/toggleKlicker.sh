#!/bin/sh

if [[ $(pidof -x klicker.sh|wc -w) > 0 ]]; then
  killall klicker.sh;
  echo "killed Radio"
else
  echo "started Radio"
  ~/scripts/klicker.sh
fi
