#!/usr/bin/env fish

function install_virtual_environments
    pip install --upgrade pip

    set -Ux PYENV_ROOT $HOME/.apps/pyenv
    curl https://pyenv.run | PYENV_ROOT=$PYENV_ROOT bash
    set -Ua fish_user_paths $PYENV_ROOT/bin
    source (pyenv init -|psub)

    if test $argv[1] = "Darwin"
        brew install \
            poetry \
            pipenv
    else
        nix-env -iA \
            nixpkgs.poetry \
            nixpkgs.pipenv
    end
end

function main
    install_virtual_environments $argv[1]
end

main $argv[1]
