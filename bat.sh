#!/bin/sh

sudo modprobe -r bbqX0kbd
V=$(i2cget -y 1 0x1F 0x17 w | sed s/0x// | tr '[:lower:]' '[:upper:]')
sudo modprobe bbqX0kbd

V=$(echo "obase=10; ibase=16; $V" | bc)
echo "$V * 3.3 * 2 / 4095" | bc -l | cut -c1-5
