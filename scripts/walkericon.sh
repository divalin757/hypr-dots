#!/bin/bash
#cat "nerdfonts.txt" | sed 's/\([^\s]\)\([A-Za-z0-9]\)/\1 \2/g' | walker --dmenu | awk '{print $1}' | wl-copy
cat "nerdfonts.txt" | sed 's/\([^\s]\)\([A-Za-z0-9]\)/\1 \2/' | walker --dmenu | awk '{print $1}' | wl-copy


