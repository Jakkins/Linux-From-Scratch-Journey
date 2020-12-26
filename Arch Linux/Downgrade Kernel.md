
- [Downgrade kernel](#downgrade-kernel)
- [From ArchLinux](#from-archlinux)
- [Traditional (RECOMMENDED)](#traditional-recommended)
- [Problems](#problems)
- [Final](#final)
- [Final Problems](#final-problems)

## Downgrade kernel

- [Bad News](https://superuser.com/questions/1559021/i-cannot-find-headers-for-linux-kernel-5-3-10-arch1-1)
- [Source](https://www.youtube.com/watch?v=VVunP3yDgm4)

## From ArchLinux

1. go in a repo link https://git.archlinux.org/
2. search for linux
3. summary
4. click on [...]
5. search for the version that you want
6. click on **download**
7. do the same for the headers
8. Verify download, check integrity

## Traditional (RECOMMENDED)

1. [www.kernel.org/](https://mirrors.edge.kernel.org/pub/linux/kernel)
2. [Source](https://wiki.archlinux.org/index.php/Kernel/Traditional_compilation)
```bash
wget -c https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-5.3.18.tar.xz
wget https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.3.18.tar.sign
gpg --list-packets linux-5.3.18.tar.sign
gpg --recv-keys <fingerprint-from-previous-step>
# Note the signature was generated for the tar archive (i.e. extension .tar), not the compressed .tar.xz
unxz linux-5.3.18.tar.xz
gpg --verify linux-5.3.18.tar.sign linux-5.3.18.tar
tar -xvf linux-5.3.18.tar
cd linux-5.3.18
```

**The compilation will take something near 15GB of disk space.**

[config vs oldconfig vs defconfig vs menuconfig vs savedefconfig](http://embeddedguruji.blogspot.com/2019/01/make-config-vs-oldconfig-vs-defconfig.html)

```bash
# and others
sudo pacman -S base-devel xmlto kmod inetutils bc libelf git
```
```bash
make mrproper
```
In a downgrade I don't think I can use the actual configuration
```bash
# cp /proc/config.gz config.gz
# gzip -d config.gz > ./.config
# make oldconfig OR make olddefconfig
```
So
```bash
cp ./arch/x86/configs/x86_64_defconfig .config
```
**MUST**
- **Enable module support, or check if it's enabled,**
- **Enable devtmpfs support**
```bash
make localmodconfig
make menuconfig
make nconfig
# what to check: (look the video at 14:30)
# 	- remove Machintosh device drivers
# 	- Device support
#	 	- Graphics support
#			- remove support for driver that you don't need
# 	- you can remove some filesystem support that you know you don't need

# make xconfig – X windows (Qt) based configuration tool, works best under KDE desktop
# make gconfig – X windows (Gtk) based configuration tool, works best under Gnome Dekstop
# make menuconfig – This option also useful on remote server if you wanna compile kernel remotely
```
```bash
su
# make deb-pkg ???
make -j 4 ARCH=x86_64
make modules
make modules_install
```
```bash

# mkinitcpio -p linux (latest linux e.g. 5.9.14-arch1-1)
# mkinitcpio -p linux-lts

# what modules are installed ?
# mkinitcpio -M -k 5.3.13-arch1
# modinfo -k 3.5.13-arch1 ext4
# ls -l /usr/lib/modules/5.3.13-arch1

# FROM THE VIDEO, is this make install ?
# cp -v ./arch/x86_64/boot/bzImage /boot/vmlinuz-linux5313
# mkinitcpio -k 5.3.13-arch1 -g /boot/initramfs-linux5313.img
# cp System.map /boot/System.map-linux5313
# cp /boot/System.map-linux5313 System.map 
# grub-mkconfig -o /boot/grub/grub.cfg
# reboot
```
```
make install
reboot
```

## Problems

```diff
- make modules_install
- Warning: modules_install: missing 'System.map' file. Skipping depmod.
```
- [multiple definitions of YYLTYPE in dtc (dtc-parser, dtc-lexer, ...) files](https://forum.xda-developers.com/t/multiple-definitions-in-dtc-error-when-trying-to-build-android-kernel.4123549/)
```diff
- ./kernel/gen_kheaders.sh: line 61: cpio: command not found
+ sudo pacman -S cpio
```

```diff
- './modules.builtin.modinfo': No such file or directory
+ created a file named modules.builtin.modinfo and restarted 'make modules_install'
```

```diff
- No modules were added to the image. This is probably not what you want.
+ load lvm2 kernel as modules and recompiled the kernel
```
https://bbs.archlinux.org/viewtopic.php?id=138938
```bash
# sudo pacman -S lvm2 ??? Idk

```

```diff
- ld: arch/x86/boot/compressed/pgtable_64.o:(.bss+0x0): multiple definition of `__force_order'; arch/x86/boot/compressed/kaslr_64.o:(.bss+0x0): first defined here
+ Make KASLR use extern pgtable_64's definition.

+++ b/arch/x86/boot/compressed/kaslr_64.c
@@ -30,7 +30,7 @@
#include "../../mm/ident_map.c"

/* Used by pgtable.h asm code to force instruction serialization. */
-unsigned long __force_order;
+extern unsigned long __force_order;

/* Used to track our page table allocation area. */
struct alloc_pgt_data {
--
```

```diff
- cannot find LILO.
But if you use GRUB...
```
https://serverfault.com/questions/383286/compiling-linux-kernel-make-install-asks-for-lilo-now-what
```diff
+ use video's manual installation
cp -v ./arch/x86_64/boot/bzImage /boot/vmlinuz-linux5313
mkinitcpio -k 5.3.13-arch1 -g /boot/initramfs-linux5313.img
cp System.map /boot/System.map-linux5313
cp /boot/System.map-linux5313 System.map 
grub-mkconfig -o /boot/grub/grub.cfg
```

https://bbs.archlinux.org/viewtopic.php?id=240610

## Final 

```bash
su
```
```bash
make mrproper
```
```bash
make localmodconfig
# and all yes
```
If GRUB is used remove LILO:
```bash
pacman -R lilo
```
```bash
make -j3
make bzImage
# modules_install auto compile modules
make modules_install
```
You may name the kernel as you wish<br>
Also for 64-bit (x86_64) kernel:
```bash
cp -v arch/x86/boot/bzImage /boot/vmlinuz-linux5318
```
Copy and modify
```bash
cp /etc/mkinitcpio.d/linux.preset /etc/mkinitcpio.d/linux5318.preset
nano /etc/mkinitcpio.d/linux5318.preset
# ALL_kver="/boot/vmlinuz-linux5318"
# default_image="/boot/initramfs-linux5318.img"
# fallback_image="/boot/initramfs-linux5318-fallback.img"
```
```bash
mkinitcpio -p linux5318
# manual method
# mkinitcpio -k <kernelversion> -g /boot/initramfs-<file name>.img
```
The System.map file is not required for booting Linux.<br>
BUT If your /boot is on a filesystem which supports symlinks (i.e., not FAT32), copy System.map
```bash
cp System.map /boot/System.map-linux5318
ln -sf /boot/System.map-linux5318 /boot/System.map
```
```bash
grub-mkconfig -o /boot/grub/grub.cfg
reboot
```

## Final Problems

```diff
- Freeze, stuck, everything stops at "Loading Initial Ramdisk..."
- Also called kernel panic
+ [MAYBE] make an efi partition to put bootloader
+ [MAYBE] switching bootloader (e.g. GRUB) to systemd (systemd-boot)
+ [MAYBE] delete all nvidia driver

+ [MAYBE] With / without nomodeset (GRUB_CMDLINE_LINUX_DEFAULT="nomodeset")
+ [MAYBE] With / without GRUB_GFXPAYLOAD_LINUX="text"
+ [MAYBE] GRUB_GFXMODE="auto" 
+ [TRY] GRUB_CMDLINE_LINUX="loglevel=5" ---> update grub after you changed it
```
[loglevel setting](https://stackoverflow.com/questions/16390004/change-default-console-loglevel-during-boot-up#16390389)

Try to delete all nvidia driver
```bash
# list all nvidia driver
sudo pacman -Qs nvidia
sudo pacman -R one_name_at_a_time
```
https://wiki.archlinux.org/index.php/Systemd-boot