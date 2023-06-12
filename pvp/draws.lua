local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
local party1, party2 = awful.party1, awful.party2
local healer, enemyHealer = awful.healer, awful.enemyHealer
if proj.LoadCheck() then return end

local AwfulFontBig = awful.createFont(12, "OUTLINE")
local AwfulFont = awful.createFont(10, "OUTLINE")
local Draw = awful.Draw
Draw(function(draw)
  local px, py, pz = player.position()
  local rotation = player.rotation
  local mapID = awful.mapID
  local time = awful.time
  if not px or not rotation or not mapID then return end

end)