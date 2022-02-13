#!/usr/bin/env fish

function install_dependencies
    npm install --global neovim
end

function install_neovim
    if test $argv[1] = "Darwin"
        brew install \
            bat \
            fd \
            ripgrep \
            neovim
    else
        nix-env -iA \
            nixpkgs.bat \
            nixpkgs.fd \
            nixpkgs.ripgrep \
            nixpkgs.neovim
    end
end

function main
    install_dependencies
    install_neovim $argv[1]
end

main $argv[1]
