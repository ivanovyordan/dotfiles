#!/usr/bin/env fish
function install_ruby
    if $argv[1] != Darwin
        sudo apt install -y \
            libssl-dev \
            libyaml-dev
    end

    asdf plugin add ruby
    asdf install ruby latest
    asdf global ruby latest

end

function main
    install_ruby $argv
end

main $argv
