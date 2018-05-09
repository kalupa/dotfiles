local log = hs.logger.new('init.lua', 'debug')

keyUpDown = function(modifiers, key)
  log.d('Sending keystroke:', hs.inspect(modifiers), key)
  hs.eventtap.event.newKeyEvent(modifiers, key, true):post()
  hs.eventtap.event.newKeyEvent(modifiers, key, false):post()
end

require('hyper')
require('wifi-status-change')

require('reloadconfig')
