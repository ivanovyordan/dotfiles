#!/usr/bin/env fish

function install_python
  git clone --depth 1 https://github.com/pyenv/pyenv.git $HOME/.pyenv
  git clone --depth 1 https://github.com/pyenv/pyenv-virtualenv.git $HOME/.pyenv/plugins/pyenv-virtualenv
  git clone --depth 1 https://github.com/momo-lab/pyenv-install-latest $HOME/.pyenv/plugins/pyenv-install-latest

  set PYENV_ROOT $HOME/.pyenv
  set -Ua fish_user_paths $PYENV_ROOT/bin

  set latest (pyenv install-latest --print 3)

  pyenv install $latest
  pyenv global $latest

  source (pyenv init -|psub)
  source (pyenv virtualenv-init -|psub)
end

function install_pipx
  pip install --upgrade pip pipx
end

function install_global_packages
  pipx install ansible
  pipx install httpie
  pipx install pipenv
end

function main
  install_python
  install_pipx
  install_global_packages
end

main
