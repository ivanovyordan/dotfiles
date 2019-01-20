#!/usr/bin/env fish

function install_ruby
  git clone --depth 1 https://github.com/rbenv/rbenv.git $HOME/.rbenv

  cd "$HOME/.rbenv"
  src/configure
  make -C src
  cd -

  set RBENV_ROOT $HOME/.rbenv
  set -Ua fish_user_paths $RBENV_ROOT/bin

  mkdir -p $HOME/.rbenv/plugins
  git clone --depth 1 https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build

  set latest (rbenv install -l | grep -v - | tail -1)
  rbenv install $latest
  rbenv global $latest

  source (rbenv init -|psub)
end

function install_gems
  gem install \
    coderay \
    gist \
    tmuxinator
end

function main
  install_ruby
  install_gems
end

main
