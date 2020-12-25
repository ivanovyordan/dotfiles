#!/usr/bin/env fish

function install_ruby
  brew install rbenv

  set -Ux RBENV_ROOT $HOME/.apps/rbenv

  set latest (rbenv install -l | grep -v - | tail -1 | xargs)
  rbenv install $latest
  rbenv global $latest
end

function install_gems
  gem install \
    coderay \
    tmuxinator
end

function main
  install_ruby
  install_gems
end

main
