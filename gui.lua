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
		primary ={175, 175, 175, 0.8},
		accent = accentColor[awful.player.class2],
		background = {12, 12, 12, 0.6},
		tertiary = {161, 161, 161, 0.5}
	},
	sidebar = false,
	width = 355,
	height = 255,
  scale = 0.9,
  show = true,
})

proj.settings = settings
proj.gui = ui
proj.cmd = cmd

local General = ui:Tab("General")
General:Dropdown({
  var = "autoTarget",
  options = {
      { label =  "None", value = "None"},
      { label =  "Open World", value = "Open World"},
      { label =  "Instance", value = "Instance"},
      { label =  "PvP", value = "PvP"},
  },
  default = "None",
  header = "Auto Target Mode:",
})

General:Dropdown({
  var = "dummyRotation",
  options = {
      { label =  "PvE", value = "PvE"},
      { label =  "PvP", value = "PvP"},
  },
  default = "PvE",
  header = "Rotation on Target Dummy:",
})

local Items = ui:Tab("Items")
Items:Slider({
  text = "Healthstone",
  var = "healthstone",
  min = 0,
  max = 100,
  default = 50,
  size = 8,
  valueType = " HP%",
})
Items:Slider({
  text = "Health Potion",
  var = "healthPotion",
  min = 0,
  max = 100,
  default = 25,
  size = 8,
  valueType = " HP%",
})
Items:Slider({
  text = "Mana Potion",
  var = "manaPotion",
  min = 0,
  max = 100,
  default = 25,
  size = 8,
  valueType = " MP%",
})