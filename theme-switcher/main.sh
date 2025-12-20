#!/bin/bash


themes="
nightfox\ncatppuccin\ntokyonight\nnord\nvague\n
"

selected=$(echo -e $themes | rofi -dmenu -p "choose a theme")


get_help() {
  echo -e "Hello world in cpp"
}

switch_tmux() {
  rm ~/.config/tmux.conf
  mv ~/.config/theme-switcher/themes/$selected/tmux.conf
  tmux source-file ~/.config/tmux/tmux.conf
}

switch_waybar() {
   rm ~/.config/waybar/theme.css
   cp -r ~/.config/theme-switcher/themes/$selected/waybar.css ~/.config/waybar/theme.css
   pkill -9 waybar
   waybar & disown
}

switch_swaync() {
  rm ~/.config/swaync/theme.css
  cp -r ~/.config/theme-switcher/themes/$selected/swaync.css ~/.config/swaync/theme.css
  pkill -9 swaync 
  swaync & disown
}


switch_swayosd() {
  rm ~/.config/swayosd/theme.css
  cp -r ~/.config/theme-switcher/themes/$selected/swayosd.css ~/.config/swayosd/theme.css
  pkill -9 swayosd-server
  swayosd-server & disown
}

switch_rofi() {
  rm ~/.config/rofi/theme.rasi
  cp -r ~/.config/theme-switcher/themes/$selected/rofi.rasi ~/.config/rofi/theme.rasi
}

switch_kitty() {
  rm ~/.config/kitty/dark-theme.auto.conf
  cp -r ~/.config/theme-switcher/themes/$selected/kitty.conf ~/.config/kitty/dark-theme.auto.conf
  kill -SIGUSR1 $(pgrep kitty)
}

switch_gtk() {
  theme_dir="$HOME/.config/theme-switcher/themes/$selected"
  gtk_theme_name=$(cat "$theme_dir/gtk-theme-name")  # Read actual GTK theme name

  # Copy the GTK config folders (optional, if you have theme-specific overrides)
  rm -rf ~/.config/gtk-3.0 ~/.config/gtk-4.0
  cp -r "$theme_dir/gtk-3.0" ~/.config/gtk-3.0
  cp -r "$theme_dir/gtk-4.0" ~/.config/gtk-4.0

  # Update GTK settings.ini with the actual theme name
  mkdir -p ~/.config/gtk-3.0 ~/.config/gtk-4.0
  cat > ~/.config/gtk-3.0/settings.ini <<EOF
[Settings]
gtk-theme-name=$gtk_theme_name
gtk-icon-theme-name=Adwaita
gtk-font-name=Sans 10
EOF

  cat > ~/.config/gtk-4.0/settings.ini <<EOF
[Settings]
gtk-theme-name=$gtk_theme_name
gtk-icon-theme-name=Adwaita
gtk-font-name=Sans 10
EOF

  # Apply via gsettings for apps that respect it
  if command -v gsettings &>/dev/null; then
    gsettings set org.gnome.desktop.interface gtk-theme "$gtk_theme_name" 2>/dev/null
  fi

  # Restart xsettingsd / portals
  pgrep -x xsettingsd && pkill -HUP xsettingsd
  pgrep -x xdg-desktop-portal-gtk && pkill -HUP xdg-desktop-portal-gtk
  pgrep -x xdg-desktop-portal-hyprland && pkill -HUP xdg-desktop-portal-hyprland

  sleep 0.8

}



restart_gtk4_apps() {
  echo "Restarting GTK4 apps with visible windows..."

  # Get list of visible windows from Hyprland
  # Columns: WindowTitle PID Workspace ... (PID is usually 2nd column)
  visible_pids=$(hyprctl clients | awk '{print $2}')

  for pid in $visible_pids; do
    # Skip if process no longer exists
    [[ ! -d "/proc/$pid" ]] && continue

    exe=$(readlink "/proc/$pid/exe" 2>/dev/null) || continue
    [[ -z "$exe" ]] && continue

    name=$(basename "$exe")

    # Skip blacklisted apps
    case "$name" in
      bash|zsh|fish|ssh|sudo|grep|awk|sed|sleep|systemd*|xdg-desktop-portal*|xsettingsd|waybar|swaync|rofi|swww|hypr*|ghostty)
        continue
        ;;
    esac

    # Only GTK4 apps
    if ldd "$exe" 2>/dev/null | grep -q "libgtk-4"; then
      echo "→ Restarting $name"

      # Kill running app silently
      pkill -TERM -x "$name" &>/dev/null

      # Relaunch app in background after a short delay
      (sleep 0.4 && setsid "$exe" &>/dev/null &) &
    fi
  done
}



switch_hyprlock() {
  rm ~/.config/hypr/hyprlock.conf
  cp -r ~/.config/theme-switcher/themes/$selected/hyprlock.conf ~/.config/hypr/hyprlock.conf

}


switch_nvim() {
  rm ~/.config/nvim/lua/plugins/colorschemes.lua
  cp -r ~/.config/theme-switcher/themes/$selected/nvim.lua ~/.config/nvim/lua/plugins/colorschemes.lua
}


if [[ $selected == "nightfox" ]]; then 
  switch_waybar
  switch_kitty
  switch_swaync
  switch_swayosd
  switch_rofi
  swww img --transition-type center  --transition-angle 0 --transition-fps 60 --transition-duration 1.5 ~/.config/backgrounds/fancy-cafe-upscaled.jpg
  switch_hyprlock
  restart_gtk4_apps
  switch_nvim
  switch_gtk
  notify-send "Theme changed" "current theme nightfox"
  echo "~/.config/theme-switcher/themes/nightfox/backgrounds" >> ~/.config/theme-switcher/current-wall.txt



elif [[ $selected == "catppuccin" ]]; then 
  switch_waybar
  switch_kitty
  switch_swaync
  switch_swayosd
  switch_rofi
  swww img --transition-type center  --transition-angle 0 --transition-fps 60 --transition-duration 1.5 ~/.config/backgrounds/wallpaper23.png
  switch_gtk
  switch_hyprlock
  restart_gtk4_apps
  switch_nvim
  notify-send "Theme changed" "current theme catppuccin"
  echo "~/.config/theme-switcher/themes/catppuccin/backgrounds" >> ~/.config/theme-switcher/current-wall.txt



elif [[ $selected == "tokyonight" ]]; then
  switch_waybar 
  switch_ghostty
  switch_swaync
  switch_swayosd
  switch_rofi
  switch_hyprlock
  switch_nvim
  swww img --transition-type center  --transition-angle 0 --transition-fps 60 --transition-duration 1.5 ~/.config/backgrounds/wallpaper21.jpg
  switch_gtk
  restart_gtk4_apps
  switch_kitty
  notify-send "Theme changed" "current theme tokyonight"
  echo "~/.config/theme-switcher/themes/tokyonight/backgrounds" >> ~/.config/theme-switcher/current-wall.txt

elif [[ $selected == "nord" ]]; then
  switch_waybar 
  switch_ghostty
  switch_swaync
  switch_swayosd
  switch_rofi
  switch_hyprlock
  switch_nvim
  swww img --transition-type center  --transition-angle 0 --transition-fps 60 --transition-duration 1.5 ~/.config/backgrounds/1-nord.png
  switch_gtk
  restart_gtk4_apps
  switch_kitty
  notify-send "Theme changed" "current theme nord"
  echo "~/.config/theme-switcher/themes/nord/backgrounds" >> ~/.config/theme-switcher/current-wall.txt

elif [[ $selected == "vague" ]]; then
  switch_waybar 
  switch_swaync
  switch_swayosd
  switch_rofi
  switch_hyprlock
  switch_nvim
  swww img --transition-type center  --transition-angle 0 --transition-fps 60 --transition-duration 1.5 ~/.config/backgrounds/3d-tech.jpg
  switch_kitty
  notify-send "Theme changed" "current theme $selected"

fi



case "$1" in
  "--help")
    get_help
    ;;
  *)
    echo "no arg"
    ;;
esac
