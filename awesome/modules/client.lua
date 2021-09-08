local awful = require("awful")
local naughty  = require("naughty")

require("modules.picomController")

client.connect_signal("manage", function (c)
    app_name = "wow"

    -- naughty.notify({text = tostring(c.tag)})
    
    c.shape = function(cr,w,h)
	    gears.shape.rectangle(cr,w,h) -- 11
    end
    
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end

    if c.first_tag.layout.name == "floating" or c.floating then
	shadow_state(c,true)
    else
	shadow_state(c,false)
    end

    border_radius(c,not c.maximized)

    -- naughty.notify({text = tostring(c:geometry().width)})
end)
