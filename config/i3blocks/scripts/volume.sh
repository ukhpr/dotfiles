if [[ "$(pamixer --get-mute)" = "true" ]]; then
    icon=""
    color="#ffff00"
else
    icon=""
    color="#dddddd"
fi
vol=$(pamixer --get-volume)

printf "%s %s%%\n" "$icon" "$vol"
printf "Volume\n"
printf "$color\n"
