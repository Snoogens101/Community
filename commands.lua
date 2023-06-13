local Unlocker, awful, proj = ...
if proj.LoadCheck() then return end

proj.cmd:New(function(msg)
  msg = msg:lower()
  
end)