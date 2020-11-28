#!/bin/bash

# il pipe | si puo chiamare anche cosi <

# ls -l | cat
# oppure
# cat <(ls -l) <(ls -la)

ls -a | sort -r # -r ordina al rovescio

echo -e "`whoami`
	e sono in `pwd`
	e ho
	`ls -la`"
