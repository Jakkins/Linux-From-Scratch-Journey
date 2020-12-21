'''
check number of screens: 
$ xrandr
or
$ xrandr --listmonitors
'''

from libqtile.config import Screen
from libqtile import bar, widget

widget_defaults = dict(
    font="Monospace",
    fontsize=14,
    padding=3,
)

widget_right = dict(
	background='002b36',
	foreground='ffffba',
)

widget_sep = dict(
	background='002b36',
	foreground='ffffff',
	linewidth=3,
	mouse_callbacks={},
	padding=10,
	size_percent=70,
)

def open_something(qtile):
	qtile.cmd_spawn('dmenu')

bottom_bar = bar.Bar(
            [
                widget.Image(
                    filename="~/0ROOT/glider.png",
                    mouse_callbacks={'Button1': open_something}
                ),
                widget.GroupBox(
					**widget_defaults
				),
				widget.Prompt(
					**widget_defaults
				),
				widget.Systray(
					**widget_defaults
				),
				widget.Spacer(
					length=bar.STRETCH,
				),
				widget.Clock(
					format='%Y/%m/%d %A %I:%M %p',
					**widget_defaults,
					**widget_right,
				),
				widget.Sep(**widget_sep),
				widget.CurrentLayout(
					**widget_defaults,
					**widget_right,
				),
				widget.Sep(**widget_sep),
                widget.Battery( 
					battery=0,
					format='{percent:1.0%}',
					**widget_defaults,
					**widget_right,
				),
				widget.Sep(**widget_sep),
                widget.Memory(
					**widget_defaults,
					**widget_right,
                ),
                widget.Sep(**widget_sep),
                widget.Net(
                    interface='wlp3s0',
                    format='{up}▲ {down}▼',
                    **widget_defaults,
                    **widget_right,
                ),
            ],
            24,
		)

screens = [
	Screen(bottom = bottom_bar),
]
