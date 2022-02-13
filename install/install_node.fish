#!/usr/bin/env fish

function install_node
    if test $argv[1] = "Darwin"
        brew install node
    else
        nix-env -iA node
    end
end

function install_global_packages
    npm install -g npm yarn
end

function main
    install_node $1
    install_global_packages
end

main $1
