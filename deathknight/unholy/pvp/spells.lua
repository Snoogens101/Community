local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
local pet = awful.pet
if proj.DeathKnightCheck() then return end

local deathknight = proj.deathknight
local unholy = proj.deathknight.unholy
local talents = proj.ID.talent

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
    spell:CastAlert(target)
  end
end)

-- Plague Strike
unholy.PlagueStrike:Callback("pvp_target", function(spell)
  if deathknight.BloodPlague == 0 or target.debuffRemains("Blood Plague", player) < awful.gcd*2 then
    spell:CastAlert(target)
  end
end)

-- check runes etc to see when to refresh
-- Icy Touch
unholy.IcyTouch:Callback("pvp_target", function(spell)
  if deathknight.FrostFever == 0 or target.debuffRemains("Frost Fever", player) < awful.gcd*2 then
    spell:CastAlert(target)
  end
end)

-- Scourge Strike (2x Diseases)
unholy.ScourgeStrike:Callback("pvp_target", function(spell)
  if deathknight.BloodPlague == 0 or deathknight.FrostFever == 0 then return end
  if target.debuff("Blood Plague", player) and target.debuff("Frost Fever", player) then
    spell:CastAlert(target)
  end
end)

-- Raise Dead

-- Summon Gargoyle (snapshots "Unholy Strength", Blood Fury, Badge etc)

-- Ghoul Frenzy (Defensive)

-- Ghoul Frenzy (Offensive)

-- Blood Strike (filler)
unholy.BloodStrike:Callback("pvp_target", function(spell)
  if target.debuff("Blood Plague", player) and target.debuff("Frost Fever", player) then
    spell:CastAlert(target)
  end
end)

-- Death and Decay (stealth getter)

-- Death Pact (Defensive)

-- Lichborn (Defensive)

-- Death Coil (Defensive (with Lichborne))

-- Death Coil (Offensive)
unholy.DeathCoil:Callback("pvp_target", function(spell)
  if player.powerMax - player.power <= 10 or target.debuff("Blood Plague", player) and target.debuff("Frost Fever", player) and target.debuffRemains("Unholy Blight") < awful.gcd*2 then
    spell:CastAlert(target)
  end
end)

-- Death Strike (Defensive)

-- Anti-Magic Shell (Defensive)