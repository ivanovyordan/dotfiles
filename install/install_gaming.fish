#!/usr/bin/env fish

function install_graphics_drivers
    sudo ubuntu-drivers autoinstall
end


function main
    if test $argv[1] != Linux
        return 0
    end

    install_graphics_drivers
    install_steam
end

main $argv[1]
