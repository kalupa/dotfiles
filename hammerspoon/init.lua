local log = hs.logger.new('init.lua', 'debug')

keyUpDown = function(modifiers, key)
  log.d('Sending keystroke:', hs.inspect(modifiers), key)
  hs.eventtap.event.newKeyEvent(modifiers, key, true):post()
  hs.eventtap.event.newKeyEvent(modifiers, key, false):post()
end

require('control-escape')
require('hyper')

-- require('super')
-- require('tab-backtick')

-- Reload config when any lua file in config directory changes
function reloadConfig(files)
  doReload = false
  for _,file in pairs(files) do
    if file:sub(-4) == '.lua' then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end
local myWatcher = hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', reloadConfig):start()

hs.notify.new({title='Hammerspoon', informativeText='Loading complete ...'}):send()
