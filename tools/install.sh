#!/bin/bash
echo "Dotfiles - Yordan Ivanov"

# APT Repositories
apt_repositories=(
	"ppa:git-core/ppa" # git
	"ppa:webupd8team/sublime-text-3" # Sublime text 3
	"ppa:webupd8team/popcorntime" # Popcorn time
	"ppa:versable/elementary-update" # Customization
	"ppa:nitrux/nitrux-artwork" # Nitrux icons
	"ppa:numix/ppa" # Numix icons
	"ppa:moka/stable" # Moka icons
	"ppa:otto-kesselgulasch/gimp"
	"deb http://dl.google.com/linux/chrome/deb/ stable main" # Google Chrome
)

# Packages
packages=(
	# Compilers
	build-essential
	libgl1-mesa-dev # Qt related
	libglu1-mesa-dev # Qt related
	mesa-common-dev # Qt related

	# CLI
	autojump
	curl
	zsh

	# VCS
	git-core
	git-flow

	python-gpgme
	dropbox

	# Text Editors
	sublime-text-installer
	vim

	# Text diff
	meld
	colordiff

	# WEB
	curl
	google-chrome-stable
	firefox
	thunderbird
	adobe-flashplugin
	icedtea-plugin
	deluge

	# Fun
	skype
	vlc
	popcorn-time
	foto
	steam-launcher
	ubuntu-restricted-extras

	# Customization
	elementary-tweaks
	elementary-artwork
	elementary-wallpaper-collection
	numix-icon-theme-circle
	faba-colors
	faba-icon-theme
	faba-mono-icons
	compass-icon-theme
	nitrux-icon-theme
	elementary-*-theme
	elementary-*-icons

	# GIMP
	gimp
	gimp-plugin-registry
	gimp-gmic
	gimp-lensfun
)

npm_packages=(
	grunt-cli
	bower
	less
	jshint
	csslint
	uglify-js
	hexo
)

gems=(
	sass
	compass
)

echo 'Add new software repositories'
for repository in "${apt_repositories[@]}"
do
	sudo add-apt-repository -y $repository
done

echo 'Update repositories'
sudo apt-get -qq -y update && sudo apt-get -y upgrade

echo 'Install packages'
packages=$(IFS=$' '; echo "${packages[*]}")
apt-get install -y $packages

echo 'Install git-extras'
(cd /tmp && git clone --depth 1 https://github.com/visionmedia/git-extras.git && cd git-extras && sudo make install)

echo 'Install vundle'
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo 'Install NVM'
wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | sh
source $HOME/.nvm/nvm.sh
nvm install 0.10
nvm use 0.10
nvm alias default 0.10

echo 'Install Node.js packages'
npm_packages=$(IFS=$' '; echo "${npm_packages[*]}")
apt-get install -y $npm_packages

echo 'Install RVM'
curl -sSL https://get.rvm.io | bash -s stable --ruby
source $HOME/.rvm/scripts/rvm

echo 'Install Ruby gems'
gems=$(IFS=$' '; echo "${gems[*]}")
apt-get install -y $gems

echo 'Clone the .dotfiles'
git clone --recurse-submodules https://github.com/ivanov-yordan/dotfiles.git $HOME/.dotfiles
cd $HOME/.dotfiles
git submodule foreach git pull origin master

echo 'Link files'
rm $HOME/.zshrc

folder="$HOME/.dotfiles/link"
files=`ls -a "$folder"`
for file in $files; do
	if [[ "$file" != "." && "$file" != ".." ]]; then
		ln -s "$folder/$file" "$HOME/$file"
	fi
done

# Change default shell to zsh
echo 'Change default shell to zsh'
chsh -s `which zsh`

echo 'Dotfiles installed'
