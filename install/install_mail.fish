#!/usr/bin/env fish

function install_mac
  brew install \
    neomutt \
    isync \
    msmtp \
    mu \
    khard
end

function install_linux
  sudo apt install -y \
    neomutt \
    isync \
    msmtp \
    maildir-utils \
    khard
end

function main
  if test $argv[1] = "Darwin"
    install_mac
  else
    install_linux
  end
end

main $argv[1..-1]
