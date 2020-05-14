# I3 WM Install Notes
assumes arch linux, so tweak as necessary for other distros

## Install I3
`pacman -S i3 dmenu`

dmenu is not installed by default on arch (might be on other distros though?)

On first start, it should generate a `~/.config/i3/config file`, which needs to be customised.

## Fancy Icon Fonts
`pacman -S ttf-font-awesome`

there's also `otf-font-awesome` package in arch

Cheatsheet to cut/paste icon characters from:
`https://fontawesome.com/cheatsheet`

Also available directly:
`https://github.com/FortAwesome/Font-Awesome/releases`

## Bind Apps to Workspace
Launch app, run `xprop` in a termninal

Grab the string from `WM_CLASS(STRING) = "chromium", "Chromium"`

Add entry to i3 config file:

`assign [class="Chromium"] $ws2`

## Multimedia Keys
* need pactl or pamixer (pactl doesn't limit volume to 100%max / pamixer does)
* also need playerctl installed
* then cut/paste bindsyms:

```
# Pulse Audio controls
#bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +5% #increase sound volume
#bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -5% #decrease sound volume
#bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle # mute sound
bindsym XF86AudioRaiseVolume exec --no-startup-id pamixer --sink 1 --increase 5
bindsym XF86AudioLowerVolume exec --no-startup-id pamixer --sink 1 --decrease 5
bindsym XF86AudioMute exec --no-startup-id pamixer --sink 1 --toggle-mute

# Screen brightness controls
bindsym XF86MonBrightnessUp exec xbacklight -inc 20 # increase screen brightness
bindsym XF86MonBrightnessDown exec xbacklight -dec 20 # decrease screen brightness

# Touchpad controls
bindsym XF86TouchpadToggle exec ~/.i3/toggletouchpad.sh # toggle touchpad

# Player controls
bindsym XF86AudioPlay exec playerctl play
bindsym XF86AudioPause exec playerctl pause
bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPrev exec playerctl previous
```

Also the XF86Play/Pause etc. keys need to be mapped

NOTE: `set-sink-volume 0` may need to change the 0 to 1 or different value if >1 audio device? (on my desktop PC, 0=HDMI, 1=StereoAudio) TODO: could make that a $variable

Info for pamixer can be found here: `https://github.com/cdemoulins/pamixer`

## Configure i3status
Copy `i3status/config` to `~/.config/i3status/config`

That location should be the first place that i3wm/i3bar looks
Needs to be edited, as a minimum to uncomment laptop specific lines like wifi, battery etc:

```
order += "volume master"
#order += "ipv6"
#order += "disk /"
#order += "wireless _first_"
#order += "ethernet _first_"
#order += "battery all"
order += "cpu_usage"
order += "load"
order += "tztime local"
```

## TODO:
## Keyboard Mapping
This is probably an arch issue?  It's not picking up the right keyboard map, so need to force something somewhere.

`setxkbmap gb` in i3 config file seems to be a workaround

### Customise Bar
* use i3blocks instead of i3status
* need to frig volume control?

### Laptop Specific
* sort battery indicator
* sort wifi


### Credit:
Inspired quite a lot from `github.com/bookercodes` and the associated youtube videos
