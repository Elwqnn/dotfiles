#!/bin/sh

save_path="~/Pictures/Screenshots/$(date +'%s_screenshot.png')"

case $1 in
a)  # drag to manually snip an area / click on a window to print it
    grimblast --notify copysave area $save_path;;
af)  # frozen screen, drag to manually snip an area / click on a window to print it
    grimblast --notify --freeze copysave area $save_path;;
m) # focused monitor
    grimblast --notify copysave output $save_path;;
esac
