#!/bin/bash

if [[ $(playerctl -p firefox status 2>/dev/null) == "Playing" ]]; then
    status='▷  '
else
    status='  '
fi

song_info=$(playerctl -p firefox metadata --format "$status {{title}}      {{artist}}")

echo "$song_info"
