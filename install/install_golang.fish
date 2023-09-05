#!/usr/bin/env fish

function install_golang
    asdf plugin add golang
    asdf install golang latest
    asdf global golang latest
end

function create_workspace
    mkdir -p $HOME/.apps/go/{bin,src}

    set -Ux GOPATH $HOME/.apps/go
    set -Ua fish_user_paths $GOPATH/bin
end

function main
    install_golang $argv
    create_workspace
end

main $argv
