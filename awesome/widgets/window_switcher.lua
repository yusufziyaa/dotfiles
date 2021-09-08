local wibox = require("wibox")

local window_text = wibox.widget{
    font = "JetBrainsMono",
    widget = wibox.widget.textbox;
}

local window_widget = wibox.widget.background()
window_widget:set_widget(window_text)

window_widget:set_bg("#000000")
window_widget:set_fg("#ffffff")
window_text:set_text("text over here lmao")

return window_widget