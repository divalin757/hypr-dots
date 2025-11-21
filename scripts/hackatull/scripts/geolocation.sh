#!/bin/bash
# Prompt user for IP address
echo "Enter IP you want to locate:"
read ip

# Fetch the JSON data and format it with colors, plus a Google Maps link
curl -s https://ipinfo.io/$ip/json | jq -r '
  .hostname, .ip, .city, .region, .country, .loc, .org' |
  awk '
    BEGIN {
      # Set color codes
      BLUE="\033[1;34m"
      GREEN="\033[1;32m"
      PURPLE="\033[1;35m"
      RESET="\033[0m"
    }
    NR == 1 {print BLUE "hostname" RESET ": " GREEN $0 RESET}
    NR == 2 {print BLUE "ip" RESET ": " GREEN $0 RESET}
    NR == 3 {print BLUE "city" RESET ": " GREEN $0 RESET}
    NR == 4 {print BLUE "region" RESET ": " GREEN $0 RESET}
    NR == 5 {print BLUE "country" RESET ": " GREEN $0 RESET}
    NR == 6 { 
      # Extract loc and add Google Maps link
      print BLUE "loc" RESET ": " GREEN $0 RESET "\nGoogle Maps: " PURPLE "https://www.google.com/maps?q=" $0 RESET
    }
    NR == 7 {print BLUE "org" RESET ": " GREEN $0 RESET}
  '
