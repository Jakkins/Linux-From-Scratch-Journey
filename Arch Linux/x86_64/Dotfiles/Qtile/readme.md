```bash
~/.config/qtile
```

## Qtile widget doesn't work

```diff
- Unmet dependencies for '.widget.net.Net': No module named 'psutil'
- Unmet dependencies for '.widget.memory.Memory': No module named 'psutil'
+ resolution
$ pip install psutil
```

## Autostart

[Docs](http://docs.qtile.org/en/latest/index.html)
[Autostart](http://docs.qtile.org/en/latest/manual/config/hooks.html#autostart)

```Python
from libqtile import hook
import os
import subprocess

# TODO create an autostart.sh

@hook.subscribe.startup_complete
def someName():
	home = os.path.expanduser('~/.config/qtile/autostart.sh')
	subprocess.call([home])
```

## Display

```python
from Xlib import display

d = display.Display()
result = d.screen().root.xrandr_get_screen_resources()._data

for output in result['outputs']:
	monitor = d.xrandr_get_output_info(output, res['config_timestamp'])._data
	print(monitor)
```
If ```monitor['num_preferred'] = 1```, the monitor is connected. I got:
```
result['outputs'] = [67, 68, 69, 70, 71]
67: eDP1
68: DP1
69: HDMI1
70: HDMI2
71: VIRTUAL1
```

## Useful

- Source
  - https://arcolinuxd.com/5-where-can-we-find-the-qtile-configuration/
- Introspection
	```python
	def readWDir(obj):
		for a in dir(obj):
			print(f'{a}			{type(a)}')
	```
- widget_defaults settings:
  - background: e.g. background='002b36'
  - foreground
  - font
  - fontsize: number
  - markup
  - padding: number
