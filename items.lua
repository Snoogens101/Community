local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
if proj.LoadCheck() then return end

local talents = proj.ID.talent

-- Healthstone
local healthstone = awful.Item(5512)
local checkedHealthstone = 0
function proj.GrabHealthstone()
  if awful.time - checkedHealthstone < 1 then return end
  if healthstone.count > 0 then return end
  if player.casting or player.channeling then return end
  if not player.buff("Preparation") then return end

  local soulwell = awful.objects.within(5).find(function(obj) return obj.id and obj.id == 303148 and obj.creator.friend end)
  if soulwell then
    soulwell:interact()
    proj.ShortAlert("Grabbing Healthstone", 344026)
    checkedHealthstone = awful.time
    if awful.DevMode then
      awful.print("Debug: Grabbing Healthstone")
    end
    return
  end
  checkedHealthstone = awful.time
end

local healthstoneUsed = 0
function proj.Healthstone()
  if healthstoneUsed > 0 and awful.time - healthstoneUsed < 15 then return end
  if not awful.hasControl then return end
  if not player.combat then return end
  if healthstone.count == 0 then return end
  if healthstone.cd > 0 then return end
  if not healthstone.usable then return end

  if player.hp < 50 then
    if healthstone:Use() then
      healthstoneUsed = awful.time
    end
    if awful.DevMode then
      awful.print("Debug: Using Healthstone")
    end
  end
end

-- Badge
local badges = awful.Item({ 

})
function proj.Badge()
  if not badges.equipped then return end
  if badges.usable and badges.cd <= 0 then
    badges:Use()
    if awful.DevMode then
      awful.print("Debug: Using Badge")
    end
  end
end

-- Medallion
local medallion = awful.Item({

}, { usableInCC = true })

function proj.Trinket()
  if awful.hasControl and not player.cc and not player.rooted then
    return awful.alert("Held Trinket, No CC", 336126)
  end

  if medallion.equipped and medallion.cd <= 0 then
    if medallion:Use() then
      return awful.alert("Pressing Trinket!", 336126)
    end
  end
end