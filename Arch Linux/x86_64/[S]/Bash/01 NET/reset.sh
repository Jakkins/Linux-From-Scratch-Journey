#!/bin/bash

# NetworkManager for wifi should be inactive or disabled
systemctl stop NetworkManager

# bho, serve
sudo rfkill unblock all

# per usare wifi-menu l'interfaccia deve essere DOWN
# per usare netctl pure
# 	wlp3s0: <BROADCAST,MULTICAST>
sudo ip link set wlp3s0 down

# start netctl
netctl list
# stop the profile everytime you touch the interface
sudo netctl stop-all
sudo netctl start Wifi
