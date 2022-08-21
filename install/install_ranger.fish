#!/usr/bin/env fish

function install_lf
    if test $argv[1] = Darwin
        brew install lf
    else
        wget https://github.com/gokcehan/lf/releases/latest/download/lf-linux-amd64.tar.gz -O lf-linux-amd64.tar.gz
        tar xvf lf-linux-amd64.tar.gz
        rm lf-linux-amd64.tar.gz
        chmod +x lf
        sudo mv lf /usr/local/bin
    end
end

function install_plugins
    if test $argv[1] = Darwin
        brew install \
            xpdf
    else
        sudo dnf install -y xpdf
    end

end

function main
    install_lf $argv
    install_plugins $argv
end

main $argv[1]
