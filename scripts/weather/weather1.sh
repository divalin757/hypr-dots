CITY="Modiin"

if [[ -z "$CITY"  ]]; then
  echo "Error: Unable to determine your location"
  exit 1
fi

weather_info=$(curl -s --fail "https://en.wttr.in/$CITY?format=%c+%t" 2>/dev/null)

if [[ $? -ne 0 || -z "$weather_info" ]]; then
  echo "🌦   +19°C lol"
  exit 1
fi

echo "$weather_info"
