#!/usr/bin/env fish

function install_linux_rbenv
    sudo dnf install -y \
        gcc-c++ \
        bzip2 \
        openssl-devel \
        libyaml-devel \
        libffi-devel \
        readline-devel \
        zlib-devel \
        gdbm-devel \
        ncurses-devel

    set -Ux RBENV_ROOT $HOME/.apps/rbenv
    set -Ua fish_user_paths $RBENV_ROOT/shims

    git clone https://github.com/sstephenson/rbenv.git $RBENV_ROOT
    cd $RBENV_ROOT ;and src/configure ;and make -C src ;and cd -

    git clone https://github.com/sstephenson/ruby-build.git $RBENV_ROOT/plugins/ruby-build
end

function install_ruby
    if test $argv[1] = "Darwin"
        brew install ruby rbenv
    else
        sudo dnf install -y \
            ruby \
            gcc-c++ \
            bzip2 \
            openssl-devel \
            libyaml-devel \
            libffi-devel \
            readline-devel \
            zlib-devel \
            gdbm-devel \
            ncurses-devel

        install_linux_rbenv
    end

end

function main
    install_ruby $argv
end

main $argv
