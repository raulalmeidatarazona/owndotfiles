#!/usr/bin/env bash

print_status() {
    echo "------------------------------------------------------------"
    echo " $1"
    echo "------------------------------------------------------------"
}

install_commands=(
    "sudo apt install neofetch"
    "sudo apt install htop"
    "sudo apt install btop"
    "sudo apt install fzf"
    "sudo apt install rclone"
    "sudo apt install tldr"
    "sudo apt install rclone-browser"
    "sudo apt install lsd"
    "sudo apt install bat"
    "sudo apt install syncthing"
    "flatpak install flathub net.ankiweb.Anki"
    "flatpak install flathub org.blender.Blender"
    "flatpak install flathub org.bluej.BlueJ"
    "flatpak install flathub org.gnome.Boxes"
    "flatpak install flathub studio.kx.carla"
    "flatpak install flathub com.google.Chrome"
    "flatpak install flathub org.darktable.Darktable"
    "flatpak install flathub ca.desrt.dconf-editor"
    "flatpak install flathub org.kde.digikam"
    "flatpak install flathub com.discordapp.Discord"
    "flatpak install flathub org.flameshot.Flameshot"
    "flatpak install flathub org.gimp.GIMP"
    "flatpak install flathub fr.handbrake.ghb"
    "flatpak install flathub org.inkscape.Inkscape"
    "flatpak install flathub md.obsidian.Obsidian"
    "flatpak install flathub com.obsproject.Studio"
    "flatpak install flathub com.getpostman.Postman"
    "flatpak install flathub org.synfig.SynfigStudio"
    "flatpak install flathub org.torproject.torbrowser-launcher"
    "flatpak install flathub org.videolan.VLC"
    "flatpak install flathub org.gnome.Weather"
    "flatpak install flathub net.christianbeier.Gromit-MPX"
)

# Run the installation commands.
for command in "${install_commands[@]}"; do
    print_status "Installing $command ..."
    eval $command -y
    if [ $? -ne 0 ]; then
        print_status "Error installing $command"
        exit 1
    fi
done

# Show successful installation message
print_status "All installations were completed successfully!"
