#!/usr/bin/env fish

function install_dependencies
    npm install --global neovim
end

function install_neovim
    if test $argv[1] = "Darwin"
        brew install neovim
    else
      sudo dnf install -y neovim
    end
end

function main
    install_dependencies
    install_neovim $argv
end

main $argv
