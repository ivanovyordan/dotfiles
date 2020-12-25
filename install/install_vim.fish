#!/usr/bin/env fish

function install_neovim
  brew install \
    neovim \
    languagetool \
    hashicorp/tap/terraform-ls
end

function install_python_dependencies
  set latest (pyenv install --list | grep -v - | grep -v b | tail -1 | xargs)

  pyenv virtualenv $latest neovim

  pyenv activate neovim
  pip install --upgrade \
    pip \
    autopep8 \
    black \
    flake8 \
    gitlint \
    isort \
    proselint \
    pynvim \
    rope

  pyenv deactivate
end

function install_ruby_dependencies
  gem install neovim solargraph
end

function install_node_dependencies
  npm install --global \
    vim-language-server \
    bash-language-server \
    diagnostic-languageserver \
    dockerfile-language-server-nodejs \
    javascript-typescript-langserver \
    markdownlint \
    neovim
end

function install_plugins
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  nvim +'PlugInstall --sync' +qa
end

function main
  install_neovim

  install_python_dependencies
  install_ruby_dependencies
  install_node_dependencies
  install_plugins
end

main
