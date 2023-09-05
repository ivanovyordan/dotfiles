#!/usr/bin/env fish

function install_graphics_drivers
    sudo ubuntu-drivers autoinstall
    sudo apt install -y steam-devices
end2

function install_steam
    flatpak install -y flathub com.valvesoftware.Steam
end

function install_lutris
    flatpak install flathub -y net.lutris.Lutris
end

function main
    if test $argv[1] != Linux
        return 0
    end

    install_graphics_drivers
    install_steam
    install_lutris
end

main $argv[1]1
