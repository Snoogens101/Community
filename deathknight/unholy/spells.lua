local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
local pet = awful.pet
if proj.DeathKnightCheck() then return end

local deathknight = proj.deathknight
local unholy = proj.deathknight.unholy
local talents = proj.ID.talent

local Spell = awful.Spell
awful.Populate({
  -- ## RACIALS ## --
  BloodFury = Spell({ 20572, 33697, 33702 }, { beneficial = true }),
  Berserking = Spell(26297, { beneficial = true }),
  WillOfTheForsaken = Spell(7744, { beneficial = true }),
  ArcaneTorrent = Spell({ 28730, 50613, 25046 }, { beneficial = true }),
  WarStomp = Spell(20549, { beneficial = true }),
  EveryManForHimself = Spell(59752, { beneficial = true }),
  GiftOfTheNaaru = Spell(28880, { heal = true }),
  Stoneform = Spell(20594, { beneficial = true }),
  EscapeArtist = Spell(20589, { beneficial = true }),
  Shadowmeld = Spell(58984, { beneficial = true }),
}, unholy, getfenv(1))