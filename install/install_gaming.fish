#!/usr/bin/env fish

function install_graphics_drivers
    sudo dnf install -y \
        rpmfusion-free-release-tainted \
        rpmfusion-nonfree-release-tainted \
        libdvdcss \
        \*-firmware \
        akmod-nvidia \
        xorg-x11-drv-nvidia-cuda
end

function install_steam
    flatpak install -y flathub com.valvesoftware.Steam
    flatpak override --user --filesystem=/media/data com.valvesoftware.Steam
end

function install_lutris
    flatpak install flathub -y \
        org.gnome.Platform.Compat.i386 \
        org.freedesktop.Platform.GL32.default \
        org.freedesktop.Platform.GL.default

    flatpak install flathub-beta -y net.lutris.Lutris
end

function main
    if test $argv[1] != Linux
        return 0
    end

    install_graphics_drivers
    install_steam
    install_lutris
end

main $argv[1]
