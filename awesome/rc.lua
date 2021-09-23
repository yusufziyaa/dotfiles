local awful = require("awful")
require("awful.autofocus")

local beautiful = require("beautiful")

require("awful.hotkeys_popup.keys")

require("modules.errorHandler")
-- require("modules.savefloats")
require("modules.better-resize")
local lgi = require("lgi")

local cairo = lgi.cairo

os.setlocale(os.getenv("tr_TR.UTF-8"))

beautiful.init("~/.config/awesome/theme/theme.lua")

terminal = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

modkey = "Mod4"

require("modules.rules")
require("modules.client")
require("modules.titlebarHandler")
require("modules.utils")


awful.spawn.with_shell("flameshot")
awful.spawn.with_shell("picom")
awful.spawn.with_shell("nm-applet")
