# Package management
alias update="sudo apt-get update && sudo apt-get upgrade"
alias install="sudo apt-get install"
alias remove="sudo apt-get remove"
alias clean="sudo apt-get autoremove && sudo apt-get autoclean"
alias search="apt-cache search"

# Web browsers
alias ff="firefox &"
alias chrome="google-chrome &"
alias browser="x-www-browser &"

# Docker
alias drm="docker rm $(docker ps -a -q)"
alias drmi="docker rmi $(docker images -q)"
