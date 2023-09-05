#!/usr/bin/env fish

function install_node
    asdf plugin add nodejs
    asd install nodejs latest
    asdf global nodejs latest
end

function install_global_packages
    npm install -g npm yarn
end

function main
    install_node $argv
    install_global_packages
end

main $argv
