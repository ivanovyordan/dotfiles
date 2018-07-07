#!/usr/bin/env bash

# this ensures the entire script is downloaded #
{
DOTFILES_DIR=$HOME/.dotfiles
APPS_DIR=$HOME/.apps

function github_release {
  local release=$(curl -s "https://api.github.com/repos/$1/releases/latest" | grep tag_name | cut -d '"' -f 4)
  echo $release
}

# Update repositories
sudo apt update

# apt-add-repository
sudo apt install -y \
  software-properties-common \
  curl \
  apt-transport-https

# Add PGP keys
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - # Docker
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410 # Spotify

# Add repositories
sudo apt-add-repository -y ppa:graphics-drivers/ppa # drivers
sudo apt-add-repository -y ppa:git-core/ppa # git
sudo apt-add-repository -y ppa:philip.scott/elementary-tweaks # elementary-tweaks
sudo apt-add-repository -y ppa:neovim-ppa/stable # neovim
sudo apt-add-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable" # docker-ce
sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free" # Spotify

# Update system
sudo apt update
sudo apt full-upgrade -y

# Install packages
sudo DEBIAN_FRONTEND=noninteractive apt install -y \
  autojump \
  build-essential \
  ca-certificates \
  colordiff \
  com.github.donadigo.eddy \
  docker-ce \
  elementary-tweaks \
  firefox \
  git-core \
  git-extras \
  neovim \
  pass \
  python-gpgme \
  silversearcher-ag \
  spotify-client \
  tmux \
  virtualbox \
  zsh

# Install graphics drivers
sudo ubuntu-drivers autoinstall

# Install Dropbox
wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

# Install steam
wget http://media.steampowered.com/client/installer/steam.deb
sudo dpkg -i steam.deb
rm -rf steam.deb

# Clean up
sudo apt install -f
sudo apt autoremove -y
sudo apt autoclean

# Install Python
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p "$APPS_DIR/miniconda"
rm Miniconda3-latest-Linux-x86_64.sh
export PATH="$APPS_DIR/miniconda/bin:$PATH"
conda update -y conda
conda create -y --name python2 python=2
conda create -y --name neovim2 python=2
conda create -y --name neovim3 python=3

pip install --upgrade pip awscli httpie pgcli 'python-language-server[all]'
conda activate neovim2
pip install --upgrade pip neovim
conda activate neovim3
pip install --upgrade pip neovim 'python-language-server[all]'
conda deactivate

# Install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source $HOME/.nvm/nvm.sh
nvm install --lts

# Install npm packages
npm install -g \
  npm \
  dockerfile-language-server-nodejs \
  javascript-typescript-langserver

# Install rbenv
git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
git clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build
PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"
LATEST_RUBY=$(rbenv install -l | grep -v - | tail -1)
rbenv install $LATEST_RUBY
rbenv global $LATEST_RUBY

# Install ruby gems
gem install \
  bundler \
  coderay \
  neovim \
  tmuxinator
rbenv rehash

# Install docker compose and kubernetes
COMPOSE_RELEASE=$(github_release docker/compose)
KUBECTL_RELEASE=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
sudo curl -L https://github.com/docker/compose/releases/download/$COMPOSE_RELEASE/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose
sudo curl https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_RELEASE/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl
sudo curl https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 -o /usr/local/bin/minikube
sudo chmod +x /usr/local/bin/{docker-compose,kubectl,minikube}
sudo usermod -aG docker $USER

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install --all --no-update-rc

# Install oh-my-zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

mkdir -p $ZSH_CUSTOM/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

mkdir -p $ZSH_CUSTOM/themes
curl curl -O https://gist.githubusercontent.com/schminitz/9931af23bbb59e772eec/raw/schminitz.zsh-theme -o $ZSH_CUSTOM/themes/schminitz.zsh-theme

# Install neovim dependencies
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | bash -s -- $HOME/.cache/dein
sudo chown -R $USERNAME:$USERNAME $HOME/.cache
sudo chown -R $USERNAME:$USERNAME ~/.local/share/nvim/swap

# Setup pgp agent
mkdir -p $HOME/.gnupg
echo "no-tty\nuse-agent" >> $HOME/.gnupg/gpg.conf

# Download dotfiles
git clone https://github.com/ivanovyordan/dotfiles.git $DOTFILES_DIR

# Link files
for FILE in $DOTFILES_DIR/link/*
do
  NAME=$(basename $FILE)
  ln -s $FILE $HOME/.$NAME
done

# Link vim config
ln -s $DOTFILES_DIR/confing/nvim $HOME/.config

# Custom source scripts
mkdir -p $HOME/.dotfiles.local/{source,bin}
touch $HOME/.dotfiles.local/init.vim
}
