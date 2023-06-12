local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
if proj.LoadCheck() then return end

proj.ID = {
  buff = {
    Preparation       = 44521,
    ArenaPreparation  = 32727,
    SpellReflection   = 23920,
    GroundingTotem    = 8178,
    IceBlock          = 45438,
    DivineShield      = 642,
    Deterrence        = 19263,
  },
  debuff = {
    Cyclone           = 33786,
  },
  buffGroup = {
    fullImmunity = {
      [45438]   = "Ice Block",
      [642]     = "Divine Shield",
      [19263]   = "Deterrence",
    },
  },
  debuffGroup = {
    ignoreFears = {
      [5782]    = "Fear(Rank 1)",
      [6213]    = "Fear(Rank 2)",
      [6215]    = "Fear(Rank 3)",
      [5484]    = "Howl of Terror(Rank 1)",
      [17928]   = "Howl of Terror(Rank 2)",
      [8122]    = "Psychic Scream(Rank 1)",
      [8124]    = "Psychic Scream(Rank 2)",
      [10888]   = "Psychic Scream(Rank 3)",
      [10890]   = "Psychic Scream(Rank 4)",
      [20511]   = "Intimidating Shout",
    },
    fullImmunity = {
      [33786]   = "Cyclone",
    },
  },
  pet = {

  },
  talent = {

  }
}

proj.TotemStompList = {

}

proj.InterruptCCList = {

}

proj.InterruptSpecialList = {

}

proj.InterruptChanneledHealsList = {

}