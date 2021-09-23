#! /bin/bash

# WHY DOES THIS NEEDED??
# cuz i change my xresources a lot

# resize and change circle.svg to circle.png then recolor it to use for buttons
# needed programs: imagemagick inkscape xgetres

#change color
#first is color and second is output file name

function colorize {
	rm -rf ./titlebar/$2.svg
	sed -e "s/#ffffff/$1/" ./titlebar/circle.svg > ./titlebar/$2.svg
}

function icon_colorize {
	# 1 -> circle color
	# 2 -> icon color
	# 3 -> output
	# 4 -> icon file
	rm -rf ./titlebar/$3.svg
	sed -e "s/#ffffff/$1/" -e "s/#000000/$2/" ./titlebar/$4.svg > ./titlebar/$3.svg
}

colorize $(xgetres xresources.color2) green false
colorize $(xgetres xresources.color8) disabled false
#colorize $(xgetres xresources.color9) red_hover true
colorize $(xgetres xresources.color10) green_hover true
colorize $(xgetres xresources.darkgray) disabled_hover true


colorize $(xgetres xresources.color1) red false

icon_colorize $(xgetres xresources.color1) $(xgetres xresources.color8) close_hover x
icon_colorize $(xgetres xresources.color8) $(xgetres xresources.color0) close_hover_disabled x 

icon_colorize $(xgetres xresources.darkred) $(xgetres xresources.color8) close_press x
icon_colorize $(xgetres xresources.color8) $(xgetres xresources.color0) close_press_disabled x


colorize $(xgetres xresources.lightorange) yellow false

icon_colorize $(xgetres xresources.lightorange) $(xgetres xresources.color8) maximized_hover maximizer
icon_colorize $(xgetres xresources.darkorange) $(xgetres xresources.color8) maximized_press maximizer

icon_colorize $(xgetres xresources.lightorange) $(xgetres xresources.color8) unmaximized_hover unmaximized
icon_colorize $(xgetres xresources.darkorange) $(xgetres xresources.color8) unmaximized_press unmaximized

icon_colorize $(xgetres xresources.color8) $(xgetres xresources.color0) maximized_hover_disabled maximizer
icon_colorize $(xgetres xresources.color8) $(xgetres xresources.color0) maximized_press_disabled maximizer

icon_colorize $(xgetres xresources.color8) $(xgetres xresources.color0) unmaximized_hover_disabled unmaximized
icon_colorize $(xgetres xresources.color8) $(xgetres xresources.color0) unmaximized_press_disabled unmaximized
