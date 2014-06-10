#!/bin/bash
echo "Dotfiles - Yordan Ivanov"

# APT Repositories
sudo add-apt-repository ppa:git-core/ppa
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo add-apt-repository ppa:nilarimogard/webupd8

sudo apt-get -qq -y update && sudo apt-get -y upgrade

sudo apt-get install\
	autojump\
	uild-essential\
	curl\
	colordiff\
	dropbox\
	skype\
	freshplayerplugin\
	git-core\
	git-flow\
	git-extras\
	meld\
	subversion\
	sublime-text-installer\
	vim\
	vlc\
	zsh\
	apache2\
	php5\
	php5-curl\
	php5-gd\
	php5-mcrypt\
	php5-xdebug\
	php-pear\
	mysql-server\
	mysql-client\
	phpmyadmin\
	mesa-common-dev\
	libgl1-mesa-dev\
	libglu1-mesa-dev

# Install vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Install RVM
curl -sSL https://get.rvm.io | bash -s stable --ruby

# Install NVM
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Install Node.js
nvm install 0.10.28
nvm use 0.10.28
nvm alias default 0.10.28

# Configure Apache Document Root
sudo adduser $USER www-data
sudo chgrp -hR www-data $HOME/workspace/

sudo cp /etc/apache2/sites-available/default /etc/apache2/sites-available/localhost
sudo ln -s /etc/apache2/sites-available/localhost /etc/apache2/sites-enabled/localhost
sudo sed -i "s/var\/www/home\/$USER\/workspace/g" /etc/apache2/sites-available/localhost
sudo a2enmod rewrite
sudo service apache 2 restart

# Clone the .dotfiles
git clone --recurse-submodules https://github.com/ivanov-yordan/dotfiles.git $HOME/.dotfiles

# Link default theme
ln -s $HOME/.dotfiles/custom/ivanov-yordan.zsh-theme $HOME/.dotfiles/oh-my-zsh/themes/

# Change default shell to zsh
echo "Change default shell to zsh"
chsh -s `which zsh`

/usr/bin/env zsh
source ~/.zshrc

# Install Ruby gems
gem install\
	sass\
	compass

# Install Node.js packages
npm install -g\
	grunt-cli\
	bower\
	less\
	jshint\
	csslint\
	uglify-js\
	hexo

# Link files
ln -s $HOME/.dotfiles/link/* $HOME/

echo "Dotfiles installed"
