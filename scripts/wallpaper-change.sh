#!/bin/bash

WALLPAPER_DIR="$HOME/.config/backgrounds"

# Start swww if not running
pgrep -x swww-daemon >/dev/null || swww init

# Build a list of image files (just basenames) to display
WALLPAPERS=($(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' -o -iname '*.webp' \) -exec basename {} \;))

# Use walker to select from basenames
SELECTED_BASENAME=$(printf '%s\n' "${WALLPAPERS[@]}" | rofi -dmenu --placeholder "select a wallpapper")

# If a wallpaper was selected
if [[ -n "$SELECTED_BASENAME" ]]; then
  # Get the full path of the selected file
  FULL_PATH=$(find "$WALLPAPER_DIR" -type f -name "$SELECTED_BASENAME" | head -n 1)

  # Get current cursor position for transition center
  CURSOR_POS=$(hyprctl cursorpos) # For Hyprland

  # Set the wallpaper
  swww img "$FULL_PATH" \
    --transition-type center \
    --transition-angle 0 \
    --transition-pos "$CURSOR_POS" \
    --transition-fps 60 \
    --transition-duration 1.5

  notify-send "Wallpaper changed to $SELECTED_BASENAME"
else
  notify-send "No wallpaper selected"
fi
