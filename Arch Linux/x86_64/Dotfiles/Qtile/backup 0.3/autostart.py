from libqtile import hook

import os
import subprocess

@hook.subscribe.startup_complete
def ciao():
    # os.system('xrandr --output DP1 --rotate left') # vertical screen
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])
