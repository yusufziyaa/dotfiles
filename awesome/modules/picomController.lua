local awful = require("awful")
local beautiful = require("beautiful")

function shadow_active(c,state)
    if state then
         awful.spawn.with_shell("xprop -id " .. c.window .. " -f _ACTIVE_SHADOW 32c -set _ACTIVE_SHADOW 1 &")
     else
         awful.spawn.with_shell("xprop -id " .. c.window .. " -f _ACTIVE_SHADOW 32c -set _ACTIVE_SHADOW 0 &")
     end
end

function shadow_state(c,state)
    if state then
	awful.spawn.with_shell("xprop -id " .. c.window .. " -f _PICOM_SHADOW 32c -set _PICOM_SHADOW 1 &")
    else 
	awful.spawn.with_shell("xprop -id " .. c.window .. " -f _PICOM_SHADOW 32c -set _PICOM_SHADOW 0 &")
    end
end

function border_radius(c,state)
    if state then
	awful.spawn.with_shell("xprop -id " .. c.window .. " -f _BORDER_RADIUS 32c -set _BORDER_RADIUS 1 &")
    else
	awful.spawn.with_shell("xprop -id " .. c.window .. " -f _BORDER_RADIUS 32c -set _BORDER_RADIUS 0 &")
    end
end

client.connect_signal("property::maximized",function (c)
    border_radius(c,not c.maximized)
end)

client.connect_signal("property::floating",function (c)
    shadow_state_controller(c)
end)

function tag_control(tag)
    for k,v in pairs(tag:clients()) do
	shadow_state_controller(v)
    end
end

function shadow_state_controller(c)
    if c.floating then
	shadow_state(c,true)
    else
	if c.first_tag.layout.name == "floating" then
	    shadow_state(c,true)
	else
	    shadow_state(c,false)
	end
    end
end

tag.connect_signal("property::layout",function(tag)
    tag_control(tag)
end)

client.connect_signal("tagged",function(c)
    shadow_state_controller(c)
end)

client.connect_signal("focus", function(c)
	c.border_color = beautiful.border_focus
	-- shadow_active(c,true)
end)
client.connect_signal("unfocus", function(c)
	c.border_color = beautiful.border_normal
	-- shadow_active(c,false)
end)
