#!/bin/sh

rsync -avr --rsh='ssh -p2222' --delete-after --delete-excluded   _site/ zhenglong.yu@outlook.com:
