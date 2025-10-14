#!/bin/bash

# Check dependencies
if ! command -v fd &>/dev/null; then
  echo " 'fd' is not installed. Install it using: sudo pacman -S fd"
  exit 1
fi

if ! command -v du &>/dev/null; then
  echo "  'du' is required. Install it using: sudo pacman -S coreutils"
  exit 1
fi

# Prompt user
read -rp " Enter search terms (space-separated, treated as regex): " input_terms
read -rp "󰂭  Enter exclusions (space-separated patterns): " input_excludes

# Convert inputs
search_terms=$(echo "$input_terms" | sed 's/ /|/g')  # e.g., vscodium|btop|konsole
excludes_default=("*.png" "*.svg" "*.ico" "*.xpm" "*.jpg" "*.jpeg" "flatpak" ".var")
IFS=' ' read -r -a user_excludes <<< "$input_excludes"

# Combine all excludes
all_excludes=("${excludes_default[@]}" "${user_excludes[@]}")

# Build exclude arguments for fd
exclude_args=()
for excl in "${all_excludes[@]}"; do
  exclude_args+=(--exclude "$excl")
done

echo -e "\n  Searching for files matching: $search_terms"
echo "🚫 Excluding: ${all_excludes[*]}"
echo "⏳ Please wait...\n"

# Search and show file sizes
fd --type f $(
  printf '%q ' "${exclude_args[@]}"
) "$search_terms" / 2>/dev/null | while read -r file; do
  size=$(du -h "$file" 2>/dev/null | cut -f1)
  printf "   %-10s %s\n" "$size" "$file"
done

echo -e "\n✅ Done."

