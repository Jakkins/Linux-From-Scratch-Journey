#!/bin/bash

# ------------------------------------
#
# cd /home/tree/projects/java
#
# I saved this file as proj
# added execute permission with chmod
# --- copied it to /usr/bin --- 
# When I call it by: proj, it does nothing. What am I doing wrong?
# -----------------------------------------
# Shell scripts are run inside a subshell
# -----------------------------------------
#
#	--- SOLUZIONE ---
#	path="/home/sam/Spaced Path/"
#	cd "$path"

# path="/home/sam/Desktop/Programmazione/React Native/AppTest"

#termite -e 'npx react-native start --verbose' &
#termite -e 'npx react-native run-android --verbose'

if [ $# -eq 0 ]; then
	echo "Inserire il path del progetto"
else
	path1="/home/sam/Desktop/[Programmazione]/React Native/"
	path2=$1
	if [ $1 = "--cat" ]; then
		cat -ns "/usr/local/bin/rn-start-app.sh"
	elif [ $1 = "--list" ]; then
		cd "$path1"
		ls -d */ | sort
	elif [ $1 = "--help" ]; then
		echo 'rn-start-app.sh <AppName>'
		echo 'rn-start-app.sh --cat'
		echo 'rn-start-app.sh --list'
	else
		pkill node -ec
		pkill java -ec
		pkill electron -ec
		pkill qemu -ec # l'emulatore funziona con qemu
		echo $path1$path2
		termite -d "$path1$path2" -e 'npx react-native start --verbose' --hold	
	fi
fi


