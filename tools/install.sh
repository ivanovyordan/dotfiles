#!/bin/bash
echo "Dotfiles - Yordan Ivanov"

# APT repositories
sudo add-apt-repository ppa:git-core/ppa
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo add-apt-repository ppa:nilarimogard/webupd8

# Add Google Chrome to sources list
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# Update the system
sudo apt-get -qq -y update && sudo apt-get -y upgrade

# Install packages
sudo apt-get install\
	autojump\
	build-essential\
	curl\
	colordiff\
	dropbox\
	freshplayerplugin\
	git-core\
	git-flow\
	git-extras\
	google-chrome-stable\
	lamp-server^\
	libgl1-mesa-dev\
	libglu1-mesa-dev\
	meld\
	mesa-common-dev\
	openssh-server\
	phpmyadmin\
	python-gpgme\
	skype\
	steam-launcher\
	subversion\
	sublime-text-installer\
	vim\
	vlc\
	zsh

# Install vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Install RVM
curl -sSL https://get.rvm.io | bash -s stable --ruby

# Install NVM
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.7.0/install.sh | sh

# Install Node.js
nvm install 0.10.28
nvm use 0.10.28
nvm alias default 0.10.28

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

# Clone the .dotfiles
git clone --recurse-submodules https://github.com/ivanov-yordan/dotfiles.git $HOME/.dotfiles

# Link default theme
ln -s $HOME/.dotfiles/custom/ivanov-yordan.zsh-theme $HOME/.dotfiles/oh-my-zsh/themes/

# Link files
rm $HOME/.zshrc
find $HOME/.dotfiles/link/ -maxdepth 1 -print "%P\n" | while read file; do ln -s "$HOME/.dotfiles/link/$file" "$HOME/$file"; done

# Configure Apache
sudo ln -s /var/www/html $HOME/public_html
sudo adduser $USER www-data
sudo chown -R $USER:www-data $HOME/public_html
sudo a2enmod rewrite
sudo cp /etc/apache2/sites-available/default{,.backup}
udo sed -i "s/AllowOverride\ None/None \None/g" /etc/apache2/sites-available/default
sudo service apache2 restart

# Change default shell to zsh
echo "Change default shell to zsh"
chsh -s `which zsh`

echo "Dotfiles installed"