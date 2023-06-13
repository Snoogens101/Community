local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
local pet = awful.pet
if proj.DeathKnightCheck() then return end

local deathknight = proj.deathknight
local unholy = proj.deathknight.unholy
local talents = proj.ID.talent

function deathknight.PVE_APL()
  if not proj.PVE then return end

  if not awful.hasControl then return end
  if player.mounted then return end

  unholy.AutoAttack("pvp_target")

  unholy.DeathCoil("pvp_target")
  unholy.PlagueStrike("pvp_target")
  unholy.IcyTouch("pvp_target")
  unholy.ScourgeStrike("pvp_target")
  unholy.BloodStrike("pvp_target")
end