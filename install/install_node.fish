#!/usr/bin/env fish

function install_node
  brew install nodenv

  set -Ux NODENV_ROOT $HOME/.apps/nodenv

  set latest (nodenv install --list | grep -v - | grep '^[0-9]' | tail -1 | xargs)
  nodenv install $latest
  nodenv global $latest
end

function install_global_packages
  npm install -g \
    npm \
    yarn \
    tldr
end

function main
  install_node
  install_global_packages
end

main
