##########
# Common #
##########
# Allow aliases to be sudo’ed
alias sudo='sudo '

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../'
alias .......='cd ../../../../..'

# safer cmds with confirmations (-i)
alias rm='rm -irv'
alias mv='mv -iv'
alias cp='cp -ivr'
# better copying (can be used instead of scp)
alias copy='rsync -vrogp --log-file=/tmp/rsync.log --append --progress --size-only'
alias grep='grep --color=auto'
# Always create the tree and print out wtf you just created
alias mkdir='mkdir -pv'
# enable escape characters in echo statements
alias echo='echo -e'

# Destructive Commands
# You better know what you are doing with this one:
alias RM='rm -rvf'
# forced overwriting of symbolic links
alias lns='ln -vsif'

##################
## SYSTEM HEALTH #
##################

# prints out the path
alias path='echo -e ${PATH//:/\\n}'
alias wget="wget -c"
alias c="clear"
alias du='du -h --max-depth=1'
alias df='df -h'

#############
## NETWORKING
#############

# IP addresses
alias what_is_my_ip="curl icanhazip.com"

# Always use color output for `ls`
alias ls="command ls -CF --color"
alias ll="command ls -arlht --color"
# List only directories
alias lsd='ls -l --color | grep "^d"'

# Software Updates
alias update='sudo apt-get update && sudo apt-get upgrade'
alias meminfo='free -m -l -t'
alias cpuinfo='lscpu'
