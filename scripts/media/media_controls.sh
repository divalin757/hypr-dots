#!/bin/bash

case "$1" in
    next)
        playerctl next
        ;;
    prev)
        playerctl previous
        ;;
    play-pause)
        playerctl play-pause
        ;;
    *)
        echo "Usage: $0 {next|prev|play-pause}"
        exit 1
        ;;
esac

