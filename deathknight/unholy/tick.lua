local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
if proj.DeathKnightCheck() then return end

local deathknight = proj.deathknight
local unholy = proj.deathknight.unholy
local talents = proj.ID.talent

deathknight.Level = 0
local function levelCheck()
  deathknight.Level = 0

  if target.enemy then -- Level 1
    deathknight.Level = 1
  else
    return
  end
end

function deathknight.tick()
  proj.WasCastingCheck()
  proj.GeneralChecks()
  proj.EndOfCastFace()

  levelCheck()
end


