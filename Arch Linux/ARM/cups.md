
## General info

- [Network printer tutorial 1](https://www.addictivetips.com/ubuntu-linux-tips/configure-printers-on-linux/)
- [Network printer tutorial 2](https://www.youtube.com/watch?v=utK889gYAmM)
- enable and start cups.service or alternatively ```use socket activation to only start CUPS when a program wants to use the service```.
  - localhost:631/
- To discover or share printers using DNS-SD/mDNS, setup .local hostname resolution with Avahi and restart cups.service.
  - avahi
    - for hostname resolution use ```nss-mdns```
```bash
lpinfo -v
# this
lpadmin -p HPENVY4520 -E -v ipps://HP%20ENVY%204520%20series%20%5B06733A%5D._ipps._tcp.local/ -m everywhere
# or maybe
lpadmin -p HPENVY4520 -E -v socket://192.168.1.xxx:yyyy -m everywhere
```