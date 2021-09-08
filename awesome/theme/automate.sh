#! /bin/bash

# resize and change circle.svg to circle.png then recolor it to use for buttons
# needed programs: imagemagick inkscape xgetres

rm -rf ./titlebar/circle.png
rm -rf ./titlebar/smaller_circle.png

#change color
#first is color and second is output file name

function colorize {
	rm -rf ./titlebar/$2.svg
	sed -e "s/#ffffff/$1/" ./titlebar/circle.svg > ./titlebar/$2.svg
}

colorize $(xgetres xresources.color1) red false
colorize $(xgetres xresources.color3) yellow false
colorize $(xgetres xresources.color2) green false
colorize $(xgetres xresources.color8) disabled false
colorize $(xgetres xresources.color9) red_hover true
colorize $(xgetres xresources.color11) yellow_hover true
colorize $(xgetres xresources.color10) green_hover true
colorize $(xgetres xresources.darkgray) disabled_hover true
