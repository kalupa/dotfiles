-- a global variable for hyper mode
-- hyperMode = hs.hotkey.modal.new({}, 'F17')
-- hs.hotkey.bind({'cmd'},'j', function() switcher:next() end)

-- Keybindings for launching apps in Hyper Mode
hyperModeAppMappings = {
  { 'c', 'Slack' }, -- C-hat
  { 'e', '/usr/local/opt/emacs-mac/Emacs.app' }, -- E-ditor
  { 't', 'iTerm' }, -- T-erminal
  { 'm', 'Mail.app'}, -- Mail
  { 'd', 'Things3' }, -- to-D-o
  { 'b', 'Google Chrome' }, -- B-rowser
  { 'k', 'Fantastical 2' }, -- K-alendar
}

  -- { 'm', 'Spark' }, -- e-M-ail
  -- { 'm', 'Airmail 3'}, -- e-M-ail
  -- { 't', 'Hyper' }, -- T-erminal

for i, mapping in ipairs(hyperModeAppMappings) do
  hs.hotkey.bind({'cmd,ctrl,alt,shift'}, mapping[1], function()
    hs.application.launchOrFocus(mapping[2])
  end)
end

-- ---------------------------------------------------------------------------------------
-- Frustratingly, this doesn't work with the "hyper" configured unless it's the "F18" way.
--
-- -- clear sticky alert notifications
-- function clearNotification()
--   local script = [[
--     tell application "System Events" to tell process "Notification Center"
--       try
--         click button 1 of last item of windows
--       end try
--     end tell
--     return input]]
--   hs.osascript.applescript(script)
-- end
-- hs.hotkey.bind({'cmd,ctrl,alt,shift'}, 'escape', clearNotification)
-- hs.hotkey.bind({'cmd,ctrl,alt,shift'}, 'r', clearNotification)
-- ---------------------------------------------------------------------------------------

fullscreen = function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f, 0)
end

-- Set some resize grids up
hs.grid.setGrid('8x6', '3840x2160')
hs.grid.setGrid('6x4', '2560x1440')
hs.grid.setGrid('6x4', '1680x1050')
hs.grid.setGrid('6x4', '1920x1200')
hs.grid.setGrid('6x4', '1920x1080')
hs.grid.setGrid('6x4', '1440x900')
hs.grid.setMargins({0,0}) -- gapless
hs.window.animationDuration = 0 -- disable animations

hs.hotkey.bind({'cmd,ctrl,alt,shift'}, '=', hs.caffeinate.startScreensaver)

hs.hotkey.bind({'cmd,ctrl,alt,shift'}, 'g', hs.grid.toggleShow)

hs.hotkey.bind({'cmd,ctrl,alt,shift'}, "space", fullscreen) -- BAM!

hs.hotkey.bind({'cmd,ctrl,alt,shift'}, "Left", function()
    local win = hs.window.focusedWindow()
    win:moveOneScreenWest(false, true, 0)
end)
hs.hotkey.bind({'cmd,ctrl,alt,shift'}, "Right", function()
    local win = hs.window.focusedWindow()
    win:moveOneScreenEast(false, true, 0)
end)

-- center window
hs.hotkey.bind({'cmd,ctrl,alt,shift'}, "delete", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 4)
    f.y = max.y + (max.h / 4)
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f, 0)
end)

hs.hotkey.bind({'cmd,ctrl,alt,shift'}, "[", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f, 0)
end)

hs.hotkey.bind({'cmd,ctrl,alt,shift'}, "]", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f, 0)
end)
