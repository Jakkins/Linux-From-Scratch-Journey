from libqtile.config import Group, Key
from libqtile.command import lazy
from keyboard import keys

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
        Key(["mod4"], i.name, lazy.group[i.name].toscreen()),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key(["mod4", "shift"], i.name, lazy.window.togroup(i.name, switch_group=True)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
])
