local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target

local supportedClasses = {
  ["HUNTER"] = true,
  ["DEATHKNIGHT"] = true,
}
function proj.LoadCheck()
  if not supportedClasses[player.class2] then return true end
  if WOW_PROJECT_ID ~= WOW_PROJECT_WRATH_CLASSIC then return true end
  return false
end
if proj.LoadCheck() then return end

awful.DevMode = true

proj.Tinkr = Unlocker.type == "tinkr" or not Unlocker.type
proj.Daemonic = Unlocker.type == "daemonic"
proj.NoName = Unlocker.type == "noname"

proj.hunter = {
  marksmanship = awful.Actor:New({ spec = 2, class = "hunter" }),
}
function proj.HunterCheck()
  if player.class2 ~= "HUNTER" then return true end
  if WOW_PROJECT_ID ~= WOW_PROJECT_WRATH_CLASSIC then return true end
  return false
end

proj.deathknight = {
  unholy = awful.Actor:New({ spec = 3, class = "deathknight" }),
}
function proj.DeathKnightCheck()
  if player.class2 ~= "DEATHKNIGHT" then return true end
  if WOW_PROJECT_ID ~= WOW_PROJECT_WRATH_CLASSIC then return true end
  return false
end

proj.items = {}

awful.hookSpellCasts(function(spell, key)
  if awful.DevMode then
    awful.alert({
      msg = spell.name .. " | " .. (key or "no key"),
      texture = spell.id,
      duration = 0.2
    })
  end
end)

proj.ShortAlert = function(msg, id, big)
  return awful.alert({
    msg = msg,
    texture = id,
    big = big,
    duration = 0.075
  })
end

proj.YellowAlert = function(msg, id, big)
  return awful.alert({
    msg = msg,
    texture = id,
    big = big,
    bgColor = {225/255, 195/255, 30/255, 0.9}
  })
end

proj.RedAlert = function(msg, id, big)
  return awful.alert({
    msg = msg,
    texture = id,
    big = big,
    bgColor = {245/255, 60/255, 60/255, 0.9}
  })
end

proj.BlueAlert = function(msg, id, big)
  return awful.alert({
    msg = msg,
    texture = id,
    big = big,
    bgColor = {144/255, 144/255, 255/255, 0.95}
  })
end

proj.PurpleAlert = function(msg, id, big)
  return awful.alert({
    msg = msg,
    texture = id,
    big = big,
    bgColor = {135/255, 136/255, 238/255, 0.95}
  })
end

local rPerc, gPerc, bPerc, argbHex = GetClassColor(player.class2)
proj.ClassRGB = { rPerc, gPerc, bPerc }
proj.ClassHex = argbHex
proj.ClassAlert = function(msg, id, big)
  return awful.alert({
    msg = msg,
    texture = id,
    big = big,
    bgColor = {rPerc, gPerc, bPerc, 0.95}
  })
end

local ignoreFacing = {

}
function proj.EndOfCastFace()
  if not player.casting then return end
  if not ignoreFacing[player.castingid] then
      if player.casttarget.enemy then
          if not player.facing(player.casttarget, 45) then
              if player.casttimerem > 0 and player.casttimerem - awful.latency < awful.buffer * 2 then
                  player.casttarget.face()
              end
          end
      end
  end
end

proj.WasCasting = {}
function proj.WasCastingCheck()
  local time = awful.time
  if player.casting then
    proj.WasCasting[player.castingid] = { stamp = time }
    if player.castTarget.exists then
      proj.WasCasting[player.castingid][player.castTarget.guid] = time
    end
  end
  for spell, when in pairs(proj.WasCasting) do
    if time - when.stamp > 0.5+awful.buffer then
      proj.WasCasting[spell] = nil
    end
  end
end

proj.lowestEnemy = 100
proj.lowestFriend = 100
function proj.GeneralChecks()
  proj.lowestEnemy = awful.enemies.lowest.hp or 100
  proj.lowestFriend = awful.fullGroup.lowest.hp or 100

  proj.PVP = awful.instanceType2 == "pvp" or awful.instanceType2 == "arena" or target.enemy and target.player
  proj.PVE = awful.instanceType2 == "party" or awful.instanceType2 == "raid" or awful.instanceType2 == "scenario" or awful.instanceType2 == "none"
end