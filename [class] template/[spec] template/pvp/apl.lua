local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
local pet = awful.pet
if proj.classnameCheck() then return end

local classname = proj.classname
local specname = proj.classname.specname
local talents = proj.ID.talent

function proj.PVP_APL()
  if not proj.PVP then return end

  if not awful.hasControl then return end
  if player.mounted then return end

  if classname.Level < 1 then return end

end