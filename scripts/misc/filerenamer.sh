#!/bin/bash

var=$(ls -a | fzf --height 40%)
wd=$(pwd)

echo "choose new name for $var "
read filename
mv $wd/$var $wd/$filename
echo "succusessfully renamed $var to $filename"
