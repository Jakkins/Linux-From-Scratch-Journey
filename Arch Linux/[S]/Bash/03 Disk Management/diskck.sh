#!/bin/bash

# prende l'argomento passato
PATHDISK=$1

sudo /bin/bash << EOF

	if [ ! -d /mnt/one/ ]; then
		# Control will enter here if $DIRECTORY doesn't exist.
		mkdir /mnt/one/
	fi
	
    mount $PATHDISK /mnt/one
    df -H $PATHDISK --output=size,used,avail
    
    du /mnt/one -hd 1
    
    umount $PATHDISK   
EOF
