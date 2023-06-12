local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
if proj.DeathKnightCheck() then return end

local deathknight = proj.deathknight