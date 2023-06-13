local Unlocker, awful, proj = ...
local player, target, focus, healer, enemyHealer = awful.player, awful.target, awful.focus, awful.healer, awful.enemyHealer
if proj.LoadCheck() then return end

proj.LOADING = 0
local function PauseVariable()
  proj.LOADING = awful.time
end
awful.addEventCallback(PauseVariable, "PLAYER_ENTERING_WORLD")
awful.addEventCallback(PauseVariable, "PLAYER_LEAVING_WORLD")

proj.PlayerGargoyle = 0

awful.addEventCallback(function(eventInfo, eventType, sourceObject, destObject)
  local _, subEvent, _, sourceGUID, sourceName, _, _, destGUID, destName, destFlags, destRaidFlags, spellID, spellName, _, auraType, extraSpellName, auraType2 = unpack(eventInfo)
  local time = awful.time

  if subEvent == "SPELL_CAST_SUCCESS" then
    if sourceObject then
      if sourceObject.enemy then

      elseif sourceObject.friend then
        if sourceObject.isUnit(player) then
          if spellID == 49206 then
            proj.PlayerGargoyle = awful.time
          end
        end
      end
    end
  end
end)