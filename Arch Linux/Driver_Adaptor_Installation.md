
- [Sources](#sources)
- [Things to know](#things-to-know)
- [1. Find your chipset](#1-find-your-chipset)
- [2. Kernel](#2-kernel)
- [3. Download & Install chipset driver](#3-download--install-chipset-driver)
- [Example](#example)
	- [Drivers found](#drivers-found)

## Sources

- [Source 1](https://www.fastoe.com/blog/install-rtl8812bu-usb-wifi-dongle-on-linux)
- [Source 2](https://bbs.archlinux.org/viewtopic.php?pid=1941767)
- [Source 3](https://www.reddit.com/r/archlinux/comments/amqua3/trying_to_get_the_a_usb_wifi_adapter_running/)
- [Source 4](https://askubuntu.com/questions/1288547/rtl88x2bu-driver-for-new-kernel-version)

## 1. Find your chipset

```bash
lsusb -v
lspci -v
# searc for vendor ID
```
http://en.techinfodepot.shoutwiki.com/wiki/D-Link_DWA-182_rev_D1:
- [PCI vendor ID List Repository](https://pci-ids.ucw.cz/read/PC/)
- [USB vendor ID List Repository](https://usb-ids.gowdy.us/read/UD)

**Or much better check the vendor's site**

[for me dlink.com](https://support.dlink.com/ProductInfo.aspx?m=DWA-182)

## 2. When you find the name of the driver start search for a package on AUR

https://aur.archlinux.org/packages/rtl88x2bu-dkms-git/

This package will use the source code from [here](https://github.com/RinCat/RTL88x2BU-Linux-Driver) to compile and install driver that are compatible also with Linux 5.9.14-arch1-1 (latest atm)

### Drivers found

| Source | Version | Date | kernel supported |
| --- | --- | --- | --- |
| Arch AUR | rtl88x2bu-dkms-git | 2020-08-02 | dunno |
| D-Link Site | RTL88x2BU_WiFi_linux_v5.8.7.1 RevD1 | 2020-06-22 | Linux 2.6.24 ~ 5.3 |

In https://github.com/aircrack-ng repo there are some drivers but not the rtl88x2bu version.
