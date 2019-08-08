-- local _HYPER = {'cmd,ctrl,alt,shift'}

-- hs.hotkey.bind(_HYPER, "k", function()
--   hs.osascript.applescript([[
--     tell application "Calendar"
--     switch view to day view
--     view calendar at current date
--     end tell
--     ]])
-- end)

-- hs.grid.HINTS = {
--   { "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P" },
--   { "A", "S", "D", "F", "G", "H", "J", "K", "L", ";" },
--   { "Z", "X", "C", "V", "B", "N", "M", ",", ".", "/" }
-- }

-- Set some resize grids up
-- hs.grid.setGrid('10x3') -- default to something that maps nicely ...
-- hs.grid.setGrid('8x3', '1680x1050')
-- hs.grid.setGrid('12x4', '3440x1440')

-- hs.grid.setMargins({0,0}) -- gapless
-- hs.window.animationDuration = 0 -- disable animations


-- hs.hotkey.bind(_HYPER, 'g', hs.grid.toggleShow)

-- fullscreen = function() hs.grid.maximizeWindow(hs.window.focusedWindow()) end
-- hs.hotkey.bind(_HYPER, "space", fullscreen) -- BAM!

-- hs.hotkey.bind(_HYPER, "Left", function()
--     local win = hs.window.focusedWindow()
--     win:moveOneScreenWest(false, true, 0)
-- end)
-- hs.hotkey.bind(_HYPER, "Right", function()
--     local win = hs.window.focusedWindow()
--     win:moveOneScreenEast(false, true, 0)
-- end)

-- hs.hotkey.bind(_HYPER, "[", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()
--   local screen = win:screen()
--   local max = screen:frame()

--   f.x = max.x
--   f.y = max.y
--   f.w = max.w / 2
--   f.h = max.h
--   win:setFrame(f, 0)
-- end)

-- hs.hotkey.bind(_HYPER, "]", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()
--   local screen = win:screen()
--   local max = screen:frame()

--   f.x = max.x + (max.w / 2)
--   f.y = max.y
--   f.w = max.w / 2
--   f.h = max.h
--   win:setFrame(f, 0)
-- end)
