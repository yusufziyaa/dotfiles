---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local beautiful = require("beautiful")
local dpi = xresources.apply_dpi
local colors = xresources.get_current_theme()

local gfs = require("gears.filesystem")
local config_dir = "~/.config/awesome/"
local gears = require("gears")
local gcolor = require("gears.color")
local naughty = require("naughty")
local nconf = naughty.config

local theme = {}

theme.font          = "Inter Medium 9"
theme.icon_theme = "Adwaita"

local lightblack = "#4B4E51"

theme.bg_focus      = colors.background
theme.bg_normal     = colors.background
theme.bg_urgent     = colors.color9
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = colors.foreground
theme.fg_focus      = colors.foreground
theme.fg_urgent     = colors.foreground
theme.fg_minimize   = colors.foreground

theme.border_width  = 2
theme.border_radius = 20
theme.useless_gap   = dpi(10)
theme.border_normal = colors.color8
theme.border_focus  = colors.color8
theme.border_marked = colors.color8

nconf.defaults.icon_size=100
nconf.defaults.border_width=0
nconf.defaults.shape = function(cr,w,h) gears.shape.rounded_rect(cr,w,h,5) end
nconf.defaults.width=300

theme.taglist_fg_focus = colors.color6
theme.taglist_fg_occupied = colors.foreground
theme.taglist_fg_empty = colors.color8

theme.titlebar_fg_normal = lightblack


theme.systray_icon_spacing = 1
-- theme.taglist_squares_sel = gears.filesystem.get_configuration_dir()  .. "images/bar.png"
-- theme.taglist_squares_unsel  = gears.filesystem.get_configuration_dir()  .. "images/bar2_.png"


-- There are other variable sets
-- overriding the theme one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = config_dir.."theme/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

local circle = config_dir.."theme/titlebar/circle.svg"

local close = gcolor.recolor_image(circle,colors.color9)
local minimize = gcolor.recolor_image(circle,colors.color10)
local maximize = gcolor.recolor_image(circle,colors.color11)
local disabled = gcolor.recolor_image(circle,colors.color15)

-- Define the image to load
theme.titlebar_close_button_normal = config_dir.."theme/titlebar/disabled.svg"
theme.titlebar_close_button_normal_hover = config_dir.."theme/titlebar/close_hover_disabled.svg"
theme.titlebar_close_button_normal_press = config_dir.."theme/titlebar/close_press_disabled.svg"

theme.titlebar_close_button_focus  = config_dir.."theme/titlebar/red.svg"
theme.titlebar_close_button_focus_press = config_dir.."theme/titlebar/close_press.svg"
theme.titlebar_close_button_focus_hover  = config_dir.."theme/titlebar/close_hover.svg"


theme.titlebar_minimize_button_normal = config_dir.."theme/titlebar/disabled.svg"
theme.titlebar_minimize_button_focus  = config_dir.."theme/titlebar/green.svg"
theme.titlebar_minimize_button_normal_hover  = config_dir.."theme/titlebar/disabled_hover.svg"
theme.titlebar_minimize_button_focus_hover  = config_dir.."theme/titlebar/green_hover.svg"


theme.titlebar_maximized_button_normal_active = config_dir.."theme/titlebar/disabled.svg"
theme.titlebar_maximized_button_normal_inactive = config_dir.."theme/titlebar/disabled.svg"
theme.titlebar_maximized_button_normal_active_hover = config_dir.."theme/titlebar/unmaximized_hover_disabled.svg"
theme.titlebar_maximized_button_normal_inactive_hover = config_dir.."theme/titlebar/maximized_hover_disabled.svg"
theme.titlebar_maximized_button_normal_active_press = config_dir.."theme/titlebar/unmaximized_press_disabled.svg"
theme.titlebar_maximized_button_normal_inactive_press = config_dir.."theme/titlebar/maximized_press_disabled.svg"

theme.titlebar_maximized_button_focus_active = config_dir.."theme/titlebar/yellow.svg"
theme.titlebar_maximized_button_focus_inactive = config_dir.."theme/titlebar/yellow.svg"
theme.titlebar_maximized_button_focus_active_hover = config_dir.."theme/titlebar/unmaximized_hover.svg"
theme.titlebar_maximized_button_focus_inactive_hover = config_dir.."theme/titlebar/maximized_hover.svg"
theme.titlebar_maximized_button_focus_inactive_press = config_dir.."theme/titlebar/maximized_press.svg"
theme.titlebar_maximized_button_focus_active_press = config_dir.."theme/titlebar/unmaximized_press.svg"


-- theme.wallpaper = config_dir.."/theme/background.png"
theme.wallpaper = config_dir.."/theme/colorful.png"

-- You can use your own layout icons like this:
theme.layout_fairh = config_dir.."theme/layouts/fairhw.png"
theme.layout_fairv = config_dir.."theme/layouts/fairvw.png"
theme.layout_floating  = config_dir.."theme/layouts/floatingw.png"
theme.layout_magnifier = config_dir.."theme/layouts/magnifierw.png"
theme.layout_max = config_dir.."theme/layouts/maxw.png"
theme.layout_fullscreen = config_dir.."theme/layouts/fullscreenw.png"
theme.layout_tilebottom = config_dir.."theme/layouts/tilebottomw.png"
theme.layout_tileleft   = config_dir.."theme/layouts/tileleftw.png"
theme.layout_tile = config_dir.."theme/layouts/tilew.png"
theme.layout_tiletop = config_dir.."theme/layouts/tiletopw.png"
theme.layout_spiral  = config_dir.."theme/layouts/spiralw.png"
theme.layout_dwindle = config_dir.."theme/layouts/dwindlew.png"
theme.layout_cornernw = config_dir.."theme/layouts/cornernww.png"
theme.layout_cornerne = config_dir.."theme/layouts/cornernew.png"
theme.layout_cornersw = config_dir.."theme/layouts/cornersww.png"
theme.layout_cornerse = config_dir.."theme/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
