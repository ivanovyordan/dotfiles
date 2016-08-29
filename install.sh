#!/bin/bash

# this ensures the entire script is downloaded #
{
echo "Dotfiles - Yordan Ivanov"

# CONFIG #

## Link Directories ##
DOTFILES_DIR="$HOME/.dotfiles"
LINK_SOURCE_DIR="$HOME/link"
STARTUP_SOURCE_DIR="$DOTFILES_DIR/startup"
STARTUP_DEST_DIR="$HOME/.config/autostart"

## APT Repositories ##
PPA_REPOSITORIES=(
  "ppa:git-core/ppa" # git
  "ppa:peterlevi/ppa" # Variery
  "ppa:numix/ppa" # Numix Theme
  "ppa:snwh/pulp" # Paper Theme
  "ppa:oranchelo/oranchelo-icon-theme" # Oranchelo Icon Theme
)

## Packages ##
APT_PACKAGES=(
  # Git
  git-core
  git-flow
  git-extras

  # Development
  build-essential
  vim
  meld
  colordiff
  graphviz
  virtualbox

  # Visual
  variety
  unity-tweak-tool
  numix-gtk-theme
  paper-gtk-theme
  numix-icon-theme
  numix-icon-theme-circle
  oranchelo-icon-theme

  # Other
  vlc
  smplayer
  autojump
  curl
  whois
  zsh
  steam
  skype
)

# DEB FILES
DEB_FILES=(
  "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" # Chrome
  "https://atom.io/download/deb" # Atom
  "https://releases.hashicorp.com/vagrant/1.8.4/vagrant_1.8.4_x86_64.deb" # Vagrant
  "https://mega.nz/linux/MEGAsync/xUbuntu_16.04/amd64/megasync-xUbuntu_16.04_amd64.deb" # MEGA sync client
  "https://mega.nz/linux/MEGAsync/xUbuntu_16.04/amd64/nautilus-megasync-xUbuntu_16.04_amd64.deb" # Mega Nautilus extension
)

## Node.js Packages ##
NPM_PACKAGES=(
  gulp
  eslint
  typescript
)

sudo add-apt-repository multiverse

# INSTALLATION #
echo "Add new APT software repositories"
for REPOSITORY in "${PPA_REPOSITORIES[@]}"
do
  sudo add-apt-repository -y "$REPOSITORY"
done

echo "Update repositories"
sudo apt-get -qq -y update && sudo apt-get -y upgrade

echo "Install packages"
APT_PACKAGES=$(IFS=$" "; echo "${APT_PACKAGES[*]}")
apt-get install -y "$APT_PACKAGES"

echo "Download .deb files"
for URL in "${DEB_FILES[@]}"
do
  wget "$URL" -qO "$FILE"
  sudo dpkg -i "$FILE"
  rm "$FILE"
done

echo "Install dependecies"
sudo apt-get -f install

echo "Install Docker"
wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker "$USER"

echo "Install Docker Compose"
curl -L https://raw.githubusercontent.com/docker/compose/master/script/run/run.sh > docker-compose
chmod +x docker-compose
sudo mv docker-compose /usr/local/bin/

echo "Install NVM"
wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | sh
source "$HOME/.nvm/nvm.sh"
nvm install stable
nvm use stable
nvm alias default stable

echo "Install Node.js packages"
NPM_PACKAGES=$(IFS=$" "; echo "${NPM_PACKAGES[*]}")
npm install -g "$NPM_PACKAGES"

echo "Install Miniconda"
wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh
bash Miniconda-latest-Linux-x86_64.sh -b -p "$HOME/.applications/miniconda"
rm Miniconda-latest-Linux-x86_64.sh

echo "Update Miniconda"
export PATH="$HOME/.applications/miniconda/bin:$PATH"
conda update -y conda

echo "Install Miniconda Python 3"
conda create -y --name python3 python=3

echo "Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
git clone git://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"

echo "Clonning the repository"
git clone https://github.com/ivanovyordan/dotfiles.git "$DOTFILES_DIR"

echo "Create startup scripts"
FILES=$(ls -A "$STARTUP_SOURCE_DIR")
for FILE in $FILES
do
  echo "[Desktop Entry]" > "$STARTUP_DEST_DIR/$FILE.desktop"
  echo "Type=Application" >> "$STARTUP_DEST_DIR/$FILE.desktop"
  echo "Exec=$STARTUP_SOURCE_DIR/$FILE" >> "$STARTUP_DEST_DIR/$FILE.desktop"
  echo "Hidden=false" >> "$STARTUP_DEST_DIR/$FILE.desktop"
  echo "NoDisplay=false" >> "$STARTUP_DEST_DIR/$FILE.desktop"
  echo "X-GNOME-Autostart-enabled=true" >> "$STARTUP_DEST_DIR/$FILE.desktop"
  echo "$FILE" >> "$STARTUP_DEST_DIR/$FILE.desktop"
done

echo "Create links"
FILES=$(ls -A "$LINK_SOURCE_DIR")
for FILE in $FILES
do
  ln -s "$LINK_SOURCE_DIR/$FILE" "$HOME"
done

echo "Setup vim"
git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
vim +PluginInstall +qall

echo "Change default shell to zsh"
chsh -s "$(which zsh)" "$USER"
}