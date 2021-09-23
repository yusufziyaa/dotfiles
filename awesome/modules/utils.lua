local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local menubar = require("menubar")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

require("modules.generalShortcuts")

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
}
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                      menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

       -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))


   s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
	style = {
		shape = function (cr,w,h) gears.shape.circle(cr,w,h) end,
	},
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    local sgeo = s.geometry

     -- Create the wibox
     s.mywibox = awful.wibar({ 
	    screen = s,
	    width =  "100%",
	    height = beautiful.get_font_height(nil) * 1.5,
	    shape = function(cr,w,h) gears.shape.rectangle(cr,w,h) end,
   	    opacity= 0.6,
	    border_width=0,
	    visible=true,
	    ontop=false,
	    type="toolboawful.wibar"

      })

      local app_name = "denemeee"

      local app_widget = wibox.widget({
            text = app_name,
	    widget = wibox.widget.textbox
      })

      local systray = wibox.widget.systray()
      systray:set_base_size(15)

      -- Add widgets to the wibox
      s.mywibox:setup {
	
         	layout = wibox.layout.align.horizontal,
		expand = "none",
        	{ -- Left widgets
            		layout = wibox.layout.fixed.horizontal,
			        app_widget,
            		s.mypromptbox,
        	},
		{
			layout = wibox.layout.fixed.horizontal,
			s.mytaglist,
		}, -- Middle widget
        	{ -- Right widgets
	    		layout = wibox.layout.fixed.horizontal,
            		mykeyboardlayout,
			{
				{
					systray,
					widget = wibox.container.place,
				},
				widget = wibox.container.margin,
				left = dpi(2),
				right = dpi(6)
			},
			mytextclock,
	     		s.mylayoutbox,
        	},
	}
        
end)
