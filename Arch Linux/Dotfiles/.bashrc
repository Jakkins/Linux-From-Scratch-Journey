echo "bashrc fa ciao :)"

export PATH=~/scripts:$PATH
export PATH=~/.gem/ruby/2.7.0/bin:$PATH

alias dev="cd ${HOME}/0ROOT/\[PrivateDev\]/; la"
alias javadev="cd /home/sam/0ROOT/\[Dev\]/Java/"
alias gitdev="cd ~/0ROOT/\[Github\]/"

# emulator first then tools
export ANDROID_HOME=~/0ROOT/AndroidSdk
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/emulator:$PATH

# separate file for ~/.bash_aliases ?
#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias la="ls -A"
alias ll='ls -alF'
alias l='ls -CF'

alias p="pacman"

yellow=$(tput setaf 226)
orange=$(tput setaf 3)
white=$(tput setaf 255)
lightblue=$(tput setaf 014)
green=$(tput setaf 118)
violet=$(tput setaf 198)
bold=$(tput bold)
reset=$(tput sgr0)

## RANDOM REMINDER # --------------------------
number_of_lines=$(wc -l < ./0ROOT/reminders)
lineis=$(($RANDOM%$number_of_lines))
counter=0
while read -r line; do
	if [ $counter -eq $lineis ]; then
		reminder=$line
		break
	fi
	((counter++))
done < ~/0ROOT/reminders
# ---------------------------------------------

PS1='${bold}${yellow}[\w] \n'			         # path
PS1+='${violet}\t'								 # time
PS1+='${orange} ${reminder}'
PS1+='\n'
PS1+='${orange}\u'              				 # user
PS1+='${white}@'                				 # @
PS1+='${lightblue}\h: $(tput setaf 213)'         # host

##
# you might use awk to get rid of the file name appended to the line number as such: wc -l <file> | awk '{print $1}

#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\>
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
