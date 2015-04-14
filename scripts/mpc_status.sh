#!/bin/sh
notify-send "$(mpc status | grep - )" -t 2

