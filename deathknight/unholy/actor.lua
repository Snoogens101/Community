local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
if proj.DeathKnightCheck() then return end

local deathknight = proj.deathknight
local unholy = proj.deathknight.unholy
local buffs = proj.ID.buff
local debuffs = proj.ID.debuff
local talents = proj.ID.talent

unholy:Init(function()
  -- Update Stuff
  deathknight.tick()

  deathknight.PVP_APL()
  deathknight.PVE_APL()
end)

