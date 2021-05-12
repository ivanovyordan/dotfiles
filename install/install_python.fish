#!/usr/bin/env fish

function install_python
    brew install pyenv pyenv-virtualenv

    set -Ux PYENV_ROOT $HOME/.apps/pyenv

    set latest (pyenv install --list | grep -v - | grep -v b | tail -1 | xargs)
    pyenv install $latest
    pyenv global $latest
end

function install_pipx
    pip install --upgrade pip pipx
end

function install_global_packages
    pipx install ansible
    pipx install httpie
    pipx install pipenv
    pipx install poetry
end

function main
    install_python
    install_pipx
    install_global_packages
end

main
