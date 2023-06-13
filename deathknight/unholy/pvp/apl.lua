local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
local pet = awful.pet
if proj.DeathKnightCheck() then return end

local deathknight = proj.deathknight
local unholy = proj.deathknight.unholy
local talents = proj.ID.talent
local cfg = proj.settings

function deathknight.PVP_APL()
  if not proj.PVP and not (cfg.dummyRotation == "PvP" and target.dummy)  then return end

  if not awful.hasControl then return end
  if player.mounted then return end

  unholy.RaiseDead("pvp_pet")
  if deathknight.Level < 1 then return end

  unholy.AutoAttack("pvp_target")
  unholy.PvPPetAttack()
  unholy.RuneStrike("pvp_target")
  unholy.SummonGargoyle("pvp_buff")
  unholy.DeathCoil("pvp_target")
  unholy.BloodTap("pvp_buff")
  unholy.PlagueStrike("pvp_target")
  unholy.IcyTouch("pvp_target")
  unholy.DeathStrike("pvp_target")
  unholy.ChainsOfIce("pvp_target_slow")
  unholy.ScourgeStrike("pvp_target")
  unholy.GhoulFrenzy("pvp_buff")
  unholy.BloodStrike("pvp_target")
end
