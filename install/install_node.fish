#!/usr/bin/env fish

function install_node
    if test $argv[1] = "Darwin"
        brew install node
    else
        sudo dnf install -y nodejs
    end
end

function install_global_packages
    npm install -g npm yarn
end

function main
    install_node $argv
    install_global_packages
end

main $argv
