#!/usr/bin/env fish

function install_graphics_drivers
    sudo apt install -y software-properties-gtk
    sudo add-apt-repository -y ppa:graphics-drivers/ppa
    sudo ubuntu-drivers autoinstall
end

function install_steam
    flatpak install flathub com.valvesoftware.Steam
    flatpak override --user --filesystem=/media/data com.valvesoftware.Steam
end

function install_lutris
    sudo add-apt-repository -y ppa:lutris-team/lutris
    sudo apt install lutris
end

function main
    if test $argv[1] != "Linux"
        return 0
    end

    install_graphics_drivers
    install_steam
    install_lutris
end

main $argv[1]
