local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
local pet = awful.pet
if proj.HunterCheck() then return end

local hunter = proj.hunter
local marksmanship = proj.hunter.marksmanship
local talents = proj.ID.talent