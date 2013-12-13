#!/bin/bash
echo "Dotfiles - Yordan Ivanov"

# APT Repositories
repositories=(
	ppa:git-core/ppa
	ppa:webupd8team/sublime-text-3
)

# Install APT packages.
packages=(
	autojump
	build-essential
	colordiff
	curl
	deluge
	dropbox
	git-core
	git-flow
	git-extras
	htop
	meld
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
	sass
)

other_commands=(
	# Vundle
	"git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle"
	# Liquid Prompt
	"git clone https://github.com/nojhan/liquidprompt.git ~/.liquidprompt && cp ~/.liquidprompt/liquidpromptrc-dist ~/.config/liquidpromptrc",
	# Install RVM
	"curl -L https://get.rvm.io | bash -s stable --rails --autolibs=enabled"
	# Install NVM
	"curl https://raw.github.com/creationix/nvm/master/install.sh | sh"
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

# Exec other commands
echo "Exec other commands"
for command in "${other_commands[@]}"; do
	$command
done

# Clone the .dotfiles
git clone --recurse-submodules https://github.com/ivanov-yordan/dotfiles.git $HOME/.dotfiles

# Link files
for file in `ls -a $HOME/.dotfiles/link/`; do
	if [[ $file != "." && $file != ".." ]]; then
		ln -s $HOME/.dotfiles/link/$file $HOME
	fi
done

# Add startup scripts files
for file in `ls -a $HOME/.dotfiles/startup/`; do
	if [[ "$file" != "." && "$file" != ".." ]]; then
		sudo ln -s $HOME/.dotfiles/startup/$file /etc/init.d/
		sudo update-rc.d $file defaults
	fi
done

# Change default shell to zsh
echo "Change default shell to zsh"
chsh -s `which zsh`

/usr/bin/env zsh
source ~/.zshrc

# Update Ruby gems
echo "Update Ruby gems"
gem update

# Install Ruby gems
echo "Install Ruby gems"
for package in "${gems[@]}"; do
	gem install $package
done

# Install Node.js
nvm install 0.10.23
nvm use 0.10.23
nvm alias default 0.10.23

# Install Node.js packages
echo "Install Node.js packages"
for package in "${node_packages[@]}"; do
	npm install -g $package
done

echo "Dotfiles installed"