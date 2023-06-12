local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
if proj.classnameCheck() then return end

local classname = proj.classname
local specname = proj.classname.specname
local talents = proj.ID.talent

classname.Level = 0
local function levelCheck()
  classname.Level = 0

  if target.enemy then -- Level 1
    classname.Level = 1
  else
    return
  end
end

function classname.tick()
  proj.WasCastingCheck()
  proj.GeneralChecks()
  proj.EndOfCastFace()

  levelCheck()
end


