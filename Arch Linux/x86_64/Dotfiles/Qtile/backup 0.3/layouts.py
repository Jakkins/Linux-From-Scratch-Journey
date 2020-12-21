from libqtile.config import Key
from libqtile.command import lazy
from keyboard import keys
from libqtile import layout

settings = dict(
	margin=4
)

layouts = [
    layout.Max(**settings),
    layout.MonadTall(
		**settings,
		border_focus='#cc0099',
		border_normal='#000000',
		border_width=3,
    ),
]

keys.extend([
	Key(["mod4"], "Left", lazy.layout.up()),
	Key(["mod4"], "Right", lazy.layout.down()),
	Key(["mod4"], "Up", lazy.layout.grow()),
	Key(["mod4"], "Down", lazy.layout.shrink()),
	
	Key(["mod4", "shift"], "Left", lazy.layout.swap_left()),
	Key(["mod4", "shift"], "Right", lazy.layout.swap_right()),
	Key(["mod4", "shift"], "Up", lazy.layout.shuffle_up()),
	Key(["mod4", "shift"], "Down", lazy.layout.shuffle_down()),
])
