local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")


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

    local titlebar = awful.titlebar(c,{size = 30})

    local titlebar_layout = wibox.layout.align.horizontal

    titlebar : setup {
        {
	        awful.titlebar.widget.closebutton(c),
	        awful.titlebar.widget.maximizedbutton(c),
	        awful.titlebar.widget.minimizebutton (c),
            layout  = wibox.layout.fixed.horizontal()
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        nil, --right
        layout = titlebar_layout,
    }
    end
    end)

-- }}}
