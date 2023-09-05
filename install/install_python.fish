#!/usr/bin/env fish

function install_pyenv
    asdf plugin add python
    asdf install python latest
    asdf global python latest
end


function install_virtual_environments
    set -Ux PIPENV_VENV_IN_PROJECT true

    if test $argv[1] = Darwin
        brew install \
            poetry \
            pipenv
    else
        sudo apt install -y \
            python3-poetry \
            pipenv
    end
end

function main
    install_virtual_environments $argv
end

main $argv
