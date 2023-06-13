local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
if proj.HunterCheck() then return end

local hunter = proj.hunter
local marksmanship = proj.hunter.marksmanship
local talents = proj.ID.talent

local SpellStopCasting = awful.unlock("SpellStopCasting")
local CastInterruptDelay = awful.delay(0.374, 0.564)
local CastFinishDelay = awful.delay(0.21, 0.44)
local ChannelInterruptDelay = awful.delay(0.61, 0.84)