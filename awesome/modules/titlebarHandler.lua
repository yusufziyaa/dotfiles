local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi


 client.connect_signal("request::titlebars", function(c)
     -- buttons for the titlebar
     if not c.requests_no_titlebar then
         
     local buttons = gears.table.join(
         awful.button({ }, 1, function()
             c:emit_signal("request::activate", "titlebar", {raise = true})
             awful.mouse.client.move(c)
         end),
         awful.button({ }, 3, function()
             c:emit_signal("request::activate", "titlebar", {raise = true})
             awful.mouse.client.resize(c)
         end)
     )
 
     local titlebar = awful.titlebar(c,{
	size = 34,
 	bg_focus = beautiful.titlebar_bg_focus
     })
    
     awful.titlebar.enable_tooltip = false

     --local closebutton = awful.titlebar.widget.closebutton(c)
     --local maximizedbutton = awful.titlebar.widget.closebutton(c)
     --local minimizebutton = awful.titlebar.widget.minimizebutton(c)

     local titlebar_layout = wibox.layout.align.horizontal
 
     titlebar : setup {
         {
	 	{
			{
				awful.titlebar.widget.closebutton(c),
				widget = wibox.container.place,
				forced_height = dpi(16),forced_width = dpi(16)
			},
			left = dpi(9),
			right = dpi(3),
			widget = wibox.container.margin
		},
		{
			{
        			awful.titlebar.widget.maximizedbutton(c),
        			widget = wibox.container.place,
				forced_height = dpi(16),forced_width = dpi(16)
			},
			left = dpi(3),
			right = dpi(3),
			widget = wibox.container.margin
		},
		{
        		{
		                awful.titlebar.widget.minimizebutton(c),
                		widget = wibox.container.place,
				forced_height = dpi(16),forced_width = dpi(16)
			},
		        left = dpi(3),
		        right = dpi(3),
        		widget = wibox.container.margin
		},
             	layout  = wibox.layout.fixed.horizontal()
         },
         { -- Middle
             buttons = buttons,
             layout  = wibox.layout.flex.horizontal
         },
         nil, --right
         layout = titlebar_layout,
     }
     end
     end)

---- }}}
