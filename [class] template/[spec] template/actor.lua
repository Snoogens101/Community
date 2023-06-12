local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
if proj.classnameCheck() then return end

local classname = proj.classname
local specname = proj.classname.specname
local buffs = proj.ID.buff
local debuffs = proj.ID.debuff
local talents = proj.ID.talent

specname:Init(function()
  -- Update Stuff
  classname.tick()

  classname.PVP_APL()
  classname.PVE_APL()
end)

