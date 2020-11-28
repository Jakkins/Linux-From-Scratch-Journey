#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Inserire il nome del progetto"
else
	path1="/home/sam/Desktop/[Programmazione]/React Native/"
	path2=$1
	if [ $1 = "--cat" ]; then
		cat -ns "/usr/local/bin/rn-start-emulator.sh"
	elif [ $1 = "--list" ]; then
		cd "$path1"
		ls -d */ | sort
	elif [ $1 = "--help" ]; then
		echo 'rn-emulator-app.sh <AppName>'
		echo 'rn-emulator-app.sh --cat'
		echo 'rn-emulator-app.sh --list'
	else
		pkill qemu -c # l'emulatore funziona con qemu
		echo $path1$path2
		termite -d "$path1$path2" -e 'npx react-native run-android --verbose ' --hold
	fi
fi









