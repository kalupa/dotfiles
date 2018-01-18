local log = hs.logger.new('init.lua', 'debug')

keyUpDown = function(modifiers, key)
  log.d('Sending keystroke:', hs.inspect(modifiers), key)
  hs.eventtap.event.newKeyEvent(modifiers, key, true):post()
  hs.eventtap.event.newKeyEvent(modifiers, key, false):post()
end

require('hyper')
-- require('muteonsleep')
-- require('wifi-status-change')

require('reloadconfig')

--- Filter that includes full-screen apps
-- hs.window.filter.ignoreAlways['Alfred3'] = true
-- hs.window.filter.ignoreAlways['iTerm2'] = true
-- hs.window.filter.ignoreAlways['Emacs'] = true
-- hs.window.filter.ignoreAlways['Slack'] = true
-- hs.window.filter.ignoreAlways['Mailplane 3'] = true
-- hs.window.filter.ignoreAlways['Fantastical'] = true
-- hs.window.filter.ignoreAlways['Airmail 3'] = true


-- ----------------------------
-- App switcher with Cmd++j/k
-- ----------------------------
-- switcher = hs.window.switcher.new(hs.window.filter.new(),
-- switcher = hs.window.switcher.new(globalfilter(),
--                                   {textSize = 12,
--                                    showTitles = false,
--                                    showThumbnails = false,
--                                    showSelectedTitle = false,
--                                    selectedThumbnailSize = 128,
--                                    backgroundColor = {0, 0, 0, 0}})
-- -- switcher = hs.window.switcher.new()

-- hs.hotkey.bind({'cmd'},'j', function() switcher:next() end)
-- hs.hotkey.bind({'cmd'},'k', function() switcher:previous() end)
