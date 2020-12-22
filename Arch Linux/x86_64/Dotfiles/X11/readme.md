
Just a simple osservation
```
Adding this file, Qtile started to work better...
```
...
```bash
sudo pacman -S lxappearance-gtk3
lxappearance
# no more stress
```

### /etc/X11/xorg.conf.d

- 10-monitor.conf

### /etc/X11/xinit

- ./.Xresources
	```
	Xcursor.size: 16
	```

## Graphic

```
X resources only affect frameworks that use them, such as Xaw and Motif. 
They don't affect Gtk or Qt. 

Arch Linux has a custom configuration file at /usr/share/gtk-2.0/gtkrc, 
which sets the default theme to Adwaita.

GTK settings can be specified manually in configuration files, but DE and applications can override these settings. Depending on GTK version, these files are located at:

    GTK 2 user specific: 	~/.gtkrc-2.0
    GTK 2 system wide: 		/etc/gtk-2.0/gtkrc
    GTK 3 user specific: 	$XDG_CONFIG_HOME/gtk-3.0/settings.ini, or $HOME/.config/gtk-3.0/settings.ini if $XDG_CONFIG_HOME is not set
    GTK 3 system wide: 		/etc/gtk-3.0/settings.ini
```