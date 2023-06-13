local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
if proj.DeathKnightCheck() then return end

local deathknight = proj.deathknight
local unholy = proj.deathknight.unholy
local talents = proj.ID.talent

local SpellStopCasting = awful.unlock("SpellStopCasting")
local CastInterruptDelay = awful.delay(0.374, 0.564)
local CastFinishDelay = awful.delay(0.21, 0.44)
local ChannelInterruptDelay = awful.delay(0.61, 0.84)

-- Strangulate

-- Mind Freeze
unholy.MindFreeze:Callback("pvp_interrupt", function(spell)

  local castDelay = CastInterruptDelay.now
  local finishDelay = CastFinishDelay.now
  local channelDelay = ChannelInterruptDelay.now

  awful.enemies.loop(function(unit, i, uptime)
    if unit.dead then return end
    if not unit.player then return end
    if not unit.casting and not unit.channeling then return end
    if unit.casting and unit.castint then return end
    if unit.channeling and unit.channelint then return end
    if not spell:Castable(unit) then return end

    local casting = unit.casting
    local castTarget = unit.castTarget
    local castRemains = unit.castRemains
    local castTimeComplete = unit.castTimeComplete

    local channeling = unit.channeling
    local channelTimeComplete = unit.channelTimeComplete

    -- Don't interrupt if we already have Grounding Totem buff
    if casting and castTarget.friend and castTarget.buff("Grounding Totem") then return end

    if casting then
      -- insert interrupt list here
      if castTimeComplete > castDelay and castRemains > awful.buffer and (castRemains < awful.buffer + awful.latency + 0.03 + finishDelay or not unit.predictLoS(castRemains - awful.buffer + awful.latency + 0.03)) then
        if spell:Cast(unit) then
          return
        end
      end
    elseif channeling then
      -- insert interrupt list here
      if channelTimeComplete > channelDelay then
        if spell:Cast(unit) then
          return
        end
      end
    end
  end)
end)

-- Death Grip