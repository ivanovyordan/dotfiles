#!/usr/bin/env fish

function install_node
  curl -so- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

  nvm install --lts
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
