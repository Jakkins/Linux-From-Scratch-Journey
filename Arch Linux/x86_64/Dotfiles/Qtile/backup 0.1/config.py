# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# ----------------------------------
# 0 - Monitors
# 1 - Keys
# 2 - Groups / Workspaces
# 3 - Layouts
# 4 - widget_defaults
# 5 - Screens
# 6 - Mouse
# ----------------------------------

from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.lazy import lazy
from libqtile import layout, bar, widget, hook

from typing import List  # noqa: F401

# this import requires python-xlib installed
from Xlib import display

import os
import subprocess

mod = "mod4"

# =================================
# Functions

# mouse-callbacks
def func_to_open_menu(qtile):
    qtile.cmd_spawn('dmenu_run')


# =================================
# 0 - Monitors
# https://github.com/ekollof/qtile/blob/master/config.py 
d = display.Display()
s = d.screen()
r = s.root
res = r.xrandr_get_screen_resources()._data

# Dynamic multiscreen! (Thanks XRandr)
num_monitors = 0
for output in res['outputs']:
    mon = d.xrandr_get_output_info(output, res['config_timestamp'])._data
    if mon['num_preferred']:
        num_monitors += 1

# Set Monitors if num_monitors > 1
if num_monitors > 1:
    os.system('xrandr --output eDP1 --auto --output DP1 --auto --left-of eDP1')
	
# =================================
# 1 - Keyboard Settings
keys = [
    # Switch between windows in current stack pane
    Key([mod], "k", lazy.layout.down()),
    Key([mod], "j", lazy.layout.up()),

    # Move windows up or down in current stack
    Key([mod, "control"], "k", lazy.layout.shuffle_down()),
    Key([mod, "control"], "j", lazy.layout.shuffle_up()),

    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.layout.next()),

    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split()),
    Key([mod], "Return", lazy.spawn("konsole")),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod], "q", lazy.window.kill()),

    Key([mod, "control"], "r", lazy.restart()),
    # niente si blocca tutto.. Key([mod, "control"], "r", subprocess.call(["firefox", "https://twitter.com/home"])),
    
    Key([mod, "control"], "q", lazy.shutdown()),
    Key([mod], "r", lazy.spawncmd()),
]

# =================================
# 2 - Workspaces ( http://docs.qtile.org/en/latest/manual/config/groups.html )
# groups = [Group(i) for i in "123456789pcfm"]
groups = [
    Group("1"),
    Group("2"),
    Group("3"),
    Group("4"),
    Group("5"),
    Group("6"),
    Group("7"),
    Group("8"),
    Group("9"),
    Group("p", matches=None, exclusive=False, spawn=['pcmanfm'], layout='max'),
    Group("c", matches=None, exclusive=False, spawn=['code'], layout='max'),
    Group("f", matches=None, exclusive=False, spawn=['firefox'], layout='max', layouts=None, persist=True, init=True, layout_opts=None, screen_affinity=None, position=9223372036854775807, label=None),
    Group("m", matches=None, exclusive=False, spawn=['firefox www.youtube.com'], layout='max'),
]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen()),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
    ])

# =================================
# 3 - Layouts ( http://docs.qtile.org/en/latest/manual/ref/layouts.html )
layouts = [
    layout.Max(),
    layout.Stack(num_stacks=3),
    layout.Matrix(),
    layout.TreeTab(),
]

'''
widget_defaults settings:
- background: e.g. background='002b36'
- foreground
- font
    - sans
    - Victor Mono Semibold
    - IBM Plex Sans Medium
    - feather
- fontsize: number
- markup
- padding: number
'''

widget_defaults = dict(
    background='002b36',
    foreground='ffffba',
    font="Monospace",
    fontsize=14,
    markup=False, # non riesco a capire che cambi
    padding=3, 
)


extension_defaults = widget_defaults.copy()

# =================================
# Screen Settings
screens = [
    Screen(
        bottom = bar.Bar(
            [
                widget.Image(
                    filename="~/0ROOT/glider.png",
                    mouse_callbacks={'Button1': func_to_open_menu}
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

'''
		width=1336,
		height=768,

if num_monitors > 1:
	screens.append(
		Screen(
			bottom=bar.Bar(
				[
					widget.GroupBox(),
					widget.Prompt(),
					widget.Systray(),
					widget.Clock(format='%Y/%m/%d %A %I:%M %p'),
				],
				40,
			)
		)
    )
'''

# =================================
# Floating
# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# java UI toolkits don't work correctly if the wmname isn't set to a name that happens to
# be on java's whitelist (LG3D is a 3D non-reparenting WM written in java).
wmname = "LG3D"

@hook.subscribe.startup_complete
def ciao():
    os.system('xrandr --output DP1 --rotate left') # vertical screen
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home]) # contiene il comando per aprire il file TODO



