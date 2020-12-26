

### Should I install PulseAudio?

What does Audacity say? Yes!

https://www.youtube.com/watch?v=BOC9rMuFbAQ

**IMPORTANT**
```
Se non si sta utilizzando GNOME, KDE o Xfce e il proprio ~/.xinitrc non effettua il source degli script in /etc/X11/xinit/xinitrc.d, è possibile avviare PulseAudio al boot con:

~/.xinitrc

/usr/bin/start-pulseaudio-x11
```
```bash
# example
start-pulseaudio-x11 & qtile
```