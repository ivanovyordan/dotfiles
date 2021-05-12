#!/usr/bin/env fish

function install_terraform
    brew install tfenv

    tfenv install latest
    tfenv use latest
end

function main
    install_terraform
end

main
