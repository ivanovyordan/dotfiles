#!/usr/bin/env fish

function install_dependencies
    set latest (pyenv install --list | grep -v - | grep -v b | tail -1 | xargs)
    pyenv virtualenv $latest neovim

    pyenv activate neovim
    pip install --upgrade pip pynvim
    pyenv deactivate

    npm install --global neovim
end

function install_neovim
    brew install neovim
end

function main
    install_dependencies
    install_neovim
end

main
