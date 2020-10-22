echo "bashrc fa ciao :)"
alias la="ls -a --color=auto"

yellow=$(tput setaf 226)
orange=$(tput setaf 3)
white=$(tput setaf 255)
lightblue=$(tput setaf 014)
green=$(tput setaf 118)
violet=$(tput setaf 198)
bold=$(tput bold)
reset=$(tput sgr0)

PS1='\n'                          # \033]0;\w\007 -> setta il titolo
PS1+='${bold}'
PS1+='${yellow}[\w] \n'
PS1+='${orange}\u'              #user
PS1+='${white}@'                #
PS1+='${lightblue}\h'           #host
PS1+='${violet} ---- \t - reminder: use verbose'
PS1+='\n${green}-> '
