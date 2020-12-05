
> /home/user/.config/qtile -> config.py

[Docs](http://docs.qtile.org/en/latest/index.html)
[Autostart](http://docs.qtile.org/en/latest/manual/config/hooks.html#autostart)

```Python
from libqtile import hook
import os
import subprocess

# create an autostart.sh

@hook.subscribe.startup_complete
def someName():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])
```