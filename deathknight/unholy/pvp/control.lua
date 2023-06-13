local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
if proj.DeathKnightCheck() then return end

local deathknight = proj.deathknight
local unholy = proj.deathknight.unholy
local talents = proj.ID.talent

-- Chains of Ice
unholy.ChainsOfIce:Callback("pvp_target_slow", function(spell)
  if target.speed > 5 then
    if not target.meleeRange or target.movingAwayFrom(player, {angle = 90, duration = 0.5}) then
      spell:Cast(target)
    end
  end
end)

-- Death Grip