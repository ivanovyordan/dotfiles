#!/usr/bin/env fish

function install_ruby
    brew install rbenv
    source (rbenv init -|psub)

    set -Ux RBENV_ROOT $HOME/.apps/rbenv
    set -Ua fish_user_paths $RBENV_ROOT/shims

    set latest (rbenv install -l | grep -v - | tail -1 | xargs)
    rbenv install $latest
    rbenv global $latest
end

function main
    install_ruby
end

main
