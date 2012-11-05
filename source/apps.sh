# Use aptitude if installed, or apt-get if not.
# You can just set apt_pref='apt-get' to override it.
if [[ -e $( which aptitude ) ]]; then
	apt_pref='aptitude'
else
	apt_pref='apt-get'
fi
apt_pref='apt-get'

# distro specific  - Debian / Ubuntu and friends #
# install with apt-get
alias apt-get="sudo $apt_pref" 
alias updatey="sudo $apt_pref --yes" 

# Package management
alias update="sudo $apt_pref -qq update && sudo $apt_pref upgrade"
alias install="sudo $apt_pref install"
alias remove="sudo $apt_pref remove"
alias clean="sudo apt-get autoremove && sudo apt-get autoclean"
alias search="apt-cache search"

# Create a basic .deb package
alias mydeb='time dpkg-buildpackage -rfakeroot -us -uc'

# Prints apt history
# Usage:
#   apt-history install
#   apt-history upgrade
#   apt-history remove
#   apt-history rollback
#   apt-history list
# Based On: http://linuxcommando.blogspot.com/2008/08/how-to-show-apt-log-history.html
apt-history () {
	case "$1" in
		install)
			zgrep --no-filename 'install ' $(ls -rt /var/log/dpkg*)
			;;
		upgrade|remove)
			zgrep --no-filename $1 $(ls -rt /var/log/dpkg*)
			;;
		rollback)
			zgrep --no-filename upgrade $(ls -rt /var/log/dpkg*) | \
				grep "$2" -A10000000 | \
				grep "$3" -B10000000 | \
				awk '{print $4"="$5}'
			;;
		list)
			zcat $(ls -rt /var/log/dpkg*)
			;;
		*)
			echo "Parameters:"
			echo " install - Lists all packages that have been installed."
			echo " upgrade - Lists all packages that have been upgraded."
			echo " remove - Lists all packages that have been removed."
			echo " rollback - Lists rollback information."
			echo " list - Lists all contains of dpkg logs."
			;;
	esac
}


# Web browsers
alias ff='firefox&'
alias chrome='chromium-browser&'
alias browser='x-www-browser&'

## Desktop specific - play avi/mp3 files on demand ##
## play video files in a current directory ##
# cd ~/Download/movie-name 
alias playavi='mplayer *.avi'
alias playavi='vlc *.avi'

# play all music files from the current directory #
alias playwave='for i in *.wav; do banshee "$i"; done'
alias playogg='for i in *.ogg; do banshee "$i"; done'
alias playmp3='for i in *.mp3; do banshee "$i"; done'

# play files from nas devices #
alias nplaywave='for i in /nas/multimedia/wave/*.wav; do banshee "$i"; done'
alias nplayogg='for i in /nas/multimedia/ogg/*.ogg; do banshee "$i"; done'
alias nplaymp3='for i in /nas/multimedia/mp3/*.mp3; do banshee "$i"; done'

## Editors ##
alias vi='vim'
alias svi='sudo vi'
alias vis='vim "+set si"'
alias edit='vim'
