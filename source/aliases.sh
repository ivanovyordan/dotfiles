# Power
alias reboot='sudo reboot'
alias poweroff='sudo poweroff'
alias halt='sudo halt'
alias shutdown='sudo shutdown'

# Package management
alias addrepo="sudo apt-add-repository"
alias update="sudo apt update; sudo apt upgrade"
alias upgrade="sudo apt full-upgrade"
alias install="sudo apt install"
alias remove="sudo apt remove"
alias clean="sudo apt autoremove; sudo apt autoclean"
alias search="apt search"

# Docker
alias dockerkillall='docker kill $(docker ps -q)'
alias dockercleanc='docker rm $(docker ps -a -q)'
alias dockercleani='docker rmi $(docker images -q -f dangling=true)'
alias dockerclean='dockercleanc || true && dockercleani'

# Other
alias mux='tmuxinator'
alias screencast='ffmpeg -f x11grab -s 1920x1080 -i :0.0 -f pulse -ac 2 -i default -vcodec libx264 -pix_fmt yuv420p -preset ultrafast -vsync 2 -acodec libmp3lame -ar 44100 -ab 128k -f flv'
