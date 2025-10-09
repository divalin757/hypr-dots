#!/bin/bash

# Title
gum style --foreground 212 --border double --margin "1 2" --padding "1 2" --border-foreground 212 "Arch Linux System Manager"

# Welcome

# Main menu
CHOICE=$(gum choose --height 10 --cursor "➤" --header "Select an option:" \
  "Update System" \
  "Install a Package" \
  "Remove a Package" \
  "Check Disk Usage" \
  "Check System Info" \
  "Reboot System" \
  "Exit")

# Dispatcher
case "$CHOICE" in
"Update System")
  gum confirm "Do you want to continue?" || exit 0
  gum spin --spinner dot --title "Updating system..." -- sudo pacman -Syu
  gum style --foreground 46 "✅ System update complete!"
  ;;

"Install a Package")
  PKG=$(gum input --placeholder "Enter package name")
  gum spin --spinner dot --title "Installing $PKG..." -- sudo pacman -S "$PKG"
  gum style --foreground 46 "✅ Package '$PKG' installed!"
  ;;

"Remove a Package")
  PKG=$(gum input --placeholder "Enter package to remove")
  gum spin --spinner dot --title "Removing $PKG..." -- sudo pacman -Rns "$PKG"
  gum style --foreground 46 "🗑️ Package '$PKG' removed."
  ;;

"Check Disk Usage")
  gum style --foreground 99 "📊 Disk Usage:"
  df -h | gum format --theme dracula
  ;;

"Check System Info")
  gum style --foreground 99 "🖥️ System Info:"
  fastfetch || uname -a
  ;;

"Reboot System")
  gum confirm "Are you sure you want to reboot?" && sudo reboot
  ;;

"Exit")
  gum style --foreground 245 "👋 Exiting. Have a nice day!"
  exit 0
  ;;
esac
