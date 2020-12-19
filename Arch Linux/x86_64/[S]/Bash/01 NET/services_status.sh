
# for wifi should be inactive/disabled
systemctl status NetworkManager &
echo '###################################################'
echo 'NetworkManager for wifi should be disabled/inactive'
echo '###################################################'

systemctl | grep net  

read

# ------------------------------------------------------------
# Lo attivo per poter lanciare il comando nmcli
# start lo attiva per questa sessione
# enable lo attiva per tutte le sessioni infatti crea un symlink

# systemctl start NetworkManager
# nmcli
# systemctl stop NetworkManager
# -------------------------------------------------------------

# nmcli device connect <SSID> password <password>
# netctl list

# sudo netctl enable wlp1 -> systemctl | grep net ora ne ha aggiunto un altro

# Home\x26Life\x20SuperWiFi\x2dB089
# Home\&Life\ SuperWiFi-B089 ---> questo funziona

# ------------------------------------------------------------
# systemctl stop systemctl stop [servicename]
# systemctl disable systemctl stop [servicename]
# rm /etc/systemd/system/[servicename]
# rm /etc/systemd/system/[servicename] # and symlinks that might be related
# rm /usr/lib/systemd/system/[servicename] 
# rm /usr/lib/systemd/system/[servicename] # and symlinks that might be related
# systemctl daemon-reload
# systemctl reset-failed
# ------------------------------------------------------------
