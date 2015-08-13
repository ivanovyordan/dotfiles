#!/bin/bash
echo "Dotfiles - Yordan Ivanov"

# CONFIG #

## Link Directories ##
LINK_SOURCE_DIR="$HOME/.dotfiles/link/"
LINK_DEST_DIR="$HOME/"
STARTUP_SOURCE_DIR="$HOME/.dotfiles/startup/"

## APT Repositories ##
PPA_REPOSITORIES=(
	"ppa:git-core/ppa" # git
	"ppa:webupd8team/sublime-text-3" # Sublime text 3
	"ppa:webupd8team/popcorntime" # Popcorn time
	"ppa:otto-kesselgulasch/gimp" # GIMP
	"ppa:numix/ppa" # Numix
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
	sublime-text-installer
	vim
	meld
	colordiff

	# Visual
	numix-gtk-theme
	numix-icon-theme
	numix-icon-theme-circle

	# Other
	autojump
	curl
	google-chrome-stable
	python-gpgme
	zsh

	# Fun
	vlc
	spotify-client
	popcorn-time

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
	csslint
	eslint
	hexo-cli
)

## Ruby Gems ##
RUBY_GEMS=(
	sass
	compass
)

function create_starter {
	STARTER_PATH="$HOME/.config/autostart/$1.desktop"
	SCRIPT_PATH="$HOME/.dotfiles/startup/$1"

	touch FILENAME
	cat "[Desktop Entry]" >> $STARTER_PATH
	cat "Type=Application" >> $STARTER_PATH
	cat "Exec=$SCRIPT_PATH" >> $STARTER_PATH
	cat "Hidden=false" >> $STARTER_PATH
	cat "NoDisplay=false" >> $STARTER_PATH
	cat "X-GNOME-Autostart-enabled=true" >> $STARTER_PATH
	cat "Name=$1" >> $STARTER_PATH
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
for KEY in "${REPOSITORY_KEYS[@]}"
do
	$($KEY)
done

echo "Update repositories"
sudo apt-get -qq -y update && sudo apt-get -y upgrade

echo "Install packages"
APT_PACKAGES=$(IFS=$' '; echo "${APT_PACKAGES[*]}")
apt-get install -y $APT_PACKAGES

echo "Install NVM"
wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | sh
source $HOME/.nvm/nvm.sh
nvm install stable
nvm use stable
nvm alias default stable

echo "Install Node.js packages"
NPM_PACKAGES=$(IFS=$' '; echo "${NPM_PACKAGES[*]}")
npm install -g $NPM_PACKAGES

echo "Install RVM"
curl -sSL https://get.rvm.io | bash -s stable --ruby
source $HOME/.rvm/scripts/rvm

echo "Install Ruby gems"
RUBY_GEMS=$(IFS=$' '; echo "${RUBY_GEMS[*]}")
gem install $RUBY_GEMS

# Clonning the repository #
echo 'clonning the repository'
git clone --recursive git@github.com:ivanovyordan/dotfiles.git

# SETTING UP #
echo "Create links"
FILES=$(ls -A "$LINK_SOURCE_DIR")
for FILE in $FILES
do
	ln -s "$LINK_SOURCE_DIR/$FILE" "$LINK_DEST_DIR/$FILE"
done

echo "Create startup scripts"
FILES=$(ls -A "$STARTUP_SOURCE_DIR")
for FILE in $FILES
do
	create_starter $FILE
done

## Change default shell to zsh ##
echo "Change default shell to zsh"
chsh -s $(which zsh)

## Initialize antogen ##
echo 'Initialize antigen'
source $HOME/.zshrc

echo "Dotfiles installed"
