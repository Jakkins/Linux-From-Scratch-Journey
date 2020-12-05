
<h1 align="center">
  <img src="https://github.com/Jakkins/Linux/blob/master/Arch%20Linux/sudoers.jpg" alt="sudoers" />
</h1>

```bash
su
nano etc/sudoers
```
```bash
alarm ALL=(ALL) ALL
```
OR:
```
## Uncomment to allow members of group wheel to execute any command
%wheel ALL=(ALL) ALL
usermod -a -G wheel alarm
```
---

There is a better method like [this](https://stackoverflow.com/questions/16923760/mount-unmount-without-sudo) that allow the use of ```rsync``` with the Hard Disk

No password mount, umount commands for user "alarm"

```bash
Cmnd_Alias      MOUNT = /bin/mount, /bin/umount

alarm ALL=(ALL) ALL:NOPASSED= MOUNT
```
