#!/bin/bash

# 1. crea un wpa_supplicant.conf
	# man wpa_supplicant.conf

# wpa_supplicant -Dnl80211 -iwlp3s0 -c/etc/wpa_supplicant.conf
# -D driver
# -i interface

# *_* Ha funzionato *.*
# 1. lancio questo comando
	# sudo wpa_supplicant -Dwext -iwlp3s0 -c/etc/wpa_supplicant.conf
	# DOPO CHE FALLISCE, lancio questo
sudo wpa_supplicant -iwlp3s0 -c/etc/wpa_supplicant.conf

# Con queste conf
# network={
# 	ssid="Home&Life SuperWiFi-B089"
# 	scan_ssid=1
# 	key_mgmt=WPA-PSK
# 	psk=b74ee21ee1a32fa7e0e56cdc9e95e86d01b6673969b216d736778df00066cbdb
# }

# --------------------------------------
# netctl or wpa_supplicant ???
	# Ora come ora con queste impostazioni il wifi si comporta in modo strano
	# wifi-menu e netctl sembrano piu' stabili e qualitativamente migliori
