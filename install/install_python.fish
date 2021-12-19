#!/usr/bin/env fish

function install_python
    brew install pyenv pyenv-virtualenv
    source (pyenv init -|psub)
    source (pyenv virtualenv-init -|psub)

    set -Ux PYENV_ROOT $HOME/.apps/pyenv
    set -Ua fish_user_paths $PYENV_ROOT/shims

    set latest (pyenv install --list | grep "^\s\+[0-9]" | grep -v "[b-]" | tail -1 | xargs)
    pyenv install $latest
    pyenv global $latest
end

function install_global_packages
    pip install --upgrade \
        pip \
        pipx

    pipx install httpie
    pipx install ueberzug
    pipx install pipenv
    pipx install poetry
end

function main
    install_python
    install_global_packages
end

main
