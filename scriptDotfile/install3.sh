#!/usr/bin/env bash

sudo apt update && sudo apt upgrade -y
sudo apt autoremove -y

dconf load /org/gnome/ < scriptDotfile/gnome-desktop.conf

echo "REBOOT IN 5 SECONDS!!"
sleep 5 &&
reboot
