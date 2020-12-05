https://wiki.archlinux.org/index.php/Fstab

## rsync to a mounted device

```diff
- Definitely do not chown the device! That's supposed to be owned by the system
+ But chown on the mountpoint or any directory inside the filesystem will work just fine
```

1. Identify filesystems
    ```bash
    # ssh to your machine
    lsblk -f
    # NAME  FSTYPE FSVER LABEL UUID        FSAVAIL FSUSE% MOUNTPOINT
    # sda2  ext4   1.0         79wablabla

    # OR
    sudo fdisk -l
    ```
2. Modify fstab
    ```bash
    # <file system> <dir> <type> <options> <dump> <pass>
    /dev/mmcblk1p1  /boot   vfat    defaults        0       0
    # a "swap" partition would have a "none" in <dir>
    # user,noauto
    UUID=797ded84-14ab-4d64-b400-7f8a45cd4b14 /home/alarm/HDD ext4 user 0 0
    ``` 
3. ??? change permissions ???
    ```bash
    sudo chmod -R 0777 ./HDD/
    ```
4. rsync
    ```bash
    rsync -r ~/source/ alarm@192.168.1.100:~/HDD/
    ```

## rsync skip file or directories

```bash
rsync --exclude 'node_modules' --exclude 'package-lock.json' -r ~/source/ alarm@192.168.1.100:~/HDD/
```

## [rsync and log](https://askubuntu.com/questions/98597/increase-verbosity-of-running-rsync-process)

```bash
rsync -a /foo /bar >/tmp/rsync.log 2>&1
# to read
tail -f /tmp/rsync.log
```