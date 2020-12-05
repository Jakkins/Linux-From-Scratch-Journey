[ArchWiki](https://wiki.archlinux.org/index.php/MongoDB)

```bash
sudo pacman -S git

# libcurl-openssl-1.0 is a dependency for mongodb on arm64
git clone https://aur.archlinux.org/libcurl-openssl-1.0.git
gpg --keyserver pool.sks-keyservers.net --recv-keys 5CC908FDB71E12C2

# AUR version
git clone https://aur.archlinux.org/mongodb-bin.git
less PKGBUILD
makepkg -si
```
Configurations are in: ```/etc/mongodb.conf```

Then:
```bash
systemctl enable mongodb.service
```
