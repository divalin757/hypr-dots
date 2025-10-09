BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

# Bold and Underlined Text
BOLD='\033[1m'
UNDERLINE='\033[4m'

# Background Colors
BG_BLACK='\033[40m'
BG_RED='\033[41m'
BG_GREEN='\033[42m'
BG_YELLOW='\033[43m'
BG_BLUE='\033[44m'
BG_MAGENTA='\033[45m'
BG_CYAN='\033[46m'
BG_WHITE='\033[47m'

# High Intensity (Bright) Colors
BRIGHT_BLACK='\033[0;90m'
BRIGHT_RED='\033[0;91m'
BRIGHT_GREEN='\033[0;92m'
BRIGHT_YELLOW='\033[0;93m'
BRIGHT_BLUE='\033[0;94m'
BRIGHT_MAGENTA='\033[0;95m'
BRIGHT_CYAN='\033[0;96m'
BRIGHT_WHITE='\033[0;97m'

# Bold High Intensity Colors
BOLD_BRIGHT_BLACK='\033[1;90m'
BOLD_BRIGHT_RED='\033[1;91m'
BOLD_BRIGHT_GREEN='\033[1;92m'
BOLD_BRIGHT_YELLOW='\033[1;93m'
BOLD_BRIGHT_BLUE='\033[1;94m'
BOLD_BRIGHT_MAGENTA='\033[1;95m'
BOLD_BRIGHT_CYAN='\033[1;96m'
BOLD_BRIGHT_WHITE='\033[1;97m'

# Reset Code
RESET='\033[0m'

cpumodel() {
  cat /proc/cpuinfo | grep 'model name' | uniq | cut -d ' ' -f3-
}
uptime(){ 
  uptime -p | cut -d ' ' -f2-
}
shell() { 
  sh=$(echo $SHELL)
  basename $sh
}
wm() {
  echo $DESKTOP_SESSION
}
kernel() {
  uname -s -r
}
usr() {
  echo $USER
}
hname() {
  cat /etc/hostname
}
term() {
  echo $TERM
}
ram() {
  free -m | awk 'NR==2{printf "%s / %sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'
}
os() {
  hostnamectl |grep Operating |cut -d ' ' -f4-
}
#cpumod=$(cpumodel)
#uptim=$(uptime)
#shel=$(shell)
#de=$(wm)
#ker=$(kernel)
#user=$(usr)
#hostname=$(hname)
#terminal=$(term)
#mem=$(ram)
#operatingsys=$(os)

echo -e $BLUE$(os)$RESET
echo -e $RED$(wm)$RESET
echo -e $(shell)$RESET
echo -e $(kernel)$RESET
echo -e $(usr)$RESET
echo -e $(hname)$RESET
echo -e $(term)$RESET
echo -e $(ram)$RESET
echo -e $(cpumodel)$RESET
