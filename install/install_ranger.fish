#!/usr/bin/env fish

function install_ranger
    if test $argv[1] = "Darwin"
        brew install ranger
    else
        nix-env -iA nixpkgs.ranger
    end
end

function install_plugins
    git clone https://github.com/alexanderjeurissen/ranger_devicons $HOME/.config/ranger/plugins/ranger_devicons
end

function main
    install_ranger
    install_plugins
end

main $argv[1]
