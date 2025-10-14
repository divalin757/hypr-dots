CITY="Jerusalem"
COUNTRY="israel"
if [[ -z "$CITY" || -z "$COUNTRY" ]]; then
  echo "Error: Unable to determine your location"
  exit 1
fi

weather_info=$(curl  -s --fail --compressed -m 2.4 "https://en.wttr.in/$CITY?format=%c+%t" 2> /dev/null)


if [[ $? -ne 0 || -z "$weather_info" ]]; then
  echo "Error: Failed tp retrove weather info fo $COUNTRY $CITY"
  exit 1
fi

echo "$weather_info"
