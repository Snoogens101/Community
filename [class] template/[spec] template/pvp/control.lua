local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
if proj.classnameCheck() then return end

local classname = proj.classname
local specname = proj.classname.specname
local talents = proj.ID.talent