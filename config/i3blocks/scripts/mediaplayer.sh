status=$(playerctl status)
if [[ $status == "Playing" ]] || [[ $status == "Paused" ]]; then
    echo -e $status":" $(playerctl metadata artist) "-" $(playerctl metadata title)
else
    echo -e "Not Playing"
fi
