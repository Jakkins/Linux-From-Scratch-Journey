#!/bin/bash

# sudo netctl start /etc/netctl/wlp1
sudo netctl start wlp1
read

# Cosi ha funzionato
# [/etc/netctl]
# -> sudo netctl start wlp1

# enable e start fanno 2 cose diverse

# Con questo comando ho 2 servizi diversi
# netctl@-etc-netctl-wlp1.service	-> questo ha fallito
# netctl@wlp1.service     			-> questo e' quello che ho attivato con il comando sopra
