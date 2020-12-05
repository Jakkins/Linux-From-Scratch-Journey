<h1 align="center">X11 Forwarding</h1>

## Client Side

```bash
# trusted X11 forwarding
ssh -Yv alarm@192.168.xxx.xxx
```
or
```bash
ssh -Xv alarm@192.168.xxx.xxx
```

## [Server Side](https://stackoverflow.com/a/23033038)

Edit /etc/ssh/sshd_config:
```bash
sudo nano /etc/ssh/sshd_config
```
Go at the end
```bash
Match User alarm
        X11Forwarding yes
```
Restart the sshd daemon:
```bash
sudo systemctl restart sshd.service
sudo pacman -S xorg-xauth
```

## Errors

[Source](https://unix.stackexchange.com/questions/552601/no-xauth-program-cannot-forward-x11)

```debug1: No xauth program.```
message from client, it can't find a copy of xauth locally
 
 ```debug1: Remote: No xauth program; cannot forward X11.```
message from server, it can't find xauth either

```bash
sudo pacman -S xorg-xauth
```
---
[Source](https://wiki.archlinux.org/index.php/File_manager_functionality)

```A file manager alone will NOT provide the features and functionality that users of full desktop environments such as Xfce or KDE will be accustomed to [...]```

For PCManFM I think it's enough to add in /etc/X11/xinit
```bash
pcmanfm -d & desktop_manager_name
```
