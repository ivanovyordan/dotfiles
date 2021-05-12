#!/usr/bin/env fish

function create_workspace
    mkdir -p $HOME/.apps/go/{bin,src}

    set -Ux GOPATH $HOME/.apps/go
    set -Ux GOROOT (brew --prefix)/opt/go/libexec

    set -Ua fish_user_paths $GOPATH/bin
    set -Ua fish_user_paths $GOROOT/bin
end

function install_packages
    go get -u golang.org/x/tools/...
    go get -u golang.org/x/lint/golint
end

function main
    brew install golang

    create_workspace
    install_packages
end

main
