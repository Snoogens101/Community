local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
local pet = awful.pet
if proj.HunterCheck() then return end

local hunter = proj.hunter
local marksmanship = proj.hunter.marksmanship
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

  AutoShot = Spell(75, { targeted = true, ranged = true, damage = "physical" }),
  AimedShot = Spell(49050, { targeted = true, ranged = true, damage = "physical" }),
  ArcaneShot = Spell(49045, { targeted = true, ranged = true, damage = "magic" }),
  AspectOfTheDragonhawk = Spell(61847, { beneficial = true }),
  AspectOfTheHawk = Spell(27044, { beneficial = true }),
  AspectOfTheViper = Spell(34074, { beneficial = true }),
  AspectOfTheCheetah = Spell(5118, { beneficial = true }),
  CallPet = Spell(883, { beneficial = true }),
  ChimeraShot = Spell(53209, { targeted = true, ranged = true, damage = "physical" }),
  Deterrence = Spell(19263, { beneficial = true }),
  FeignDeath = Spell(5384, { beneficial = true }),
  Flare = Spell(1543, { beneficial = true, radius = 10 }),
  Misdirection = Spell(34477, { targeted = true, beneficial = true }),
  HuntersMark = Spell(53338, { targeted = true, ignoreFacing = true, effect = "magic" }),
  KillCommand = Spell(34026, { beneficial = true, ignoreFacing = true, damage = "physical" }),
  KillShot = Spell(61006, { targeted = true, ranged = true, damage = "physical" }),
  MendPet = Spell(48990, { targeted = true, beneficial = true }),
  MongooseBite = Spell(53339, { targeted = true, damage = "physical" }),
  MultiShot = Spell(49048, { targeted = true, ranged = true, damage = "physical" }),
  RapidFire = Spell(3045, { beneficial = true, ranged = true, damage = "physical" }),
  RaptorStrike = Spell(48996, { targeted = true, damage = "physical" }),
  Readiness = Spell(23989, { beneficial = true }),
  RevivePet = Spell(982, { targeted = true, beneficial = true }),
  SerpentSting = Spell(49001, { targeted = true, ranged = true, effect = "magic" }),
  SteadyShot = Spell(49052, { targeted = true, ranged = true, damage = "physical" }),
  TrueshotAura = Spell(19506, { beneficial = true }),
  ViperSting = Spell(3034, { targeted = true, effect = "magic" }),
  Volley = Spell(58434, { targeted = false, damage = "physical", radius = 8 }),
  FrostTrap = Spell(13809),
  FreezingTrap = Spell(14311),
  FreezingArrow = Spell(60192),
  SnakeTrap = Spell(34600),
  ExplosiveTrap = Spell(49067, { targeted = false, effect = "magic" }),
  ImmolationTrap = Spell(49056, { targeted = false, effect = "magic" }),
  ConcussiveShot = Spell(5116),
  Disengage = Spell(781),
  ScatterShot = Spell(19503),
  ScareBeast = Spell(14327),
  ScorpidSting = Spell(3043),
  WingClip = Spell(2974),
  TranquilizingShot = Spell(19801),
  MastersCall = Spell(53271),
  SilencingShot = Spell(34490),
}, marksmanship, getfenv(1))