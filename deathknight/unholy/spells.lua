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

  -- ## DEATH KNIGHT ## --
  AutoAttack = Spell(6603, { targeted = true, damage = "physical" }),
  BloodPresence = Spell(48266, { beneficial = true }),
  FrostPresence = Spell(48263, { beneficial = true }),
  UnholyPresence = Spell(48265, { beneficial = true }),
  BloodBoil = Spell(49941),
  BloodStrike = Spell(49930, { targeted = true, damage = "physical" }),
  BloodTap = Spell(45529, { beneficial = true }),
  DarkCommand = Spell(56222, { targeted = true }),
  DeathPact = Spell(48743, { beneficial = true }),
  Pestilence = Spell(50842, { targeted = true }),
  Strangulate = Spell(47476, { targeted = true, interrupt = true }),
  ChainsOfIce = Spell(45524, { targeted = true, slow = true, effect = "magic" }),
  EmpowerRuneWeapon = Spell(47568, { beneficial = true }),
  HornOfWinter = Spell(57623, { beneficial = true }),
  IceboundFortitude = Spell(48792, { beneficial = true }),
  IcyTouch = Spell(49909, { targeted = true, damage = "magic" }),
  Lichborne = Spell(49039, { beneficial = true }),
  MindFreeze = Spell(47528, { targeted = true, interrupt = true }),
  Obliterate = Spell(51425, { targeted = true, damage = "physical" }),
  PathOfFrost = Spell(3714, { beneficial = true }),
  RuneStrike = Spell(56815, { targeted = true, damage = "physical" }),
  AntiMagicShell = Spell(48707, { beneficial = true }),
  AntiMagicZone = Spell(51052, { beneficial = true }),
  ArmyOfTheDead = Spell(42650, { beneficial = true }),
  BoneShield = Spell(49222, { beneficial = true }),
  DeathCoil = Spell(49895, { targeted = true, damage = "magic" }),
  DeathGrip = Spell(49576, { targeted = true }),
  DeathStrike = Spell(49924, { targeted = true, damage = "physical" }),
  DeathAndDecay = Spell(49938, { targeted = false, effect = "magic", radius = 10 }),
  GhoulFrenzy = Spell(63560, { beneficial = true }),
  PlagueStrike = Spell(49921, { targeted = true, damage = "magic" }),
  RaiseAlly = Spell(61999, { targeted = true, beneficial = true }),
  RaiseDead = Spell(46584, { beneficial = true }),
  ScourgeStrike = Spell(55271, { targeted = true, damage = "physical" }),
  SummonGargoyle = Spell(49206, { beneficial = true }),
}, unholy, getfenv(1))