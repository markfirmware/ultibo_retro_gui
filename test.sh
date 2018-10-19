#!/bin/bash
set -e

# on raspbian, build the program and reboot to it

LAZDIR="$HOME/ultibo/core"
REPONAME=ultibo_retro_gui
LPINAME=Project1

rm -rf $REPONAME-kernel7-rpi3.img
WD=$(pwd)
pushd $LAZDIR >& /dev/null
./lazbuild $WD/$LPINAME.lpi | egrep -v '(Hint:|Info:|Note:|Warning:|warning:)'
popd >& /dev/null
mv kernel7.img $REPONAME-kernel-rpi3.img

set -x
sudo rm -rf /boot/Colors
sudo mkdir -p /boot/Colors/Wallpapers
sudo cp Colors/Wallpapers/rpi-logo.rbm /boot/Colors/Wallpapers
#sudo cp arial.ttf /boot
sudo cp $REPONAME-kernel-rpi3.img /boot
sudo cp $REPONAME-config.txt $REPONAME-cmdline.txt /boot
sudo cp /boot/$REPONAME-config.txt /boot/config.txt
sleep 2
sudo reboot
