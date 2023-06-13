local Unlocker, awful, proj = ...
if proj.LoadCheck() then return end

local title = {
  ["HUNTER"] = { awful.textureEscape(135495, 16)..' Community' },
  ["DEATHKNIGHT"] = { awful.textureEscape(49023, 16)..' Community' },
}

local titleColor = {
  ["HUNTER"] = { 170, 211, 114 },
  ["DEATHKNIGHT"] = { 196, 30, 59 },
}

local primaryColor = {
  ["HUNTER"] = { 170/2, 211/2, 114 },
  ["DEATHKNIGHT"] = { 196/2, 30/2, 59/2 }
}

local accentColor = {
  ["HUNTER"] = { 170, 211, 114 },
  ["DEATHKNIGHT"] = { 196, 30, 59 }
}

local ui, settings, cmd = awful.UI:New('Community', {
	title = title[awful.player.class2][1],
	colors = {
		title = titleColor[awful.player.class2],
		primary = primaryColor[awful.player.class2],
		accent = accentColor[awful.player.class2],
		background = {12, 12, 12, 0.6},
		tertiary = {161, 161, 161, 0.15}
	},
	sidebar = false,
	width = 340,
	height = 225,
  scale = 0.9,
  show = true,
})

proj.settings = settings
proj.gui = ui
proj.cmd = cmd

local General = ui:Tab("General")
local Spells = ui:Tab("Spells")
local Items = ui:Tab("Items")