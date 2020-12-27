
- [Downgrade kernel](#downgrade-kernel)
- [From ArchLinux](#from-archlinux)
- [Traditional (RECOMMENDED)](#traditional-recommended)
- [Problems](#problems)
- [Final](#final)
- [Final Problems](#final-problems)

## Downgrade kernel

- [Bad News](https://superuser.com/questions/1559021/i-cannot-find-headers-for-linux-kernel-5-3-10-arch1-1)
- [Source](https://www.youtube.com/watch?v=VVunP3yDgm4)
- [Good Source](https://wiki.alienbase.nl/doku.php?id=linux:kernelbuilding&s[]=kernel&s[]=compile)

## Thing to know

- headers are backward compatible
  -  If you delete the kernel-headers package, your running system will in no way be affected, but you will not be able to (re-)compile most software
- the compilation will take something near 15GB of disk space

[Source](https://unix.stackexchange.com/questions/224887/how-to-script-make-menuconfig-to-automate-linux-kernel-build-configuration)
    ```
    Configuration targets:
      config          - Update current config utilising a line-oriented program
      nconfig         - Update current config utilising a ncurses menu based program
      menuconfig      - Update current config utilising a menu based program
      xconfig         - Update current config utilising a QT based front-end
      gconfig         - Update current config utilising a GTK based front-end
      oldconfig       - Update current config utilising a provided .config as base
      localmodconfig  - Update current config disabling modules not loaded
      localyesconfig  - Update current config converting local mods to core
      silentoldconfig - Same as oldconfig, but quietly, additionally update deps
      defconfig       - New config with default from ARCH supplied defconfig
      savedefconfig   - Save current config as ./defconfig (minimal config)
      allnoconfig     - New config where all options are answered with no
      allyesconfig    - New config where all options are accepted with yes
      allmodconfig    - New config selecting modules when possible
      alldefconfig    - New config with all symbols set to default
      randconfig      - New config with random answer to all options
      listnewconfig   - List new options
      olddefconfig    - Same as silentoldconfig but sets new symbols to their default value
      kvmconfig       - Enable additional options for guest kernel support
      tinyconfig      - Configure the tiniest possible kernel
    ```

## From ArchLinux

1. go in a repo link https://git.archlinux.org/
2. search for linux
3. summary then click on [...]
4. search for the version that you want and download it
5. Verify download, check integrity
6. compile

## Traditional (RECOMMENDED)

- [www.kernel.org/](https://mirrors.edge.kernel.org/pub/linux/kernel)
- [Source](https://wiki.archlinux.org/index.php/Kernel/Traditional_compilation)

```bash
wget -c https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-5.3.18.tar.xz
wget https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.3.18.tar.sign
gpg --list-packets linux-5.3.18.tar.sign
gpg --recv-keys <fingerprint-from-previous-step>
# Note the signature was generated for the tar archive (.tar), not the compressed .tar.xz
unxz linux-5.3.18.tar.xz
gpg --verify linux-5.3.18.tar.sign linux-5.3.18.tar
tar -xvf linux-5.3.18.tar
cd linux-5.3.18
```
```bash
sudo pacman -S base-devel xmlto kmod inetutils bc libelf git cpio
make mrproper
```
- [Read this carefully - localmodconfig way](https://wiki.archlinux.org/index.php/Kernel/Traditional_compilation#B._Generated_configuration)
- [config vs oldconfig vs defconfig vs menuconfig vs savedefconfig](http://embeddedguruji.blogspot.com/2019/01/make-config-vs-oldconfig-vs-defconfig.html)
```bash
su
# attach everything to load driver of that devices
make localmodconfig
```
If GRUB is used remove LILO:
```bash
pacman -R lilo
```
```bash
make -j 4
make bzImage
make modules
make modules_install
cp -v ./arch/x86_64/boot/bzImage /boot/vmlinuz-linux5318
cp /etc/mkinitcpio.d/linux.preset /etc/mkinitcpio.d/linux5318.preset
nano /etc/mkinitcpio.d/linux5318.preset
# ALL_kver="/boot/vmlinuz-linux5318"
# default_image="/boot/initramfs-linux5318.img"
# fallback_image="/boot/initramfs-linux5318-fallback.img"
mkinitcpio -p linux5318
# mkinitcpio -k 5.3.13-arch1 -g /boot/initramfs-linux5313.img
```
Update bootloader:

The System.map file is not required for booting Linux **BUT** If your /boot is on a filesystem which supports symlinks (i.e., not FAT32), copy System.map
```bash
cp System.map /boot/System.map-linux5318
ln -sf /boot/System.map-linux5318 /boot/System.map
```
GRUB
```bash
# grub-mkconfig -o /boot/grub/grub.cfg
```
systemd-boot
```bash
title   arch
version 5318
linux    /vmlinuz-linux5318
initrd   /initramfs-linux5318.img
options  root=/dev/sda2 rw
```

## Useful tools

What modules are installed ?
```bash
mkinitcpio -M -k 5.3.13-arch1
modinfo -k 3.5.13-arch1 ext4
ls -l /usr/lib/modules/5.3.13-arch1
```

## Problems

[multiple definitions of YYLTYPE in dtc (dtc-parser, dtc-lexer, ...) files](https://forum.xda-developers.com/t/multiple-definitions-in-dtc-error-when-trying-to-build-android-kernel.4123549/)

```diff
- './modules.builtin.modinfo': No such file or directory
+ created a file named modules.builtin.modinfo and restarted 'make modules_install'
```

```diff
- No modules were added to the image. This is probably not what you want.
+ load lvm2 kernel as modules and recompiled the kernel
With `make localmodconfig` you should not see this error
Or you can find lvm2 in kernel .config file and set it to 'M'
```
https://bbs.archlinux.org/viewtopic.php?id=138938

```diff
- ld: arch/x86/boot/compressed/pgtable_64.o:(.bss+0x0): multiple definition of `__force_order'; arch/x86/boot/compressed/kaslr_64.o:(.bss+0x0): first defined here
+ Make KASLR use extern pgtable_64's definition.

+++ b/arch/x86/boot/compressed/kaslr_64.c
@@ -30,7 +30,7 @@
#include "../../mm/ident_map.c"

/* Used by pgtable.h asm code to force instruction serialization. */
- unsigned long __force_order;
+ extern unsigned long __force_order;
--
```

```diff
- cannot find LILO.
But if you use GRUB...
```
https://serverfault.com/questions/383286/compiling-linux-kernel-make-install-asks-for-lilo-now-what
```diff
+ use manual installation
cp -v ./arch/x86_64/boot/bzImage /boot/vmlinuz-linux5313
mkinitcpio -k 5.3.13-arch1 -g /boot/initramfs-linux5313.img
cp System.map /boot/System.map-linux5313
cp /boot/System.map-linux5313 System.map
grub-mkconfig -o /boot/grub/grub.cfg
```

https://bbs.archlinux.org/viewtopic.php?id=240610

```diff
- Freeze, stuck, everything stops at "Loading Initial Ramdisk..."
- Also called kernel panic
+ [MAYBE] make an efi partition to put bootloader
+ [MAYBE] switching bootloader (e.g. GRUB) to systemd (systemd-boot)
+ [MAYBE] delete all nvidia driver

What I did after some try
+ Deleted everything, installed Arch from zero with the latest kernel
+ Used localmodconfig who loaded a lot of driver in .config
```

## Collection of hell

[Newly compiled kernel hangs at boot with no output](https://askubuntu.com/questions/1263474/newly-compiled-kernel-hangs-at-boot-with-no-output)
  - Also maybe Secure Boot is enabled.

https://wiki.archlinux.org/index.php/NVIDIA/Troubleshooting#Black_screen_on_systems_with_Intel_integrated_GPU

https://unix.stackexchange.com/questions/123632/newly-compiled-kernel-not-booting-up-vanilla-kernel-3-12-14
