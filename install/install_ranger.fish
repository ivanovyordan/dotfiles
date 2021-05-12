#!/usr/bin/env fish

function install_ranger
    brew install ranger ffmpegthumbnailer exiftool pdftotext
end

function install_plugins
    git clone https://github.com/alexanderjeurissen/ranger_devicons $HOME/.config/ranger/plugins/ranger_devicons
end

funciton main
    install_ranger
    install_plugins
end

main
