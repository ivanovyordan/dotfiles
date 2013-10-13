#!/bin/bash
echo "Dotfiles - Yordan Ivanov"

# APT Repositories
repositories=(
	ppa:git-core/ppa
	ppa:chris-lea/node.js
	ppa:rabbitvcs/ppa
	ppa:teejee2008/ppa
	ppa:webupd8team/sublime-text-3
)

# Install APT packages.
packages=(
	apache2
	autoconf
	automak
	autojump
	bison
	build-essential
	colordiff
	curl
	deluge
	dia
	filezilla
	git-core
	git-flow
	git-extras
	htop
	id3tool
	libtool
	libc6-dev
	libreadline6
	libreadline6-dev
	libyaml-dev
	libsqlite3-0
	libsqlite3-dev
	libxml2-dev
	libxslt-dev
	libssl-dev
	meld
	mysql-server
	ncurses-dev
	nmap
	nodejs
	npm
	openssl
	php5-cli
	php5-curl
	php5-xdebug
	php-pear
	phpmyadmin
	rabbitvcs-nautilus3
	sqlite3
	skype
	sl
	sublime-text-installer
	subversion
	telnet
	tidy
	tree
	vim
	zlib1g
	zlib1g-dev
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
	# Vundle
	"git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle"
	# Liquid Prompt
	"git clone https://github.com/nojhan/liquidprompt.git ~/.liquidprompt && cp ~/.liquidprompt/liquidpromptrc-dist ~/.config/liquidpromptrc",
	# Composer
	"curl -s http://getcomposer.org/installer | php && mv composer.phar /usr/bin/composer"
	# PHP CS
	"sudo pear install PHP_CodeSniffer"
	# PHP CS Fixer
	"sudo curl http://cs.sensiolabs.org/get/php-cs-fixer.phar -o /usr/local/bin/php-cs-fixer && sudo chmod a+x /usr/local/bin/php-cs-fixer"
	# PHP MD
	"sudo pear channel-discover pear.phpmd.org && sudo pear channel-discover pear.pdepend.org && sudo pear install --alldeps phpmd/PHP_PMD"
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

# Update NPM registry
echo "Update NPM registry"
sudo npm search && sudo npm update -g

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
git clone --recurse-submodules https://github.com/ivanov-yordan/dotfiles.git $HOME/.dotfiles

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