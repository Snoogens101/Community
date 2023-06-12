local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
if proj.HunterCheck() then return end

local hunter = proj.hunter
local marksmanship = proj.hunter.marksmanship
local buffs = proj.ID.buff
local debuffs = proj.ID.debuff
local talents = proj.ID.talent

marksmanship:Init(function()
  -- Update Stuff
  hunter.tick()

  hunter.PVP_APL()
  hunter.PVE_APL()
end)

