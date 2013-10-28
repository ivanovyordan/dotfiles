#!/bin/bash
echo "Dotfiles - Yordan Ivanov"

# APT Repositories
repositories=(
	ppa:git-core/ppa
	ppa:chris-lea/node.js
	ppa:webupd8team/sublime-text-3
)

# Install APT packages.
packages=(
	autojump
	build-essential
	colordiff
	curl
	deluge
	git-core
	git-flow
	htop
	meld
	nodejs
	skype
	sublime-text-installer
	subversion
	telnet
	tidy
	tree
	vim
	vlc
	zsh
)

# Node.js Packages
node_packages=(
	grunt-cli
	bower
	yo
	generator-webapp
	generator-angular
	less
	jslint
	jshint
	csslint
	coffee-script
	express
	uglify-js
)

# Gems
gems=(
	compass
	github
	rake
	sass
)


other_commands=(
	# git-extras
	"cd /tmp && git clone --depth 1 https://github.com/visionmedia/git-extras.git && cd git-extras && sudo make install",
	# Vundle
	"git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle"
	# Liquid Prompt
	"git clone https://github.com/nojhan/liquidprompt.git ~/.liquidprompt && cp ~/.liquidprompt/liquidpromptrc-dist ~/.config/liquidpromptrc",
	# Install RVM
	"curl -L https://get.rvm.io | bash -s stable --rails --autolibs=enabled"
)


# Install all repositories
echo "Install all repositories"
for repository in "${repositories[@]}"; do
	sudo add-apt-repository -y $repository
done

#Update respositories
echo "Update respositories"
sudo apt-get -qq -y update && sudo apt-get -y upgrade

# Install APT packages
echo "Install APT packages"
for package in "${packages[@]}"; do
	sudo apt-get -qq -y install $package
done

# Install Node.js packages
echo "Install Node.js packages"
for package in "${node_packages[@]}"; do
	sudo npm install -g $package
done

# Exec other commands
echo "Exec other commands"
for command in "${other_commands[@]}"; do
	$command
done

# Clone the .dotfiles
# git clone --recurse-submodules https://github.com/ivanov-yordan/dotfiles.git $HOME/.dotfiles

# Link files
for file in $HOME/.dotfiles/link/*; do
	ln -s $HOME/.dotfiles/link/$file $HOME
done

# Change default shell to zsh
echo "Change default shell to zsh"
chsh -s `which zsh`


/usr/bin/env zsh
source ~/.zshrc

# Update Ruby gems
echo "Update Ruby gems"
sudo gem update

# Install Ruby gems
echo "Install Ruby gems"
for package in "${gems[@]}"; do
	sudo gem install $package
done

echo "Dotfiles installed"