#!/bin/bash

source ~/scripts/hackatull/funcs.sh
source ~/scripts/hackatull/color.sh

clear 
var1="ip scanner"
var2="ping ip"
var3="remote desktop"
var4="geolocation "
var5="arp spoofer"
var6="quit the hacka program?"
banner="
                   ██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██████╗ ██████╗  ██████╗ ██╗  ██╗
                   ██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗██╔══██╗██╔═══██╗╚██╗██╔╝
                   ███████║███████║██║     █████╔╝ █████╗  ██████╔╝██████╔╝██║   ██║ ╚███╔╝ 
                   ██╔══██║██╔══██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗██╔══██╗██║   ██║ ██╔██╗ 
                   ██║  ██║██║  ██║╚██████╗██║  ██╗███████╗██║  ██║██████╔╝╚██████╔╝██╔╝ ██╗
                   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝

"


while true; do
  echo -e "                             $GREEN$banner$RESET"
  echo -e "                                           1 $BLUE$var1$RESET"
  echo -e "                                           2 $BLUE$var2$RESET"
  echo -e "                                           3 $BLUE$var3$RESET"
  echo -e "                                           4 $BLUE$var4$RESET"
  echo -e "                                           5 $BLUE$var5$RESET"
  echo -e "                                           q $RED$var6$RESET"

      read -n 1 -s key

    # Actions based on key pressed
    case $key in
        1)
            get_ip 
            sleep 3
            clear
            ;;
        2)
            ping_ip
            clear
            ;;
        3)
            remote_desktop
            sleep 3 
            clear
            ;;
        4)
            geolocation
            sleep 6
            clear
            ;;
        5)
            echo -e "arp spoofers are ilegal btw (i use arch btw) :)"
            arpspoofer
            ;;
        6)
            echo -e "\nYou pressed '6' - Action 6"
            ;;
        7)
            echo -e "\nYou pressed '7' - Action 7"
            ;;
        8)
            echo -e "\nYou pressed '8' - Action 8"
            ;;
        :)
            popup_cmd
            ;;
        q)
            echo -e "\nDont worry you can always come back to the hacka program and hack some noobs"
            break  # Exit the loop
            ;;
        $'\x0c')  # Ctrl+L (ASCII code 0x0c) for clearing the screen
          echo -e "\nYou pressed 'Ctrl+L' - Clearing the screen"
          clear
          ;;
        *)
            echo -e "\nInvalid key. Press a number from '1' to '8', or 'q' to quit."
            ;;
    esac
    sleep 0.1
done


