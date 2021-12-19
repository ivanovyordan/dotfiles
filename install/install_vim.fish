#!/usr/bin/env fish

function install_dependencies
    npm install --global neovim
end

function install_neovim
    brew install \
        bat \
        fd \
        ripgrep \
        neovim
end

function main
    install_dependencies
    install_neovim
end

main
