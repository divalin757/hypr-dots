#!/bin/bash


get_ip() {
  echo "Choose keyword for IP scan (press Enter for full scan)"
  read query
  if [ -z "$query" ]; then
    arp-scan --localnet  # Run full scan if query is empty
  else
    arp-scan --localnet | rg "$query"  # Filter scan results with the query
  fi
}


ping_ip() {
  echo "choose ip or website name to ping"
  read ip
  ping $ip
}


remote_desktop() {
  echo "choose ip to remote desktop into"
  read rmip
  echo "choose user name for remote desktop"
  read user
  echo "choose passwd for remote desktop(note this my not work properly)"
  read passwd
  xfreerdp /v:$rmip /u:$user /p:$passwd
}

geolocation() {
  ./scripts/geolocation.sh
}
arpspoofer() {
  echo "lol i aint got no arp spoofer yet xd :("
}
ddos() {
 ./scripts/ddos.py

}






popup_cmd() {
    local esc="\033"
    local reset="${esc}[0m"
    local blue="${esc}[38;5;39m"
    local prompt=">"  # Updated prompt to purple
    local prompt1=""
    local width=44           # width inside box (excluding pipes)
    local line_width=46      # total line length including pipes (2 pipes + 44 inside)
    local input=""
    local rows cols

    rows=$(stty size | awk '{print $1}')
    cols=$(stty size | awk '{print $2}')

    local box_width=$line_width
    local box_height=3
    local top=$(( (rows - box_height) / 2 ))
    local left=$(( (cols - box_width) / 2 ))

    # Helpers
    cursor_pos() { echo -ne "${esc}[$1;${2}H"; }
    clear_line() { echo -ne "${esc}[2K"; }
    hide_cursor() { echo -ne "${esc}[?25l"; }
    show_cursor() { echo -ne "${esc}[?25h"; }

    draw_box() {
        cursor_pos $top $left
        echo -e "${blue}┌────────────────────────────────────────────┐${reset}"
        cursor_pos $((top + 1)) $left
        # Print input line with perfect pipe alignment
        local input_len=${#input}
        local prompt_len=${#prompt}
        local padding=$((line_width - 2 - 1 - prompt_len - input_len - 1))
        # Explanation of padding:
        # total line length = 46
        # subtract 2 for left & right pipes
        # subtract 1 for space after left pipe
        # subtract prompt length
        # subtract input length
        # subtract 1 for space before right pipe
        printf "${blue}│ ${reset}%s%s%*s ${blue}│${reset}\n" "$prompt" "$input" "$padding" ""
        cursor_pos $((top + 2)) $left
        echo -e "${blue}└────────────────────────────────────────────┘${reset}"
    }

    clear_box() {
        for ((i=0; i<box_height; i++)); do
            cursor_pos $((top + i)) 0
            clear_line
        done
    }

    hide_cursor
    draw_box
    cursor_pos $((top + 1)) $((left + 3 + ${#prompt}))

    # Use read -e to allow editing; ESC+Enter closes prompt without running command
    IFS= read -e -p "" input

    clear_box
    show_cursor

    # Close if empty input or input starts with ESC (ESC + Enter)
    if [[ -z "$input" || $input == $'\e'* ]]; then
        return
    fi

    # Run command, capture output
    local output
    output=$(eval "$input" 2>&1)

    # Output box sizing
    local out_width=$((cols - 10))
    local out_height=10
    local out_left=$(( (cols - out_width) / 2 ))
    local out_top=$(( (rows - (out_height + 2)) / 2 ))

    cursor_pos $out_top $out_left
    echo -e "${blue}┌$(printf '─%.0s' $(seq 1 $((out_width - 2))))┐${reset}"

    local i=1
    while IFS= read -r line && (( i < out_height )); do
        cursor_pos $((out_top + i)) $out_left
        printf "${blue}│${reset} %-*.*s ${blue}│${reset}\n" $((out_width - 4)) $((out_width - 4)) "$line"
        ((i++))
    done <<< "$output"

    while (( i < out_height )); do
        cursor_pos $((out_top + i)) $out_left
        printf "${blue}│${reset} %-*s ${blue}│${reset}\n" $((out_width - 4)) ""
        ((i++))
    done

    cursor_pos $((out_top + out_height)) $out_left
    echo -e "${blue}└$(printf '─%.0s' $(seq 1 $((out_width - 2))))┘${reset}"

    cursor_pos $((out_top + out_height + 1)) 0
    echo -n "Press any key to close..."
    read -rsn1

    for ((i=0; i<=out_height+1; i++)); do
        cursor_pos $((out_top + i)) 0
        clear_line
    done
}

