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

local Blood, Unholy, Frost, Death = 1, 2, 3, 4
deathknight.BloodPlague = 15
local function BloodPlague()
  if deathknight.Level >= 1 then
    local UnholyRunes = deathknight.GetRuneTypeReady(Unholy)
    if UnholyRunes == 1 then
      local TimeToFullUnholyRunes = deathknight.TimeToRuneType(2, Unholy)
      local minTimeToCast = math.max(0, target.debuffRemains("Blood Plague", player) - TimeToFullUnholyRunes)
      deathknight.BloodPlague = minTimeToCast
      return true
    end
  end

  deathknight.BloodPlague = 15
  return true
end

deathknight.FrostFever = 15
local function FrostFever()
  if deathknight.Level >= 1 then
    local FrostRunes = deathknight.GetRuneTypeReady(Frost)
    if FrostRunes == 1 then
      local TimeToFullFrostRunes = deathknight.TimeToRuneType(2, Frost)
      local minTimeToCast = math.max(0, target.debuffRemains("Frost Fever", player) - TimeToFullFrostRunes)
      deathknight.FrostFever = minTimeToCast
      return true
    end
  end

  deathknight.FrostFever = 15
  return true
end

function deathknight.tick()
  proj.WasCastingCheck()
  proj.GeneralChecks()
  proj.EndOfCastFace()

  levelCheck()
  BloodPlague()
  FrostFever()
end


