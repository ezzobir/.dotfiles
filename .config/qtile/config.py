import os
import subprocess

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen, KeyChord, DropDown, ScratchPad
from libqtile.lazy import lazy

from tabbed import Tabbed

from bar1 import bar

from colors import nord_fox


mod = "mod4"
terminal = "kitty"
rofi_run = "rofi -show run"
browser = "firefox"
messenger_app="telegram-desktop"
text_editor="emacs"

#  _  _________   ______ ___ _   _ ____  ____
# | |/ / ____\ \ / / __ )_ _| \ | |  _ \/ ___|
# | ' /|  _|  \ V /|  _ \| ||  \| | | | \___ \
# | . \| |___  | | | |_) | || |\  | |_| |___) |
# |_|\_\_____| |_| |____/___|_| \_|____/|____/

keys = [
    Key([mod, "control"], "p", lazy.spawn(browser), desc="Launch Browser"),
    Key([mod, "control"], "o", lazy.spawn(messenger_app), desc="Launch messenger app"),
    Key([mod, "control"], "i", lazy.spawn(text_editor), desc="Launch text editor"),
    Key([mod, "control"], "u", lazy.spawn('AppFlowy'), desc="Launch my note taking app"),
    Key([mod, "control"], "y", lazy.spawn('pomatez'), desc="Launch pomatez"),
    Key([mod, "control"], "space", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    # Key([mod], "space", lazy.widget["keyboardlayout"].next_keyboard(), desc="Next keyboard layout."),
    # Modkey + M to hide/unhide the bar
    Key([mod], "m", lazy.hide_show_bar("top")),
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod, "control"], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "d", lazy.spawn(rofi_run), desc="Launch rofi"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "s", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    # Language 
    # Key([mod], "F1", lazy.spawn("setxkbmap ara"), desc= "Change to arabic layout"),
    # Key([mod], "F2", lazy.spawn("setxkbmap fr"), desc= "Change to french layout"),
]

#   ____ ____   ___  _   _ ____  ____
#  / ___|  _ \ / _ \| | | |  _ \/ ___|
# | |  _| |_) | | | | | | | |_) \___ \
# | |_| |  _ <| |_| | |_| |  __/ ___) |
#  \____|_| \_\\___/ \___/|_|   |____/

# groups = [Group(i) for i in "azertyuiop" ]
# groups = [Group(i, label=j) for i,j in zip("azertyuiop", ["system","emacs","browser","terminal","chat",
groups = [
    Group("a", matches=[Match(wm_class=["kitty"])]),
    Group("z", matches=[Match(wm_class=["emacs"])]),
    Group("e", matches=[Match(wm_class=["firefox"])]),
    Group("r", matches=[Match(wm_class=["telegram-desktop"]),
                        Match(wm_class=["signal"])
                        ]),
    Group("t", matches=[Match(wm_class=["Thunar"]),
                        Match(wm_class=["JDownloader"]),
                        ]),
    Group("y", matches=[Match(wm_class=["pomatez"]),
                        Match(wm_class=["AppFlowy"]),
                        ]),
    Group("u", matches=[Match(wm_class=["lyx"]),
                        Match(wm_class=["libreoffice"]),
                        Match(wm_class=["texmacs.bin"]),
                        ]),
    Group("i", matches=[Match(wm_class=["Inkscape"]),
                        Match(wm_class=["gimp"]),
                        Match(wm_class=["audacity"]),
                        Match(wm_class=["obs"]),
                        Match(wm_class=["kdenlive"]),
                        ]),
    Group("o", matches=[Match(wm_class=["mpv"])]),
    Group("p", matches=[Match(wm_class=["okular"])]),
]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )


#  ____   ____ ____      _  _____ ____ _   _ ____   _    ____  ____
# / ___| / ___|  _ \    / \|_   _/ ___| | | |  _ \ / \  |  _ \/ ___|
# \___ \| |   | |_) |  / _ \ | || |   | |_| | |_) / _ \ | | | \___ \
#  ___) | |___|  _ <  / ___ \| || |___|  _  |  __/ ___ \| |_| |___) |
# |____/ \____|_| \_\/_/   \_\_| \____|_| |_|_| /_/   \_\____/|____/


groups.append(
    ScratchPad(
        'scratchpad',
        [
            DropDown(
                'term',
                'kitty',
                width=0.4,
                height=0.5,
                x=0.3,
                y=0.1,
                opacity=1
            ),
            DropDown(
                'mixer',
                'pavucontrol',
                width=0.4,
                height=0.6,
                x=0.3,
                y=0.1,
                opacity=1
            ),
            # DropDown(
            #     'pomodoro',
            #     'pomatez',
            #     width=0.05,
            #     height=0.6,
            #     x=0.35,
            #     y=0.1,
            #     opacity=1
            # ),
            DropDown(
                'chat',
                'telegram-desktop',
                width=0.05,
                height=0.6,
                x=0.35,
                y=0.1,
                opacity=1
            ),
            DropDown(
                'bitwarden',
                'bitwarden-desktop',
                width=0.05,
                height=0.6,
                x=0.35,
                y=0.1,
                opacity=1
            ),
        ]
    )
)

keys.extend([
    Key(["control", "shift"], "z", lazy.group['scratchpad'].dropdown_toggle('term')),
    Key(["control", "shift"], "e", lazy.group['scratchpad'].dropdown_toggle('mixer')),
    Key(["control", "shift"], "r", lazy.group['scratchpad'].dropdown_toggle('bitwarden')),
    Key(["control", "shift"], "t", lazy.group['scratchpad'].dropdown_toggle('chat')),
])
# keys.extend([
#     Key(["control", "shift"], "z", lazy.group['scratchpad'].dropdown_toggle('term')),
#     Key(["control" "shift"], "e", lazy.group['scratchpad'].dropdown_toggle('mixer')),
#     Key(["control" "shift"], "r", lazy.group['scratchpad'].dropdown_toggle('pomodoro')),
#     Key(["control" "shift"], "t", lazy.group['scratchpad'].dropdown_toggle('blueman')),
# ])

#  _        _ __   _____  _   _ _____ ____
# | |      / \\ \ / / _ \| | | |_   _/ ___|
# | |     / _ \\ V / | | | | | | | | \___ \
# | |___ / ___ \| || |_| | |_| | | |  ___) |
# |_____/_/   \_\_| \___/ \___/  |_| |____/



layout_theme = {
    "border_width": 2,
    "margin": 3,
    "border_focus": "005500",
    "border_normal": "363636"
 }

layouts = [
    Tabbed(
        show_single_tab=False,
        fontsize=12,
        bar_height=20,
        rounded_tabs=True,
        active_bg="5454ff",
        active_fg="ffff54"
    ),
    layout.Columns(
        border_normal=nord_fox['black'],
        border_focus=nord_fox['cyan'],
        border_width=2,
        border_normal_stack=nord_fox['black'],
        border_focus_stack=nord_fox['cyan'],
        border_on_single=2,
        margin=4,#8
        margin_on_single=2, #10
        # border_focus_stack=["#d75f5f", "#8f3d3d"],
        # border_width=4
    ),
    # layout.Max(),
    # layout.Columns(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.TreeTab(),
    # layout.Floating(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="DejaVu Sans",
    fontsize=13,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(top=bar)
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"


# @ hook.subscribe.startup_once
# def autostart():
#     home = os.path.expanduser('~/.config/qtile/autostart.sh')
#     subprocess.run([home])
