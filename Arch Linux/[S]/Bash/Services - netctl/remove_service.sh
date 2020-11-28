#!/bin/bash

# ex. 
serviceName='netctl@wlp3s0\x2dHome\x26Life\x20SuperWiFi\x2dB089.service'
# serviceName="qualcosa.service"

echo ${serviceName}

systemctl stop ${serviceName}
systemctl disable ${serviceName}

# Rimozione dei Symlink
rm /etc/systemd/system/multi-user.target.wants/${serviceName}
rm /etc/systemd/system/${serviceName}
rm /etc/systemd/system/${serviceName} # and symlinks that might be related
rm /etc/init.d/${serviceName}
rm /usr/lib/systemd/system/${serviceName}
rm /usr/lib/systemd/system/${serviceName} # and symlinks that might be related

# REFRESH
systemctl daemon-reload
systemctl reset-failed
