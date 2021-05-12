#!/usr/bin/env fish

function install_dependencies
    set latest (pyenv install --list | grep -v - | grep -v b | tail -1 | xargs)
    pyenv virtualenv $latest neovim

    pyenv activate neovim
    pip install --upgrade pip pynvim
    pyenv deactivate

    npm install --global neovim
end


function install_lsp
    npm install --global \
        bash-language-server \
        dockerfile-language-server-nodejs \
        graphql-language-service-cli \
        live-server \
        markdownlint \
        pyright \
        typescript typescript-language-server \
        vim-language-server \
        vscode-css-languageserver-bin \
        vscode-json-languageserver \
        yaml-language-server

    brew install \
        hashicorp/tap/terraform-ls \
        pandoc
end

function install_neovim
    brew install --HEAD neovim pandoc
end

function main
    install_dependencies
    install_lsp
    install_neovim
end

main
