#!/bin/bash
{ # this ensures the entire script is downloaded #
echo "Dotfiles - Yordan Ivanov"

# CONFIG #

## Link Directories ##
LINK_SOURCE_DIR="$HOME/.dotfiles/link/"
LINK_DEST_DIR="$HOME/"
STARTUP_SOURCE_DIR="$HOME/.dotfiles/startup/"

## APT Repositories ##
PPA_REPOSITORIES=(
	"ppa:git-core/ppa" # git
	"ppa:webupd8team/java" # Java
	"ppa:webupd8team/sublime-text-3" # Sublime text 3
	"ppa:nilarimogard/webupd8" # Screenkey
	"ppa:otto-kesselgulasch/gimp" # GIMP
	"ppa:numix/ppa" # Numix Theme
	"ppa:snwh/pulp" # Paper Theme
	"deb http://dl.google.com/linux/chrome/deb/ stable main" # Google Chrome
	"deb http://repository.spotify.com stable non-free" # Spotify
)

## DEB Repositories keys ##
APT_KEYS=(
	"wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -" # Google Chrome
	"sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886" # Spotify
)

## Packages ##
APT_PACKAGES=(
	# Qt related
	build-essential
	libgl1-mesa-dev
	libglu1-mesa-dev
	mesa-common-dev

	# VCS
	git-core
	git-flow
	git-extras

	# Development
	cmake # YouCompleteMe dependency
	python-dev # YouCompleteMe dependency
	oracle-java8-installer
	sublime-text-installer
	vim
	meld
	colordiff

	# DevOps
	virtualbox
	vagrant

	# Visual
	numix-gtk-theme
	numix-icon-theme
	numix-icon-theme-circle
	paper-gtk-theme

	# Other
	autojump
	curl
	google-chrome-stable
	zsh

	# Fun
	vlc
	smplayer
	spotify-client
	screenkey

	# GIMP
	gimp
	gimp-plugin-registry
	gimp-gmic
	gimp-lensfun
)

## Node.js Packages ##
NPM_PACKAGES=(
	grunt-cli
	gulp
	eslint
	hexo-cli
)

## Ruby Gems ##
RUBY_GEMS=(
	bundler
	sass
)

function create_starter {
	STARTER_PATH="$HOME/.config/autostart/$1.desktop"
	SCRIPT_PATH="$HOME/.dotfiles/startup/$1"

	touch "$STARTER_PATH"
	echo "[Desktop Entry]" >> "$STARTER_PATH"
	echo "Type=Application" >> "$STARTER_PATH"
	echo "Exec=$SCRIPT_PATH" >> "$STARTER_PATH"
	echo "Hidden=false" >> "$STARTER_PATH"
	echo "NoDisplay=false" >> "$STARTER_PATH"
	echo "X-GNOME-Autostart-enabled=true" >> "$STARTER_PATH"
	echo "Name=$1" >> "$STARTER_PATH"
}

# INSTALLATION #

## Add PPA Repositories ##
echo "Add new APT software repositories"
for REPOSITORY in "${PPA_REPOSITORIES[@]}"
do
	sudo add-apt-repository -y "$REPOSITORY"
done

## Add DEB Repository keys ##
echo "Add repository keys"
for KEY in "${APT_KEYS[@]}"
do
	$($KEY)
done

echo "Update repositories"
sudo apt-get -qq -y update && sudo apt-get -y upgrade

echo "Install packages"
APT_PACKAGES=$(IFS=$' '; echo "${APT_PACKAGES[*]}")
apt-get install -y "$APT_PACKAGES"

echo "Install NVM"
wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | sh
source "$HOME/.nvm/nvm.sh"
nvm install stable
nvm use stable
nvm alias default stable

echo "Install Node.js packages"
NPM_PACKAGES=$(IFS=$' '; echo "${NPM_PACKAGES[*]}")
npm install -g "$NPM_PACKAGES"

echo "Install RVM"
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://get.rvm.io | bash -s stable --ruby

echo "Install Ruby gems"
RUBY_GEMS=$(IFS=$' '; echo "${RUBY_GEMS[*]}")
gem install "$RUBY_GEMS"

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Clonning the repository #
echo 'clonning the repository'
git clone --recursive git@github.com:ivanovyordan/dotfiles.git .dotfiles

# SETTING UP #
echo "Create links"
ln -s "$LINK_SOURCE_DIR/*" "$LINK_DEST_DIR"

# Setup vim
vim +PluginInstall +qall
sh "$HOME/.vim/bundle/YouCompleteMe/install.sh"

echo "Create startup scripts"
FILES=$(ls -A "$STARTUP_SOURCE_DIR")
for FILE in $FILES
do
	create_starter "$FILE"
done

## Change default shell to zsh ##
echo "Change default shell to zsh"
chsh -s "$(which zsh)"

## Initialize antogen ##
echo 'Initialize antigen'
source "$HOME/.zshrc"

echo "Dotfiles installed"

} # this ensures the entire script is downloaded #
