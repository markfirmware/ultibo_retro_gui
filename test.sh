#!/bin/bash
set -ex

# on raspbian, build the program and reboot to it

LAZDIR="$HOME/ultibo/core"
LPINAME=Project1

rm -rf Project1-kernel7-rpi3.img
#rm -rf lib/
WD=$(pwd)
pushd $LAZDIR >& /dev/null
./lazbuild $WD/$LPINAME.lpi
popd >& /dev/null
mv kernel* $LPINAME-kernel-rpi3.img

sudo cp Project1-kernel-rpi3.img /boot
sudo cp Project1-config.txt Project1-cmdline.txt /boot
sudo cp /boot/Project1-config.txt /boot/config.txt
sleep 2
sudo reboot
