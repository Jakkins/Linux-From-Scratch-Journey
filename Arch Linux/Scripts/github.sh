#!/bin/bash

# Bash Variables
sourcepath=$( dirname "${BASH_SOURCE[0]}" )

if [ $# -eq 0 ]; then
	echo "Inserire qualche comando"
	echo "repos"
else
	if [ $1 = "repos" ]; then
		node $sourcepath/repos.js
	fi
fi









