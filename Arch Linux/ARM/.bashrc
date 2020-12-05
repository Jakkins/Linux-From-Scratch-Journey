#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

pIP=$(ping -R 1.1.1.1 -c 1 | grep RR -A 1 | tail -1)
# many options are available in bash to remove unwanted characters from string data, such as parameter expansion, sed, awk, xargs, etc.

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias la="ls -A"
alias ll='ls -alF'
alias l='ls -CF'

yellow=$(tput setaf 226)
orange=$(tput setaf 3)
white=$(tput setaf 255)
lightblue=$(tput setaf 014)
green=$(tput setaf 118)
violet=$(tput setaf 198)
bold=$(tput bold)
reset=$(tput sgr0)

PS1='${bold}${yellow}[\w] \n'			 # path
PS1+='${violet}\t'				 # time
PS1+='${orange} RASPBERRY - $pIP (or ping -R 1.1.1.1)'
PS1+='\n'
PS1+='$(tput setaf 49)\u'            		 # user
PS1+='${white}@'                		  # @
PS1+='$(tput setaf 196)\h: $(tput setaf 213)'         # host
