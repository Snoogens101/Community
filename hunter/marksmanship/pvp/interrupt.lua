local Unlocker, awful, proj = ...
local player, target = awful.player, awful.target
if proj.HunterCheck() then return end

local hunter = proj.hunter
local marksmanship = proj.hunter.marksmanship
local talents = proj.ID.talent

local SpellStopCasting = awful.unlock("SpellStopCasting")
local CastInterruptDelay = awful.delay(0.374, 0.564)
local CastFinishDelay = awful.delay(0.21, 0.44)
local ChannelInterruptDelay = awful.delay(0.61, 0.84)

SilencingShot:Callback("Interrupt", function(spell)

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

    -- Don't interrupt if we already have Grounding Totem buff
    if unit.casting and unit.casttarget.friend and unit.casttarget.buff("Grounding Totem") then return end

    if unit.casting then
      if unit.castTimeComplete > castDelay and unit.castRemains > awful.buffer and (unit.castRemains < awful.buffer + awful.latency + 0.03 + finishDelay or not unit.predictLoS(unit.castRemains - awful.buffer + awful.latency + 0.03)) then

      end
    elseif unit.channeling then
      if unit.channelTimeComplete > channelDelay then

      end
    end
  end)
end)