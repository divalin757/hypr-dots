#!/bin/sh

WallDir=${1:-~/.config/backgrounds}

PREVIEW=true \
rofi -no-config -theme fullscreen-preview.rasi \
	-show filebrowser -filebrowser-command 'swww img --transition-fps 60 --transition-type center --transition-angle 0 --transition-duration 1' \
	-filebrowser-directory "$WallDir" \
	-filebrowser-sorting-method mtime \
	-selected-row 1 >/dev/null



