<h1 align="center">ArchLinux ARM</h1>

MongoDB on ARMv7h architecture:
- you will need to use a cross compiled, or an already compiled version of mongodb
- you can use an older version of MongoDB that support 32bit

MongoDB on AArch64(ARMv8):
- supported
- ```at first without the HDMI attached the network was not going to work```
    - [Pi 4 won't boot without HDMI plugged in](https://www.raspberrypi.org/forums/viewtopic.php?t=253312)
        - TL;DR ```Add hdmi_force_hotplug=1 to /boot/config.txt and the Pi4 will run headless```

## Installation

[Guide](https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-4)

https://archlinuxarm.org/about/downloads

### After

[PRETTY RECOMMENDED]

1. upgrade system
    ```bash
    su
    pacman -Syu
    ```
2. change passwords
    ```bash
    [alarm@alarmpi ~]$ passwd alarm
    Changing password for alarm.
    Current password: 
    ```
    ```bash
     # useradd -m jak
     # -m is to create the home
    ```
3. [add alarm to sudoers, or add alarm to wheel group](https://github.com/Jakkins/FateStayNightUnlimitedRaspiBlade/blob/main/ArchLinux/sudoers.md)
4. 
    ```bash
    sudo pacman -S base-devel
    sudo pacman -S usbutils
    sudo pacman -S pcmanfm
    sudo pacman -Syyy gtk3
    sudo pacman -S geany
    ```
5. Locales are used by glibc and other locale-aware programs or libraries for rendering text, correctly displaying regional monetary values, time and date formats, alphabetic idiosyncrasies, and other locale-specific standards
    ```bash
    sudo nano /etc/locale.gen
    # uncomment your country & en_US.UTF-8 if you want to use tmux
    sudo locale-gen
    ```
6. [Install mongodb](https://github.com/Jakkins/FateStayNightUnlimitedRaspiBlade/blob/main/ArchLinux/mongodb.md)


[OPTIONAL but...]

- [SSH](https://christitus.com/ssh-guide/)
    - [set up X11 Forwarding](https://github.com/Jakkins/FateStayNightUnlimitedRaspiBlade/blob/main/ArchLinux/XForwarding.md)
    - protect port 22
        - change port
        - limit access per minute
        - use key exchange to log
- [rsync](https://github.com/Jakkins/FateStayNightUnlimitedRaspiBlade/blob/main/ArchLinux/rsync.md)
- install kernel LTS
- change graphics and personalize PS1
    - [Xterm 256 color chart](https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg)
- Java
    ```bash
    sudo pacman -S jdk-openjdk
    # For the complete set of Java binaries to be available in your PATH, you need to re-login or source /etc/profile.d/jre
    # Please note that this package does not support forcing JAVA_HOME as former package java-common did
    ```

[JUST OPTIONAL]

- [rtorrent](https://github.com/Jakkins/FateStayNightUnlimitedRaspiBlade/blob/main/ArchLinux/rtorrent.md)
- [tmux](https://github.com/Jakkins/FateStayNightUnlimitedRaspiBlade/blob/main/ArchLinux/tmux.md))
- [CUPS for printer](https://github.com/Jakkins/FateStayNightUnlimitedRaspiBlade/blob/main/ArchLinux/cups.md)