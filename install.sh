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
	graphviz

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
	whois
	zsh

	# Fun
	vlc
	smplayer
	spotify-client
	screenkey
	cowsay
	fortune-mod

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
	typescript
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

echo "Install Docker"
wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker "$USER"

echo "Install Docker Compose"
curl -L https://raw.githubusercontent.com/docker/compose/master/script/run/run.sh > docker-compose
chmod +x docker-compose
sudo mv docker-compose /usr/local/bin/

mkdir -p $HOME/.zsh/completion
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/zsh/_docker-compose > $HOME/.zsh/completion/_docker-compose

echo "Install NVM"
wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | sh
source "$HOME/.nvm/nvm.sh"
nvm install stable
nvm use stable
nvm alias default stable

echo "Install Node.js packages"
NPM_PACKAGES=$(IFS=$' '; echo "${NPM_PACKAGES[*]}")
npm install -g "$NPM_PACKAGES"

echo "Install Miniconda"
wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh
bash Miniconda-latest-Linux-x86_64.sh -b -p $HOME/.applications/miniconda
rm Miniconda-latest-Linux-x86_64.sh

echo "Update Miniconda"
export PATH="$HOME/.applications/miniconda/bin:$PATH"
conda update -y conda

echo "Install Miniconda Python 3"
conda create -y --name python3 python=3

echo "Install RVM"
curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
curl -sSL https://get.rvm.io | bash -s stable --ruby
source "$HOME/.rvm/scripts/rvm"

echo "Install Ruby gems"
RUBY_GEMS=$(IFS=$' '; echo "${RUBY_GEMS[*]}")
gem install "$RUBY_GEMS"

# Setup ADB rules
sudo wget "http://source.android.com/source/51-android.rules" -O "/etc/udev/rules.d/51-android.rules"
sudo sed -i "s/<username>/${USER}/g" "/etc/udev/rules.d/51-android.rules"
sudo chmod 644 "/etc/udev/rules.d/51-android.rules"
sudo service udev restart


# Clonning the repository #
echo 'Clonning the repository'
git clone --recursive git@github.com:ivanovyordan/dotfiles.git "$HOME/.dotfiles"

# SETTING UP #
echo "Create links"
ln -s "$LINK_SOURCE_DIR/*" "$LINK_DEST_DIR"

# Setup vim
# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
$HOME/.vim/bundle/YouCompleteMe/install.py --all
vim +PluginInstall +qall

echo "Create startup scripts"
FILES=$(ls -A "$STARTUP_SOURCE_DIR")
for FILE in $FILES
do
	create_starter "$FILE"
done

## Change default shell to zsh ##
echo "Change default shell to zsh"
chsh -s "$(which zsh)"

## Reload shell ##
echo "Initialize antigen"
exec $SHELL -l

echo "Dotfiles installed"

} # this ensures the entire script is downloaded #
