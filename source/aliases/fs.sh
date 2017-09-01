# Files will be created with these permissions:
# files 644 -rw-r--r-- (666 minus 022)
# dirs  755 drwxr-xr-x (777 minus 022)
umask 022

# Parenting changing perms on /
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# File size
alias fs="stat -f '%z bytes'"
alias df="df -h"
alias du='du -ch'

# Create parent directories on demand
alias mkdir='mkdir -pv'

# Confirmation
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# Make mount command output pretty and human readable format
alias mount='mount | column -t'
