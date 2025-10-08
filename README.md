# Hyprland Dotfiles

My hyprland dotfiles

# Installtion 
> [!NOTE]
it is recommended to do this from the tty 

* 1 install dependencies

for arch based

```bash
sudo pacman -S ghostty stow hyprland hyprlock hypridle hyprshot hyprsunset rofi yazi swaync swayosd waybar zsh neovim swww
```

i dont know for other distros lol :)

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

* 7 it is recommended to reboot 


