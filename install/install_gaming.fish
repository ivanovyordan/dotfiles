#!/usr/bin/env fish

function install_graphics_drivers
    sudo apt install -y software-properties-gtk
    sudo add-apt-repository -y ppa:graphics-drivers/ppa
    sudo ubuntu-drivers autoinstall
end

function install_steam
    set kernel_name (uname -s | tr -d '\n')

    if [ $kernel_name = "Darwin" ]
        brew install --cask steam
    else
        flatpak install flathub \
            com.valvesoftware.Steam \
            flatpak install flathub com.valvesoftware.Steam.CompatibilityTool.Proton \
            flatpak install flathub com.valvesoftware.Steam.CompatibilityTool.Proton-GE

        flatpak override --user --filesystem=/media/data com.valvesoftware.Steam
    end

end

function install_lutris
    sudo dpkg --add-architecture i386

    wget -nc https://dl.winehq.org/wine-builds/winehq.key
    sudo apt-key add winehq.key
    rm -rf winehq.key

    set codename (lsb_release -cus | xargs)

    sudo add-apt-repository -y "deb https://dl.winehq.org/wine-builds/ubuntu/ $codename main"
    sudo add-apt-repository -y ppa:lutris-team/lutris

    sudo apt install --install-recommends \
        winehq-stable \
        lutris
end

function main
    install_graphics_drivers
    install_steam
    install_lutris
end

main
