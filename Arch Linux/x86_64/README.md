
1. https://wiki.archlinux.org/index.php/Installation_guide
2. https://wiki.archlinux.org/index.php/General_recommendations

## Date, Time, System Clock
```
$ timedatectl
    > status
    > list-timezones
    > set-timezone <name>
    > set-ntp true
$ sudo hwclock --show
```

## Useful

- [Where PATH is setted?](https://stackoverflow.com/questions/37676849/where-is-path-variable-set-in-ubuntu)
- fn+f1
- [NTFS on Arch](https://wiki.archlinux.org/index.php/NTFS-3G)
- libmtp = MTP = Media Transfer Protocol (From Arch to Android)

## Pacman

```bash
pacman -Syu
pacman -Ql packagename
```

## Sudo

![sudoers](sudoers.jpg)
