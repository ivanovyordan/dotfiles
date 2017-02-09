#!/usr/bin/env bash

# this ensures the entire script is downloaded #
{
echo "Dotfiles - Yordan Ivanov"

# CONFIG #

## Link Directories ##
DOTFILES_DIR="$HOME/.dotfiles"
LINK_SOURCE_DIR="$DOTFILES_DIR/link"
STARTUP_SOURCE_DIR="$DOTFILES_DIR/startup"
STARTUP_DEST_DIR="$HOME/.config/autostart"
APPS_DIR="$HOME/.applications"
DISTRO_NAME=`lsb_release -is`
DISTRO_VERSION=`lsb_release -sc`

## Repository Keys ##
REPOSITORY_KEYS=(
  "pgp.mit.edu:5044912E"
)

## APT Repositories ##
PPA_REPOSITORIES=(
  "multiverse"
  "deb http://linux.dropbox.com/ubuntu $DISTRO_VERSION main" #Dropbox
  "ppa:graphics-drivers/ppa" # Graphics drivers
  "ppa:git-core/ppa" # Git
)

UBUNTU_PPA_REPOSITORIES=(
  "ppa:peterlevi/ppa" # Variery
  "ppa:numix/ppa" # Numix Theme
  "ppa:snwh/pulp" # Paper Theme
  "ppa:tista/adapta" # Adapta theme
  "ppa:oranchelo/oranchelo-icon-theme" # Oranchelo Icon Theme
)

ELEMENTARY_PPA_REPOSITORIES=(
  "ppa:philip.scott/elementary-tweaks" # elementary tweaks
)

## Basic Packages ##
BASIC_PACKAGES=(
  "software-properties-common"
)

## Packages ##
APT_PACKAGES=(
  "git-core"
  "git-flow"
  "git-extras"

  "build-essential"
  "cmake"
  "vim"
  "meld"
  "colordiff"
  "default-jre"
  "graphviz"
  "virtualbox"
   
  "dropbox"
  "python-gpgme"
  "vlc"
  "smplayer"
  "autojump"
  "curl"
  "whois"
  "zsh"

  "sni-qt"
  "sni-qt:i386"
)

UBUNTU_APT_PACKAGES=(
  "variety"
  "unity-tweak-tool"
  "numix-gtk-theme"
  "numix-icon-theme"
  "numix-icon-theme-circle"
  "paper-gtk-theme"
  "paper-icon-theme"
  "paper-cursor-theme"
  "adapta-gtk-theme"
  "oranchelo-icon-theme"
)

ELEMENTARY_APT_PACKAGES=(
  "elementary-tweaks"
)

# DEB FILES
DEB_FILES=(
  "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" # Chrome
  "https://atom.io/download/deb" # Atom
  "https://releases.hashicorp.com/vagrant/1.8.4/vagrant_1.8.4_x86_64.deb" # Vagrant
)

## Node.js Packages ##
NODE_MODULES=(
  "gulp-cli"
  "eslint"
  "typescript"
)

ZSH_PLUGINS=(
  "https://github.com/zsh-users/zsh-syntax-highlighting.git"
  "https://github.com/zsh-users/zsh-autosuggestions.git"
)

# INSTALLATION #

function add_basic_packages() {
  echo "Adding basic packages"

  BASIC_PACKAGES=$(IFS=$" "; echo "${BASIC_PACKAGES[*]}")
  sudo apt-get install -y $BASIC_PACKAGES
}

function add_elementary_repositories() {
  echo "Adding elementary APT software repositories"

  for REPOSITORY in "${ELEMENTARY_PPA_REPOSITORIES[@]}"; do
    sudo add-apt-repository -y "$REPOSITORY"
  done
}

function add_ubuntu_repositories() {
  echo "Adding Ubuntu APT software repositories"

  for REPOSITORY in "${UBUNTU_PPA_REPOSITORIES[@]}"; do
    sudo add-apt-repository -y "$REPOSITORY"
  done
}

function add_distro_repositories() {
  if [ $DISTRO_NAME = "Ubuntu" ]
  then
    add_ubuntu_repositories
  elif [ $DISTRO_NAME = "elementary" ]
  then
    add_elementary_repositories
  fi
}

function add_keys() {
  for item in "${REPOSITORY_KEYS[@]}" ; do
    SERVER="${item%%:*}"
    KEY="${item##*:}"
    sudo apt-key adv --keyserver $SERVER --recv-keys KEY
  done
}

function add_respositories() {
  echo "Adding common APT software repositories"

  for REPOSITORY in "${PPA_REPOSITORIES[@]}"; do
    sudo add-apt-repository -y "$REPOSITORY"
  done

  add_distro_repositories
}

function update_repositories() {
  echo "Updating repositories"

  sudo apt-get -qq -y update && sudo apt-get -y upgrade
}

function install_ubuntu_packages() {
  echo "Installing Ubuntu system packages"

  UBUNTU_APT_PACKAGES=$(IFS=$" "; echo "${UBUNTU_APT_PACKAGES[*]}")
  sudo apt-get install -y $UBUNTU_APT_PACKAGES
}

function install_elementary_packages() {
  echo "Installing elementary system packages"

  ELEMENTARY_APT_PACKAGES=$(IFS=$" "; echo "${ELEMENTARY_APT_PACKAGES[*]}")
  sudo apt-get install -y $ELEMENTARY_APT_PACKAGES
}

function install_distro_packages() {
  if [ $DISTRO_NAME = "Ubuntu" ]
  then
    install_ubuntu_packages
  elif [ $DISTRO_NAME = "elementary" ]
  then
    install_elementary_packages
  fi
}

function install_system_packages() {
  echo "Installing system packages"

  APT_PACKAGES=$(IFS=$" "; echo "${APT_PACKAGES[*]}")
  sudo apt-get install -y $APT_PACKAGES

  install_distro_packages
}

function install_drivers() {
  echo "Installing recommended drivers"

  sudo ubuntu-drivers autoinstall
}

function install_debs() {
  echo "Downloading .deb files"

  for URL in "${DEB_FILES[@]}"; do
    wget "$URL"
  done

  sudo dpkg -i *deb
  sudo apt-get install -f
  rm -f *deb
}

function install_docker() {
  echo "Installing Docker"

  wget -qO- https://get.docker.com/ | sh
  sudo usermod -aG docker "$USER"
}

function install_docker_compose() {
  echo "Installing Docker Compose"

  curl -L https://raw.githubusercontent.com/docker/compose/master/script/run/run.sh > docker-compose
  chmod +x docker-compose
  sudo mv docker-compose /usr/local/bin/
}

function install_nvm() {
  echo "Installing NVM"

  wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | sh
  source "$HOME/.nvm/nvm.sh"
  nvm install stable
  nvm use stable
  nvm alias default stable
}

function install_node_modules() {
  echo "Installing  Node.js modules"

  NODE_MODULES=$(IFS=$" "; echo "${NODE_MODULES[*]}")
  npm install -g $NODE_MODULES
}

function install_miniconda() {
  echo "Installing Miniconda"

  wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh
  bash Miniconda-latest-Linux-x86_64.sh -b -p "$APPS_DIR/miniconda"
  rm Miniconda-latest-Linux-x86_64.sh
}

function update_miniconda() {
  echo "Updating Miniconda"

  export PATH="$APPS_DIR/miniconda/bin:$PATH"
  conda update -y conda
}

function install_python3() {
  echo "Installing Miniconda Python 3"

  conda create -y --name python3 python=3
}

function install_oh_my_zsh() {
  echo "Installing oh-my-zsh"

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

function install_zsh_plugins() {
  echo "Installing zsh plugins"

  cd "$HOME/.oh-my-zsh/custom/plugins"

  for URL in "${ZSH_PLUGINS[@]}"; do
    git clone "$URL"
  done

  cd -
}

function change_shell() {
  chsh -s `which zsh`
}

function clone_repository() {
  echo "Cloning the repository"

  git clone https://github.com/ivanovyordan/dotfiles.git "$DOTFILES_DIR"
}

function create_startup_scripts() {
  echo "Creating startup scripts"

  FILES=$(ls -A "$STARTUP_SOURCE_DIR")
  for FILE in $FILES; do
    echo "[Desktop Entry]" > "$STARTUP_DEST_DIR/$FILE.desktop"
    echo "Type=Application" >> "$STARTUP_DEST_DIR/$FILE.desktop"
    echo "Exec=$STARTUP_SOURCE_DIR/$FILE" >> "$STARTUP_DEST_DIR/$FILE.desktop"
    echo "Hidden=false" >> "$STARTUP_DEST_DIR/$FILE.desktop"
    echo "NoDisplay=false" >> "$STARTUP_DEST_DIR/$FILE.desktop"
    echo "X-GNOME-Autostart-enabled=true" >> "$STARTUP_DEST_DIR/$FILE.desktop"
    echo "Name=$FILE" >> "$STARTUP_DEST_DIR/$FILE.desktop"
    echo "Comment=$FILE" >> "$STARTUP_DEST_DIR/$FILE.desktop"
  done
}

function create_symlinks() {
  echo "Create links"

  FILES=$(ls -A "$LINK_SOURCE_DIR")
  for FILE in $FILES; do
    ln -sf "$LINK_SOURCE_DIR/$FILE" "$HOME"
  done
}

function install_vundle() {
  echo "Installing vundle"

  git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
}

function setup_vim() {
  echo "Setup vim"

  vim +PluginInstall +qall
}

function install_ycm() {
  echo "Installing YouCompleteMe"

  python "$HOME/.vim/bundle/YouCompleteMe/install.py" --clang-completer --tern-completer
}

function install_papirus() {
  echo "Installing Papirus theme"

  wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install-papirus-home-gtk.sh | sh
  wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-smplayer-theme/master/install-papirus-root.sh | sh
}

add_basic_packages
add_keys
add_respositories
update_repositories
install_system_packages
install_drivers
install_debs
install_docker
install_docker_compose
install_nvm
install_node_modules
install_miniconda
update_miniconda
install_python3
install_oh_my_zsh
install_zsh_plugins
change_shelll
clone_repository
create_startup_scripts
create_symlinks
install_vundle
setup_vim
install_ycm
install_papirus
}
