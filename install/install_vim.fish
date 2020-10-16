#!/usr/bin/env fish

function install_mac
  brew install \
    neovim \
    languagetool

  curl -s https://api.github.com/repos/juliosueiras/terraform-lsp/releases/latest | \
    grep darwin_amd64.tar.gz | cut -d : -f 2,3 | tr -d \" | wget -qi -
end

function install_linux
  sudo add-apt-repository ppa:neovim-ppa/stable -y
  sudo apt install -y neovim

  curl -sL https://raw.githubusercontent.com/languagetool-org/languagetool/master/install.sh | sudo bash -a commandline
end

function install_vim
  if test $argv[1] = "Darwin"
    install_mac
  else
    install_linux
  end
end

function install_python_dependencies
  set latest (pyenv install-latest --print 3)

  pyenv virtualenv $latest neovim

  pyenv activate neovim
  pip install --upgrade \
    pip \
    pynvim \
    black \
    autopep8 \
    flake8 \
    isort \
    proselint \
    gitlint

  pyenv deactivate
end

function install_ruby_dependencies
  gem install neovim solargraph
end

function install_node_dependencies
  npm install --global \
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
  install_vim $argv[1]

  install_python_dependencies
  install_ruby_dependencies
  install_node_dependencies
  install_plugins
end

main $argv[1..-1]
