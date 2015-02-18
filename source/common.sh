## Colorize the grep command output for ease of use (good for log files) ##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

## Start calculator with math support ##
alias bc='bc -l'

## Generate sha1 digest ##
alias sha1='openssl sha1'

## Install  colordiff package ##
alias diff='colordiff'

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

## Tune sudo and su ##
# become root #
alias root='sudo -i'
alias su='sudo -i'

## Pass halt/reboot via sudo ##
# reboot / halt / poweroff
alias reboot='sudo reboot'
alias poweroff='sudo poweroff'
alias halt='sudo halt'
alias shutdown='sudo shutdown'

## Resume wget by default ##
## this one saved my butt so many times ##
alias wget='wget -c'

# top is atop, just like vi is vim
alias top='atop'
