-- lifted from https://gist.github.com/rjhilgefort/07ce5cdd3832083d7e94113d54372b1c

local sendEscape = true
local ctrlKeyTimer = hs.timer.delayed.new(0.15, function()
                                            sendEscape = false
end)
local lastMods = {}

local flagsChangedHandler = function(event)
  local newMods = event:getFlags()

  if lastMods.ctrl == newMods.ctrl then return false end

  if not lastMods.ctrl then
    sendEscape = true
    lastMods = newMods
    ctrlKeyTimer:start()
  else
    if sendEscape then hs.eventtap.keyStroke({}, "escape") end
    lastMods = newMods
    ctrlKeyTimer:stop()
  end

  return false

end

flagsChanged = hs.eventtap.new({ hs.eventtap.event.types.flagsChanged }, flagsChangedHandler)
flagsChanged:start()
