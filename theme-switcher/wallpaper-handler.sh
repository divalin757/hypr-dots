#!/bin/sh

WallDir=$(sed 's/[[:space:]]*$//' "$HOME/.config/theme-switcher/current-wall.txt")
export WallDir

PREVIEW=true \
rofi -no-config \
    -theme fullscreen-preview.rasi \
    -show recursivebrowser \
    -recursivebrowser-directory "$WallDir" \
    -recursivebrowser-command 'swww img --transition-fps 60 --transition-type center --transition-angle 0 --transition-duration 1' \
    -recursivebrowser-sorting-method mtime \
    -selected-row 1 >/dev/null

