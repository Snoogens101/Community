local Unlocker, awful, proj = ...
if proj.DeathKnightCheck() then return end

local Spells = proj.gui:Tab("Spells")

Spells:Slider({
  text = "Death Strike",
  var = "deathStrike",
  min = 0,
  max = 100,
  default = 50,
  size = 8,
  valueType = " HP%",
})