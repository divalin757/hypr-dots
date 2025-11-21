#!/bin/bash 



gum style --foreground 212 --border double --margin "1 2" --padding "1 2" --border-foreground 212 "Welcome To HyprDE"

ans=$(gum choose "Get A tutorial" "hi" "whatsapp" )


if [[ $ans == "hello" ]]; then
  echo "hi"
fi

