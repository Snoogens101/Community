local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
local pet = awful.pet
if proj.classnameCheck() then return end

local classname = proj.classname
local specname = proj.classname.specname
local talents = proj.ID.talent

local PetAttack = awful.unlock("PetAttack")

function specname.PvPPetAttack()
  if pet.exists and not pet.dead then
    if not awful.pet.target.exists or not awful.pet.target.isUnit(target) then
      PetAttack()
    end
  end
end