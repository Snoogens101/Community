local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
local pet = awful.pet
if proj.HunterCheck() then return end

local hunter = proj.hunter
local marksmanship = proj.hunter.marksmanship
local talents = proj.ID.talent

local PetAttack = awful.unlock("PetAttack")

function marksmanship.PvPPetAttack()
  if pet.exists and not pet.dead then
    if not pet.target.exists or not pet.target.isUnit(target) then
      PetAttack()
    end
  end
end

marksmanship.AutoShot:Callback("pvp_target", function(spell)
  if not IsCurrentSpell(AutoShot.id) then
    spell:Cast(target)
  end
end)

-- Aspect of the Dragonhawk
marksmanship.AspectOfTheDragonhawk:Callback("pvp_player_buff", function(spell)
  if not player.buff(spell.id) then
    spell:CastAlert()
  end
end)

-- Trueshot Aura
local SuperiorBuffs = 
{
  "Abomination's Might",
  "Blessing of Might",
  "Horn of Winter",
  "Strength of Earth Totem",
  "Roar of Courage",
  "Trueshot Aura",
}
marksmanship.TrueshotAura:Callback("pvp_player_buff", function(spell)
  if not player.buffFrom(SuperiorBuffs) then
    spell:CastAlert()
  end
end)

-- Hunter's Mark
marksmanship.HuntersMark:Callback("pvp_target", function(spell)
  if target.debuffRemains(spell.id, player) < 2 then
    spell:CastAlert(target)
  end
end)

-- Kill Shot
marksmanship.KillShot:Callback("pvp_target", function(spell)
  if not hunter.Ranged then return end
  spell:CastAlert(target)
end)

-- Serpent Sting
marksmanship.SerpentSting:Callback("pvp_target", function(spell)
  if not hunter.Ranged then return end
  if target.debuffRemains(spell.id, player) < 2 then
    spell:CastAlert(target)
  end
end)

-- Chimera Shot
marksmanship.ChimeraShot:Callback("pvp_target_serpent", function(spell)
  if not hunter.Ranged then return end
  if target.debuffRemains(SerpentSting.id, player) >= 2 then
    spell:CastAlert(target)
  end
end)

-- Aimed Shot
marksmanship.AimedShot:Callback("pvp_target", function(spell)
  if not hunter.Ranged then return end
  spell:CastAlert(target)
end)

-- Arcane Shot
marksmanship.ArcaneShot:Callback("pvp_target", function(spell)
  if not hunter.Ranged then return end
  spell:CastAlert(target)
end)

-- Silencing Shot

-- Steady Shot
marksmanship.SteadyShot:Callback("pvp_target", function(spell)
  if not hunter.Ranged then return end
  if AimedShot.cd - awful.gcdRemains <= 1 and AimedShot.cost.mana <= player.mana then
    return
  end
  if ArcaneShot.cd - awful.gcdRemains <= 1 and ArcaneShot.cost.mana <= player.mana then
    return
  end
  spell:CastAlert(target)
end)

-- Kill Command
marksmanship.KillCommand:Callback("pvp_target", function(spell)
  if not pet.exists then return end
  if pet.dead then return end
  if not pet.target.exists then return end
  if not pet.meleeRangeOf(target) then return end
  if pet.buff(spell.id) then return end

  if target.debuffRemains(SerpentSting.id, player) > 2 and target.debuffRemains(HuntersMark.id, player) > 2 then
    spell:CastAlert(pet)
  end
end)

-- Rapid Fire
marksmanship.RapidFire:Callback("pvp_target_burst", function(spell)
  if not hunter.Ranged then return end
  if not awful.burst then return end
  if player.buff(spell.id) then return end
  if target.debuffRemains(SerpentSting.id, player) > 2 and target.debuffRemains(HuntersMark.id, player) > 2 then
    spell:CastAlert(player)
  end
end)

-- Readiness
marksmanship.Readiness:Callback("pvp_target_burst", function(spell)
  if RapidFire.cd > 60 and KillCommand.cd > 15 and AimedShot.cd - awful.gcdRemains > 0 and ChimeraShot.cd - awful.gcdRemains > 0 and ArcaneShot.cd - awful.gcdRemains > 0 then
    if target.debuffRemains(SerpentSting.id, player) > 2 and target.debuffRemains(HuntersMark.id, player) > 2 then
      spell:CastAlert(player)
    end
  end
end)

-- Berserking
marksmanship.Berserking:Callback("pvp_target_burst", function(spell)
  if not hunter.Ranged then return end
  if player.buffRemains(RapidFire.id) >= 8 then
    if target.debuffRemains(SerpentSting.id, player) > 2 and target.debuffRemains(HuntersMark.id, player) > 2 then
      spell:CastAlert(player)
    end
  end
end)

-- Mongoose Bite
marksmanship.MongooseBite:Callback("pvp_target_melee", function(spell)
  if hunter.Ranged then return end
  spell:CastAlert(target)
end)

-- Raptor Strike
marksmanship.RaptorStrike:Callback("pvp_target_melee", function(spell)
  if hunter.Ranged then return end
  spell:CastAlert(target)
end)