#!/bin/bash

DIR="/home/marcus/Pictures/wp"
touch $DIR/$(ls -t $DIR | tail -n 1)
nitrogen --set-scaled $DIR/$(ls -t $DIR | tail -n 1)

