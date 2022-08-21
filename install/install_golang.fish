#!/usr/bin/env fish

function install_golang
    if test $argv[1] = "Darwin"
        brew install golang
    else
       sudo dnf install -y golang
    end
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
