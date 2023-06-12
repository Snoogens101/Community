local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
if proj.LoadCheck() then return end

local talents = proj.ID.talent

-- Healthstone
local healthstone = awful.Item({36894,36893,36892,36891,36890,36889,22105,22104,22103})
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

-- Health Potion
local healthPotion = awful.Item({
  43569, --endless-healing-potion
  41166, --runic-healing-injector
  33447, --runic-healing-potion
})
local healthPotionUsed = 0
function proj.HealthPotion()
  if awful.arena then return end
  if healthPotionUsed > 0 and awful.time - healthPotionUsed < 15 then return end
  if not awful.hasControl then return end
  if not player.combat then return end
  if healthPotion.count == 0 then return end
  if healthPotion.cd > 0 then return end
  if not healthPotion.usable then return end

  if player.hp < 25 then
    if healthPotion:Use() then
      healthPotionUsed = awful.time
    end
    if awful.DevMode then
      awful.print("Debug: Using Health Potion")
    end
  end
end

-- Mana Potion
local manaPotion = awful.Item({
  43570, --endless-mana-potion
  42545, --runic-mana-injector
  33448, --runic-mana-potion
})
local manaPotionUsed = 0
function proj.ManaPotion()
  if awful.arena then return end
  if manaPotionUsed > 0 and awful.time - manaPotionUsed < 15 then return end
  if not awful.hasControl then return end
  if not player.combat then return end
  if manaPotion.count == 0 then return end
  if manaPotion.cd > 0 then return end
  if not manaPotion.usable then return end

  if player.manaPct < 25 then
    if manaPotion:Use() then
      manaPotionUsed = awful.time
    end
    if awful.DevMode then
      awful.print("Debug: Using Mana Potion")
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