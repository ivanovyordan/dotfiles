#!/usr/bin/env fish

function install_golang
    if test $argv[1] = "Darwin"
        brew install golang
    else
        nix-env -iA golang
    end
}

function create_workspace
    mkdir -p $HOME/.apps/go/{bin,src}

    set -Ux GOPATH $HOME/.apps/go

    set -Ua fish_user_paths $GOPATH/bin
end

function install_packages
    go get -u golang.org/x/tools/...
    go get -u golang.org/x/lint/golint
end

function main
    install_golang $argv[1]
    create_workspace
    install_packages
end

main $argv[1]
