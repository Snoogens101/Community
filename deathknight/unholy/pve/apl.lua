local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
local pet = awful.pet
if proj.DeathKnightCheck() then return end

local deathknight = proj.deathknight
local unholy = proj.deathknight.unholy
local talents = proj.ID.talent
local cfg = proj.settings

function deathknight.PVE_APL()
  if not proj.PVE and not (cfg.dummyRotation == "PvE" and target.dummy)  then return end

  if not awful.hasControl then return end
  if player.mounted then return end

  if deathknight.Level < 1 then return end

end