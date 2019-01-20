#!/usr/bin/env fish

function install_mac
  brew cask install docker
end

function install_linux
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

  set release (lsb_release -ucs)

  sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $release stable"

  sudo apt install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io

  sudo usermod -aG docker $USER
end

function main
  if test $argv[1] = "Darwin"
    install_mac
  else
    install_linux
  end
end

main $argv[1..-1]
