#!/bin/bash

if args[1]==mount
    cryptsetup open --type luks args[2] luksroot
fi

if args[2]==unmount
    cryptsetup close luksroot
fi
