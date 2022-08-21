#!/usr/bin/env fish

function install_virtual_environments
    pip install --upgrade pip

    set -Ux PYENV_ROOT $HOME/.apps/pyenv
    set -Ux PIPENV_VENV_IN_PROJECT true

    http https://pyenv.run | PYENV_ROOT=$PYENV_ROOT bash
    set -Ua fish_user_paths $PYENV_ROOT/bin
    source (pyenv init -|psub)

    if test $argv[1] = "Darwin"
        brew install \
            poetry \
            pipenv
    else
        sudo dnf install -y \
            poetry \
            pipenv
    end
end

function main
    install_virtual_environments $argv
end

main $argv
