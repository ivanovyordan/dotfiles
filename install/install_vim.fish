#!/usr/bin/env fish

function install_dependencies
    npm install --global neovim
    pip install --user pynvim
    gem install neovim
end

function install_neovim
    if test $argv[1] = "Darwin"
        brew install neovim
    else
        curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage

        chmod u+x nvim.appimage
        ./nvim.appimage --appimage-extract
        ./squashfs-root/AppRun --version

        sudo mv squashfs-root /
        sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
    end
end

function main
    install_dependencies
    install_neovim $argv
end

main $argv
