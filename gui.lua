local Unlocker, awful, proj = ...
if proj.LoadCheck() then return end

local title = {
  ["HUNTER"] = { awful.textureEscape(401268, 16)..' Hunter' }
}

local ui, settings, cmd = awful.UI:New('Community', {
	title = title[awful.player.class2],
	colors = {
		title = {170,211,114},
		primary = {160, 160, 255},
		accent = {180, 180, 255},
		background = {12, 12, 12, 0.6},
		tertiary = {161, 161, 161, 0.15}
	},
	sidebar = false,
	width = 340,
	height = 225,
  scale = 0.9
})

proj.settings = settings
proj.gui = ui
proj.cmd = cmd

local General = ui:Tab("General")

cmd:New(function(msg)
  msg = msg:lower()
  
end)