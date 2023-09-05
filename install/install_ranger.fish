#!/usr/bin/env fish

function install_lf
    if test $argv[1] = Darwin
        brew install ranger xpdf
    else
        sudo apt install -y ranger xpdf
    end
end

function main
    install_lf $argv
end

main $argv[1]
