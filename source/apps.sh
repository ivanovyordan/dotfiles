# Use aptitude if installed, or apt-get if not.
# You can just set apt_pref='apt-get' to override it.
if [[ -e $( which apt-get ) ]]; then
    apt_pref='apt-get'
else
    apt_pref='aptitude'
fi


# distro specific  - Debian / Ubuntu and friends #
# install with apt-get
alias apt-get="sudo $apt_pref" 
alias updatey="sudo $apt_pref --yes" 

# Package management
alias update="sudo $apt_pref -qq update && sudo $apt_pref upgrade"
alias install="sudo $apt_pref install"
alias remove="sudo $apt_pref remove"
alias search="apt-cache search"

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
alias vi=vim 
alias svi='sudo vi' 
alias vis='vim "+set si"' 
alias edit='vim'
alias subl='/usr/bin/env sublime-text'
