#!/usr/bin/env bash

#COLOR VARIABLES
RED="\x1b[31m"
YELLOW="\x1b[33m"
GREEN="\x1b[32m"
CYAN="\x1b[36m"
BLUE="\x1b[34m"
PURPLE="\x1b[35m"
BLACK="\x1b[30m"
WHITE="\x1b[37m"
B_RED="\x1b[91m"
B_YELLOW="\x1b[93m"
B_GREEN="\x1b[92m"
B_CYAN="\x1b[96m"
B_BLUE="\x1b[94m"
B_PURPLE="\x1b[95m"
B_WHITE="\x1b[97m"
GRAY="\x1b[90m"
CLS="\x1b[0m"

# CUSTOMIZZATION ZONE
# Cool characters for the symbol ◆ ◀ ▧ ▨ ▦ ▥ ▤ ▣ ● ◕ █
SYMBOL="●"
SEPARATOR="-"
# Set colors
TXTCOL=$YELLOW
WORDCOL=$GREEN
CATCOL=$CYAN


# TESTS ZONE
#Wm script by Alberto Salvia Novella (es20490446e.wordpress.com)
CPU=$(grep -m 1 'model name' /proc/cpuinfo)
RAM=$(free -h | grep "^Mem:" | awk '{print $3 "/" $2}')
OS=$(grep -m1 "NAME=" < /etc/os-release | cut -d '"' -f 2 | cut -d '=' -f 2)
WM=${WAYLAND_DISPLAY:-$(xprop -id "$(xprop -root _NET_SUPPORTING_WM_CHECK | cut -d' ' -f5)" _NET_WM_NAME | cut -d'"' -f2)} # thanks to kazoku
ARCH=$(uname -m)
NODE=$(uname -n)
KERNEL_NAME=$(uname -s)
KERNEL_REL=$(uname -r)
SHELL_NAME=$(cat /proc/$$/comm) # how does this even work
UPTIME=$(uptime -p) # ??
RESOLUTION=$(hyprctl monitors | grep "*" | awk '{print $1}') # ? ? ?
USED_SPACE=$(df -h / | awk '{print $3}' | grep "^[0-9]")
TOTAL_SPACE=$(df -h / | awk '{print $2}' | grep "^[0-9]")
GPU=$(glxinfo | grep "Device")
TERMINAL=$(TERM_PID=$(ps -p $$ -o args,ppid | grep -o "[0-9]" | tr -d "\n"); ps -p ${TERM_PID} -o args | tr -d "\n")

Help()
{
        printf "
-m      Adds more info, like the system architecture and graphic session(X11 or WAYLAND) to the output
-d      Adds your dark color palette to the output
-b      Adds your bright color palette to the output
-c	Adds both your dark and bright color palette to the output
-a	Adds all of the options above
-h      Shows this help message\n
This program is licensed under the GPLv3 license.\n
If you encounter any issue or want a feature to be added please open an issue on the GitHub page.
https://github.com/jhonnyrice/cat-fetch\n
"
}

#	Get Help Message
if [ "$1" = "-h" ]
then
	printf "${CLS}"
	Help
	exit 0
fi

ExtraInfo()
{
	echo -e "                ${WORDCOL}arch:     ${TXTCOL}${ARCH}"
	echo -e "                ${WORDCOL}graphic session: ${TXTCOL}$XDG_SESSION_TYPE"
	echo -e "                ${WORDCOL}cpu:      ${TXTCOL}${CPU:13}"
	echo -e "                ${WORDCOL}gpu:      ${TXTCOL}${GPU:12}"
	echo -e "                ${WORDCOL}ram:      ${TXTCOL}${RAM}"
	echo -e "                ${WORDCOL}resolution:      ${TXTCOL}${RESOLUTION}"
	echo -e "                ${WORDCOL}space:    ${TXTCOL}${USED_SPACE} used, out of ${TOTAL_SPACE}"
	echo -e "                ${WORDCOL}terminal: ${TXTCOL}${TERMINAL:7}"
FEDORA="Fedora Linux"
case ${OS,,} in
    arch)
	ARCH_PKG=$(pacman -Qq --color never > packnum.txt && wc -l packnum.txt)
	echo -e "                ${WORDCOL}Packages: ${TXTCOL}${ARCH_PKG} (pacman)"
    ;;
    debian)
	DEB_PKG=$(dpkg-query -f '${binary:Package}\n' -W | wc -l)
	echo -e "                ${WORDCOL}Packages: ${TXTCOL}${DEB_PKG} (dpkg)"
    ;;
    ubuntu)
	DEB_PKG=$(dpkg-query -f '${binary:Package}\n' -W | wc -l)
	echo -e "                ${WORDCOL}Packages: ${TXTCOL}${DEB_PKG} (dpkg)"
    ;;
    void)
    	XBPS_PKG=$(xbps-query -l | wc -l)
	echo -e "                ${WORDCOL}Packages: ${TXTCOL}${XBPS_PKG} (xbps)"
    ;;
    "fedora linux")
    	RPM_PKG=$(rpm -qa | wc -l)
	echo -e "                ${WORDCOL}Packages: ${TXTCOL}${RPM_PKG} (rpm)"
    ;;
esac

}

DarkColor()
{
	echo -e "                ${RED} ${SYMBOL} ${YELLOW} ${SYMBOL} ${GREEN} ${SYMBOL} ${CYAN} ${SYMBOL} ${BLUE} ${SYMBOL} ${PURPLE} ${SYMBOL} ${WHITE} ${SYMBOL} ${BLACK} ${SYMBOL} ${CLS}"
}

BrightColor()
{
	echo -e "                ${B_RED} ${SYMBOL} ${B_YELLOW} ${SYMBOL} ${B_GREEN} ${SYMBOL} ${B_CYAN} ${SYMBOL} ${B_BLUE} ${SYMBOL} ${B_PURPLE} ${SYMBOL} ${B_WHITE} ${SYMBOL} ${GRAY} ${SYMBOL} ${CLS}"
}

Separator()
{
printf "                ${CLS}"
for (( i=0; i<24; i++ )); do printf "-"; done
printf "\e[0m\n"
}

echo -e "${CATCOL}                $NODE@$LOGNAME                ${CLS}"
LENGTH=${#NODE}+${#LOGNAME}+1
printf "                ${CLS}"
for (( i=0; i<LENGTH; i++ )); do printf "-"; done

printf "\e[0m\n"
echo -e "${CATCOL}   /'._         ${WORDCOL}os:      ${TXTCOL}${OS}"
echo -e "${CATCOL}  (° o 7        ${WORDCOL}wm:      ${TXTCOL}${WM}"
echo -e "${CATCOL}   |'-'\"~.  .   ${WORDCOL}shell:   ${TXTCOL}${SHELL_NAME}"
echo -e "${CATCOL}   Uu^~C_J._.\"  ${WORDCOL}uptime:  ${TXTCOL}${UPTIME:3}"
echo -e "${CATCOL}                ${WORDCOL}kernel:  ${TXTCOL}${KERNEL_NAME} ${KERNEL_REL}"
printf "\e[0m"

while getopts ":mabdc" option; do
   case $option in
      m) #	Get more info
	 ExtraInfo
	 printf "${CLS}";;
      a) # 	Get all of the info
         ExtraInfo
	 Separator
	 DarkColor
	 BrightColor
	 printf "${CLS}";;
      b) #      Display bright color palette
         BrightColor
	 printf "${CLS}";;
      d) #	Display dark color palette
	 DarkColor
	 printf "${CLS}";;
      c) #	Display both bright and dark color palette
      	 Separator
	 DarkColor
	 BrightColor
	 printf "${CLS}";;
      ?) #     Get unknown command output
	 printf "${CLS}\n"
         echo "This option does not exist. For the full list of options please use the command 'catfetch -h'"
         exit 0
   esac
done


# /'._   ._
#(- = 7___.~'
# |--''   )
# LL_)'CC_J
