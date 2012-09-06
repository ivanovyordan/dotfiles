#!/bin/bash
echo "Dotfiles - Yordan Ivanov"

if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP

Usage: $(basename "$0")

See the README for documentation.
https://github.com/ivanov-yordan/dotfiles
HELP
exit; fi

# APT Repositories
repositories=(
	ppa:chris-lea/node.js
	ppa:webupd8team/sublime-text-2
	ppa:rabbitvcs/ppa
	ppa:otto-kesselgulasch/gimp
	ppa:hotot-team
)

# Install APT packages.
packages=(
	apache2
	autojump
	build-essential
	chromium-browser
	curl
	colordiff
	deluge
	dia
	gimp
	git-core
	git-flow
	hotot
	htop
	id3tool
	keepassx
	libssl-dev
	mail-notification
	meld
	mysql-server
	nmap
	nodejs
	npm
	php5-cli
	php5-curl
	php5-xdebug
	php-pear
	phpmyadmin
	python-software-properties
	rabbitvcs-cli
	rabbitvcs-gedit
	rabbitvcs-nautilus3
	skype
	sl
	sublime-text
	subversion
	telnet
	tree
	zsh
)

# Enables us to add new PPA repositories
sudo apt-get -qq install python-software-properties

# Install all repositories
echo "Install all repositories"
for repository in "${repositories[@]}"; do
	sudo add-apt-repository -y $repository
done

# Update respositories
echo "Update respositories"
sudo apt-get -qq -y update && sudo apt-get -y upgrade

# Install all packages
echo "Install all packages"
for package in "${packages[@]}"; do
	sudo apt-get -qq -y install $package
done

# Change default shell to zsh
echo "Change default shell to zsh"
chsh -s `which zsh`

# Update NPM registry
sudo npm search

# Install some npm packages
sudo npm install -g uglify-js

# Download these dotfiles
echo "Download these dotfiles"
git clone --recurse-submodules https://github.com/ivanov-yordan/dotfiles $HOME/.dotfiles

# Install my theme
ln -s $HOME/.dotfiles/link/ivanov-yordan.zsh-theme $HOME/.dotfiles/.oh-my-zsh/themes

# Install .zshrc
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ] then
	rm .zshrc
fi
ln -s $HOME/.dotfiles/link/.zshrc $HOME/.zshrc

/usr/bin/env zsh
source ~/.zshrc

echo "Dotfiles installed"