

## MD5

## PGP

```bash
gpg --list-keys
```
Find KEYID
```
gpg --search-keys heftig
```
```bash
# use KEYID to receive key if you can't find it anywhere else
gpg --recv-keys 19802F8B0D70FC30
# or from pgp keyserver
gpg --keyserver keys.gnupg.net --recv-keys 19802F8B0D70FC30
# "verify" should work now
```
```bash
gpg --delete-key A2FF3A36AAA56654109064AB19802F8B0D70FC30
```

> signature checking in __makepkg__ does not use pacman's keyring
>
> If a needed public key is needed, the PKGBUILD will most likely contain it
> You can import it manually, or you can find it on a keyserver and import from there

```bash
gpg --import openwall-offline-signatures.asc
gpg --verify john-1.9.0-jumbo-1.tar.xz.sign 
# check fingerprint with what said on source site
```

Verify download integrity
```bash
# update
sudo pacman -S archlinux-keyring
sudo pacman-key --populate archlinux
sudo pacman-key --refresh-keys
# use the same name
nano linux-5.3-arch1.tar.gz.sig
# copy the -----BEGIN PGP SIGNATURE-----
# and save the sig file
gpg --verify linux-5.3-arch1.tar.gz.sign
```
If **gpg: Can't check signature: No public key**
```bash
# user_id is a name connected to an email
# Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>	2019-09-16 05:07:54 +0200
# gpg --search-keys heftig
# gpg --search-keys jan.steffens@gmail.com
gpg --search-keys user_id
# from here you can find KEYSID
```
Then
```bash
gpg --recv-keys 19802F8B0D70FC30
```