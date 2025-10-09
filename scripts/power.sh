#!/bin/bash

# Define profiles in fixed order
ordered_profiles=("power-saver" "balanced" "performance")

# Get current profile
current_profile=$(powerprofilesctl get)

# Build menu options with consistent order
menu=""
for profile in "${ordered_profiles[@]}"; do
  if [[ "$profile" == "$current_profile" ]]; then
    menu+="[$profile]  ⬅️  current\n"
  else
    menu+="$profile\n"
  fi
done

# Show the menu (no --markup, plain text only)
chosen=$(echo -e "$menu" | walker --dmenu --placeholder "Select Power Profile" --width 300 --height 150)

# Exit if nothing chosen
[[ -z "$chosen" ]] && exit

# Extract the profile name (remove decorations like [ ])
selected=$(echo "$chosen" | grep -oE '(performance|balanced|power-saver)')

# Only set if it's different
if [[ "$selected" != "$current_profile" ]]; then
  powerprofilesctl set "$selected"
  notify-send "Power Profile Changed" "Now using: $selected"
fi
