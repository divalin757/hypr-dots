# Hyprland Dotfiles

My hyprland dotfiles

# Installtion 
> [!NOTE]
it is recommended to do this from the tty 

* 1 install dependencies

for arch based

```bash
sudo pacman -S ghostty stow hyprland hyprlock hypridle hyprshot hyprsunset rofi yazi swaync swayosd waybar zsh neovim swww starship fastfetch bottom
yay -S wlogout
```


* 2 clone the repo 
```bash
git clone https://github.com/divalin757/hypr-dots.git
```

* 3 cd into the repo
```bash
cd hypr-dots
```

* 4 symlink everything 
```bash
stow ghostty hypr nvim rofi swaync swayosd yazi zshrc
```

* 5 download the desktop background 
```bash
wget -O ~/Pictures/wallpaper.jpg "https://wallpapercave.com/wp/wp8965856.jpg"
```

or with curl 
```bash
curl -L "https://wallpapercave.com/wp/wp8965856.jpg" -o ~/Pictures/wallpaper.jpg
```

* 6 set the wallpaper 
```bash
swww-daemon & disown
swww img ~/Pictures/wallpaper.jpg
```

> [!NOTE]
> recommended to reboot

# keybinds

### Main Key (`$mainMod = SUPER`)
| Keybind | Action | Command / Description |
|---------|--------|---------------------|
| SUPER + Return | Launch terminal | `$terminal` |
| SUPER + Q | Close active window | `killactive` |
| SUPER + M | Exit Hyprland | `exit` |
| SUPER + E | Open file manager | `env EDITOR=nvim ghostty -e yazi` |
| SUPER + G | Open Ghostty | `kitty -e ghostty +boo` |
| SUPER + SHIFT + L | Lock screen | `hyprlock` |
| SUPER + P | Screenshot region | `hyprshot -m region` |
| SUPER + SHIFT + B | Restart Waybar | `~/scripts/restart_waybar.sh` |
| SUPER + T | Open system monitor | `ghostty -e btop` |
| SUPER + X | Logout menu | `~/scripts/logoutmenu.sh` |
| SUPER + W | Change wallpaper | `~/scripts/wallpaper-change.sh` |
| SUPER + N | Toggle night mode | `~/scripts/nightmode.sh` |
| SUPER + D | Color picker | `hyprpicker -a` |
| SUPER + V | Toggle floating window | `togglefloating` |
| SUPER + Space | Open launcher | `$menu` |
| SUPER + P | Toggle pseudo tiling | `pseudo` |
| SUPER + A | Toggle split mode | `togglesplit` |
| SUPER + B | Launch browser | `librewolf` |
| SUPER + Z | Launch IDE | `codium` |
| SUPER + F | Toggle fullscreen | `fullscreen` |
| SUPER + SHIFT + Q | Force kill window | `killactive` |

### Window Focus
| Keybind | Action | Direction |
|---------|--------|-----------|
| SUPER + L | Move focus | Left |
| SUPER + H | Move focus | Right |
| SUPER + K | Move focus | Up |
| SUPER + J | Move focus | Down |

### Workspaces
| Keybind | Action | Workspace |
|---------|--------|-----------|
| SUPER + [1–0] | Switch to workspace | 1–10 |
| SUPER + SHIFT + [1–0] | Move window to workspace | 1–10 |
| SUPER + S | Toggle special workspace | magic |
| SUPER + SHIFT + S | Move window to special workspace | special:magic |
| SUPER + Mouse Scroll Down | Next workspace | e+1 |
| SUPER + Mouse Scroll Up | Previous workspace | e-1 |

### Mouse Actions
| Keybind | Action | Description |
|---------|--------|-------------|
| SUPER + Left Click (272) | Move window | movewindow |
| SUPER + Right Click (273) | Resize window | resizewindow |

### Media & Brightness
| Key | Action | Command |
|-----|--------|---------|
| XF86AudioMute | Toggle mute | `swayosd-client --output-volume mute-toggle` |
| XF86AudioMicMute | Toggle mic mute | `swayosd-client --input-volume mute-toggle` |
| XF86AudioRaiseVolume | Increase volume | `swayosd-client --output-volume 10` |
| XF86AudioLowerVolume | Decrease volume | `swayosd-client --output-volume -10` |
| XF86MonBrightnessUp | Increase brightness | `swayosd-client --brightness +10` |
| XF86MonBrightnessDown | Decrease brightness | `swayosd-client --brightness -10` |
| XF86AudioNext | Next track | `playerctl next` |
| XF86AudioPrev | Previous track | `playerctl previous` |
| XF86AudioPlay / Pause | Toggle play/pause | `playerctl play-pause` |

# Screenshots

<details>
  <summary>Terminal and top bar</summary>
  <img src="imgs/Screenshot%20from%202025-09-23%2020-58-24.png" alt="Screenshot 1" width="600"/>
</details>

<details>
  <summary>Notifactions and osd</summary>
  <img src="imgs/Screenshot%20from%202025-09-23%2020-58-28.png" alt="Screenshot 2" width="700"/>
</details>

<details>
  <summary>file manager</summary>
  <img src="imgs/Screenshot%20from%202025-09-23%2020-58-28.png" alt="Screenshot 2" width="700"/>
</details>

<details>
  <summary>Neovim</summary>
  <img src="imgs/Screenshot%20from%202025-09-23%2020-58-28.png" alt="Screenshot 2" width="700"/>
</details>

