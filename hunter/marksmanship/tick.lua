local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
if proj.HunterCheck() then return end

local hunter = proj.hunter
local marksmanship = proj.hunter.marksmanship
local talents = proj.ID.talent

hunter.Level = 0
local function levelCheck()
  hunter.Level = 0

  if target.enemy then -- Level 1
    hunter.Level = 1
  else
    return
  end
end

hunter.Ranged = false
local function rangeCheck()
  hunter.Ranged = false
  if target.enemy then
    if not target.meleeRange then
      hunter.Ranged = true
    end
  end
end

function hunter.tick()
  proj.WasCastingCheck()
  proj.GeneralChecks()
  proj.EndOfCastFace()

  levelCheck()
  rangeCheck()
end


