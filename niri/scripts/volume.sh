#!/bin/sh

down() {
    pamixer -d 5
    volume=$(pamixer --get-volume)
    [ $volume -gt 0 ] && volume=`expr $volume`
    dunstify -a "VOLUME" "Decreasing to $volume%" -h int:value:"$volume" -i audio-volume-low-symbolic -r 2593 -u normal
}

up() {
    pamixer -i 5
    volume=$(pamixer --get-volume)
    [ $volume -lt 100 ] && volume=`expr $volume`
    dunstify -a "VOLUME" "Increasing to $volume%" -h int:value:"$volume" -i audio-volume-high-symbolic -r 2593 -u normal
}

mute() {
    muted="$(pamixer --get-mute)"
    if $muted; then
        pamixer -u
        dunstify -a "VOLUME" "UNMUTED" -i audio-volume-high-symbolic -r 2593 -u normal
    else
        pamixer -m
        dunstify -a "VOLUME" "MUTED" -i audio-volume-muted-symbolic -r 2593 -u normal
    fi
}

micmute() {
    muted="$(pamixer --source 1 --get-mute)"
    if $muted; then
        pamixer --source 1 -u
        dunstify -a "MICROPHONE" "UNMUTED" -i audio-input-microphone-symbolic -r 2593 -u normal
    else
        pamixer --source 1 -m
        dunstify -a "MICROPHONE" "MUTED" -i audio-input-microphone-muted-symbolic -r 2593 -u normal
    fi

}

case "$1" in
    up) up;;
    down) down;;
    mute) mute;;
    micmute) micmute;;
esac