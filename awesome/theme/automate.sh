#! /bin/bash

# resize and change circle.svg to circle.png then recolor it to use for buttons
# needed programs: imagemagick inkscape xgetres

rm -rf ./titlebar/circle.png
rm -rf ./titlebar/smaller_circle.png

#change color
#first is color and second is output file name

function colorize {
	rm -rf ./titlebar/$2.svg
	rm -rf ./titlebar/$2.png

	sed -e "s/#ffffff/$1/" ./titlebar/circle.svg > ./titlebar/$2.svg
	inkscape -w 64 -h 64 ./titlebar/$2.svg -o ./titlebar/$2.png
	convert -set colorspace sRGB -composite -gravity center ./titlebar/empty.png ./titlebar/$2.png ./titlebar/smaller_$2.png
	rm -rf ./titlebar/$2.png
	mv ./titlebar/smaller_$2.png ./titlebar/$2.png

}

colorize $(xgetres xresources.color1) red
colorize $(xgetres xresources.color3) yellow
colorize $(xgetres xresources.color2) green
colorize $(xgetres xresources.color8) disabled
