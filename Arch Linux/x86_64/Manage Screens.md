
- [Xrandr](https://wiki.archlinux.org/index.php/Xrandr)

### run these commands
```bash
xrandr
```
```bash
xrandr --listmonitors
```

The first gave this output
```bash
Screen 0: minimum 8 x 8, current 3286 x 1080, maximum 32767 x 32767
eDP1 connected primary 1366x768+1920+0 (normal left inverted right x axis y axis) 340mm x 190mm
   	1366x768      60.05*+
   	1280x720      59.86    60.00    59.74  
   	1024x768      60.00  
	...
DP1 connected 1920x1080+0+0 (normal left inverted right x axis y axis) 480mm x 270mm
   	1920x1080     60.00*+
   	1680x1050     59.95
	...
HDMI1 disconnected (normal left inverted right x axis y axis)
HDMI2 disconnected (normal left inverted right x axis y axis)
VIRTUAL1 disconnected (normal left inverted right x axis y axis)
```
Then I used this command to rotate the second ```monitor```
```bash
xrandr --output DP1 --rotate left 
```
