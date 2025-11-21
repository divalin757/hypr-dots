#!/bin/bash


browser="librewolf"
bookmarks="
https://github.com/divalin757/hypr-dots
\nwiki.archlinux.org
\naur.archlinux.org
\nhttps://github.com/divalin757/fzf-file-manager
"



choosen=$(echo -e "url\nsearch\nbookmarks\nask chatgpt" | rofi -dmenu -p "choose url or search engine")

if [[ $choosen == "url" ]]; then
   url=$(rofi -dmenu -p "type a url")
   $browser $url
elif [[ $choosen == "search" ]]; then
  query=$(rofi -dmenu -p "look for a keyword")
  $browser "https://duckduckgo.com/?q=$(printf '%s' "$query" | sed 's/ /+/g')" &

elif [[ $choosen == "bookmarks" ]]; then
  bookmark=$(echo -e $bookmarks | rofi -dmenu -p "select a bookmark")
  $browser $bookmark

elif [[ $choosen == "ask chatgpt" ]]; then
  question=$(rofi -dmenu -p "ask ChatGPT:")
  $browser "https://chat.openai.com/?q=$(printf '%s' "$question" | sed 's/ /+/g')" &

fi
