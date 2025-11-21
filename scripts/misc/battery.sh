#!/bin/bash

# Big digits for numbers 0-9
big_digits=(
  ["0"]="  ***  
 *   * 
*     *
*     *
*     *
 *   * 
  ***  "
  ["1"]="   *   
  **   
   *   
   *   
   *   
   *   
  ***  "
  ["2"]="  ***  
 *   * 
    *  
   *   
  *    
 *   * 
 ***** "
  ["3"]="  ***  
 *   * 
    *  
  ***  
    *  
 *   * 
  ***  "
  ["4"]=" *   * 
 *   * 
 ***** 
    *  
    *  
    *  
    *  "
  ["5"]=" ***** 
 *     
 ***** 
     * 
     * 
 *   * 
  ***  "
  ["6"]="  ***  
 *   * 
 *     
 ***** 
 *   * 
 *   * 
  ***  "
  ["7"]=" ***** 
     * 
    *  
   *   
  *    
  *    
  *    "
  ["8"]="  ***  
 *   * 
 *   * 
  ***  
 *   * 
 *   * 
  ***  "
  ["9"]="  ***  
 *   * 
 *   * 
  **** 
     * 
 *   * 
  ***  "
)

# Function to get battery info
get_battery_info() {
  local device
  device=$(upower -e | grep --color=never battery)
  if [[ -z "$device" ]]; then
    echo "Battery not found."
    exit 1
  fi
  upower -i "$device"
}

# Function to print big digits
print_big() {
  local string="$1"
  local output=()
  for ((i=0; i<7; i++)); do
    output[i]=""
  done

  for ((i=0; i<${#string}; i++)); do
    char="${string:$i:1}"
    digit_lines=()
    # Properly handle the multi-line string from the associative array
    while IFS= read -r line; do
      digit_lines+=("$line")
    done <<< "${big_digits[$char]}"
    
    for j in "${!digit_lines[@]}"; do
      output[j]+="${digit_lines[j]}  "
    done
  done

  for line in "${output[@]}"; do
    echo "$line"
  done
}

while true; do
  # Get battery info
  battery_info=$(get_battery_info)
  percentage=$(echo "$battery_info" | grep --color=never "percentage" | awk '{print $2}' | sed 's/%//')
  state=$(echo "$battery_info" | grep --color=never "state" | awk '{print $2}')

  # Determine color
  color_reset="\033[0m"
  color=""
  if [[ "$state" == "charging" ]]; then
    color="\033[92m" # Green for charging
  elif (( percentage <= 20 )); then
    color="\033[91m" # Red
  elif (( percentage <= 50 )); then
    color="\033[93m" # Yellow
  else
    color="\033[92m" # Green
  fi

  # Get terminal dimensions
  term_width=$(tput cols)
  term_height=$(tput lines)

  # Prepare the output
  big_percentage_str=$(print_big "${percentage}")
  
  # Calculate width and height of the big percentage string
  output_width=0
  output_height=0
  while IFS= read -r line; do
    if (( ${#line} > output_width )); then
      output_width=${#line}
    fi
    ((output_height++))
  done <<< "$big_percentage_str"


  # Calculate position
  x=$(( (term_width - output_width) / 2 ))
  y=$(( (term_height - output_height) / 2 ))

  # Clear screen and print
  clear
  
  # Move cursor and print each line
  current_y=$y
  while IFS= read -r line; do
    tput cup "$current_y" "$x"
    echo -e "${color}${line}${color_reset}"
    ((current_y++))
  done <<< "$big_percentage_str"
  
  # Print charging status and percentage
  status_text="$state - $percentage%"
  tput cup $((y + output_height + 1)) $(((term_width - ${#status_text}) / 2))
  echo "$status_text"

  sleep 10
done
