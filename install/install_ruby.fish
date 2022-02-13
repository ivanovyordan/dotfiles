#!/usr/bin/env fish

function install_ruby
    if test $argv[1] = "Darwin"
        brew install ruby rbenv
    else
        nix-env -iA nixpkgs.ruby nixpkgs.rbenv
    end

    set -Ux RBENV_ROOT $HOME/.apps/rbenv
    set -Ua fish_user_paths $RBENV_ROOT/shims
end

function main
    install_ruby $argv[1]
end

main $argv[1]
