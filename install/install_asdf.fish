#!/usr/bin/env fish

function install_asdf

end

function main
    set -Ux ASDF_DATA_DIR $HOME/.apps/asdf
    git clone https://github.com/asdf-vm/asdf.git $ASDF_DATA_DIR

    source $ASDF_DATA_DIR/asdf.fish
    mkdir -p ~/.config/fish/completions
    ln -s $ASDF_DATA_DIR/completions/asdf.fish ~/.config/fish/completions
end

main $argv
