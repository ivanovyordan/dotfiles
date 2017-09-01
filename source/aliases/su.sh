# Tune sudo and su
alias root='sudo -i'
alias su='sudo -i'

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
