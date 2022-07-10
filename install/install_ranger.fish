#!/usr/bin/env fish

function install_lf
    if test $argv[1] = Darwin
        brew install lf
    else
        nix-env -iA nixpkgs.lf
    end
end

function install_plugins
    if test $argv[1] = Darwin
        brew install \
            xpdf
    else
        nix-env -iA \
            nixpkgs.xpdf
    end

end

function main
    install_lf $argv[1]
    install_plugins $argv[1]
end

main $argv[1]
