local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
local pet = awful.pet
if proj.DeathKnightCheck() then return end

local deathknight = proj.deathknight
local unholy = proj.deathknight.unholy
local talents = proj.ID.talent

local PetAttack = awful.unlock("PetAttack")

function unholy.PvPPetAttack()
  if pet.exists and not pet.dead then
    if not awful.pet.target.exists or not awful.pet.target.isUnit(target) then
      PetAttack()
    end
  end
end