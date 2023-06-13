local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
local pet = awful.pet
if proj.DeathKnightCheck() then return end

local deathknight = proj.deathknight
local unholy = proj.deathknight.unholy
local talents = proj.ID.talent.deathknight
local glyphs = proj.ID.glyph.deathknight
local cfg = proj.settings

local PetAttack = awful.unlock("PetAttack")

local Blood, Unholy, Frost, Death = 1, 2, 3, 4

function unholy.PvPPetAttack()
  if pet.exists and not pet.dead then
    if not pet.target.exists or not pet.target.isUnit(target) then
      PetAttack()
    end
  end
end

-- Auto Attack
unholy.AutoAttack:Callback("pvp_target", function(spell)
  if not IsCurrentSpell(spell.id) then
    spell:Cast(target)
  end
end)

-- Plague Strike
unholy.PlagueStrike:Callback("pvp_target", function(spell)
  if deathknight.BloodPlague == 0 or target.debuffRemains("Blood Plague", player) < awful.gcd*2 then
    spell:Cast(target)
  end
end)

-- Icy Touch
unholy.IcyTouch:Callback("pvp_target", function(spell)
  if deathknight.FrostFever == 0 or target.debuffRemains("Frost Fever", player) < awful.gcd*2 then
    spell:Cast(target)
  end
end)

-- Scourge Strike (2x Diseases)
unholy.ScourgeStrike:Callback("pvp_target", function(spell)
  if deathknight.BloodPlague == 0 or deathknight.FrostFever == 0 then return end
  if target.debuff("Blood Plague", player) and target.debuff("Frost Fever", player) then
    spell:Cast(target)
  end
end)

-- Death Strike (2x Diseases, Defensive)
unholy.DeathStrike:Callback("pvp_target", function(spell)
  if deathknight.BloodPlague == 0 or deathknight.FrostFever == 0 then return end
  if player.hp > cfg.deathStrike then return end
  if target.debuff("Blood Plague", player) and target.debuff("Frost Fever", player) then
    spell:Cast(target)
  end
end)

-- Raise Dead
local corpseDust = awful.Item(37201)
unholy.RaiseDead:Callback("pvp_pet", function(spell)
  if pet.exists then return end
  if player.hasGlyph(glyphs.RaiseDead) or corpseDust.count > 0 then
    spell:Cast()
  end
end)

-- Summon Gargoyle (snapshots "Unholy Strength", Blood Fury, Badge etc)
unholy.SummonGargoyle:Callback("pvp_buff", function(spell)
  if awful.burst or awful.burst_pressed and awful.time - awful.burst_pressed < 10 then
    if not player.buff("Unholy Strength") then return end
    unholy.BloodFury:Cast()
    unholy.Berserking:Cast()
    proj.Badge()
    spell:Cast(target)
    return proj.ClassAlert(spell.name, spell.id, false)
  end
end)

-- Ghoul Frenzy (Offensive)
unholy.GhoulFrenzy:Callback("pvp_buff", function(spell)
  if not pet.exists then return end
  if awful.burst or awful.burst_pressed and awful.time - awful.burst_pressed < 10 then
    if target.cc or target.slow then
      spell:Cast(pet)
      return proj.ClassAlert(spell.name, spell.id, false)
    end
  end
end)

-- Blood Strike (filler)
unholy.BloodStrike:Callback("pvp_target", function(spell)
  if target.debuff("Blood Plague", player) and target.debuff("Frost Fever", player) then
    spell:Cast(target)
  end
end)

-- Death Coil (Offensive)
unholy.DeathCoil:Callback("pvp_target", function(spell)
  if unholy.SummonGargoyle.cd - awful.gcdRemains <= 0 and (awful.burst or awful.burst_pressed and awful.time - awful.burst_pressed < 10) then return end
  if player.powerMax - player.power <= 10 or target.hp < 20 or target.debuff("Blood Plague", player) and target.debuff("Frost Fever", player) and target.debuffRemains("Unholy Blight") < awful.gcd*2 then
    spell:Cast(target)
  end
end)

-- Blood Tap (Burst)
unholy.BloodTap:Callback("pvp_buff", function(spell)
  if awful.burst and unholy.SummonGargoyle.cd > 30 or awful.time - proj.PlayerGargoyle < 20 then
    spell:Cast()
  end
end)

-- Rune Strike
unholy.RuneStrike:Callback("pvp_target", function(spell)
  if not IsCurrentSpell(spell.id) then
    spell:Cast(target)
  end
end)

-- Anti-Magic Shell (Defensive)

-- Death Pact (Defensive)

-- Lichborne (Defensive)

-- Death Coil (Defensive (with Lichborne))

-- Ghoul Frenzy (Defensive)

-- Death and Decay (stealth getter)