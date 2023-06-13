local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
local pet = awful.pet
if proj.HunterCheck() then return end

local hunter = proj.hunter
local marksmanship = proj.hunter.marksmanship
local talents = proj.ID.talent
local cfg = proj.settings

function proj.PVP_APL()
  if not proj.PVP and not (cfg.dummyRotation == "PvP" and target.dummy) then return end

  if not awful.hasControl then return end
  if player.mounted then return end

  marksmanship.AspectOfTheDragonhawk("pvp_player_buff")
  marksmanship.TrueshotAura("pvp_player_buff")

  if hunter.Level < 1 then return end

  marksmanship.PvPPetAttack()
  marksmanship.KillShot("pvp_target")
  marksmanship.KillCommand("pvp_target")

  marksmanship.Readiness("pvp_target_burst")
  marksmanship.RapidFire("pvp_target_burst")
  marksmanship.Berserking("pvp_target_burst")

  marksmanship.HuntersMark("pvp_target")
  marksmanship.SerpentSting("pvp_target")
  marksmanship.ChimeraShot("pvp_target_serpent")
  marksmanship.AimedShot("pvp_target")
  marksmanship.ArcaneShot("pvp_target")
  marksmanship.SteadyShot("pvp_target")

  marksmanship.MongooseBite("pvp_target_melee")
  marksmanship.RaptorStrike("pvp_target_melee")
end