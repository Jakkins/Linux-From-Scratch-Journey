'''
check number of screens: 
$ xrandr
or
$ xrandr --listmonitors
'''

from libqtile.config import Screen
from libqtile import bar, widget
from Xlib import display
import os

d = display.Display()
res = d.screen().root.xrandr_get_screen_resources()._data

num_monitors = 0
for output in res['outputs']:
    mon = d.xrandr_get_output_info(output, res['config_timestamp'])._data
    if mon['num_preferred']:
        num_monitors += 1

print(f'Number of Monitors: {num_monitors}')
if num_monitors > 1:
    os.system('xrandr --output eDP1 --auto --output DP1 --auto --left-of eDP1')

widget_defaults = dict(
    background='002b36',
    foreground='ffffba',
    font="Monospace",
    fontsize=14,
    markup=False, # non riesco a capire che cambi
    padding=3, 
)

def open_something(qtile):
	qtile.cmd_spawn('konsole')

# add only one screen
screens = [
    Screen(
        bottom = bar.Bar(
            [
                widget.Image(
                    filename="~/0ROOT/glider.png",
                    mouse_callbacks={'Button1': open_something}
                ),
                widget.GroupBox(**widget_defaults),
				widget.Prompt(**widget_defaults),
				widget.Systray(**widget_defaults),
				widget.Clock(**widget_defaults, format='%Y/%m/%d %A %I:%M %p'),
                widget.Battery(**widget_defaults, battery=0),
                widget.Memory(**widget_defaults),
                widget.Net(
                    **widget_defaults,
                    interface='wlp3s0',
                    format='{down} ud {up}',
                ),
            ],
            24,
        ),
        wallpaper="~/0ROOT/RoadToShambala.jpg",
		wallpaper_mode="fill",
    ),
]


