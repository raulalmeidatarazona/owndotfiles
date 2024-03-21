#!/usr/bin/env bash

sudo apt update && sudo apt upgrade -y
sudo apt install git -y
sudo apt install curl -y
sudo apt install wget -y
sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
# git clone --depth=1 https://github.com/ryanoasis/nerd-fonts.git
./nerd-fonts/install.sh
sudo fc-cache -f -v
sudo apt install gnome-tweaks -y
sudo apt-get install gnome-browser-connector -y
flatpak install flathub org.gnome.Extensions -y
flatpak install flathub com.google.Chrome -y
flatpak install flathub com.bitwarden.desktop -y
sudo apt install zsh -y
chsh -s $(which zsh)
echo "REBOOT IN 5 SECONDS!!"
sleep 5 &&
reboot
