-- a global variable for hyper mode
-- hyperMode = hs.hotkey.modal.new({}, 'F17')
-- hs.hotkey.bind({'cmd'},'j', function() switcher:next() end)

-- Keybindings for launching apps in Hyper Mode
hyperModeAppMappings = {
  { 'b', 'Google Chrome' }, -- Work B-rowser
  { 'c', 'Slack' }, -- Work C-hat
  { 'd', 'OmniFocus' }, -- to-D-o
  { 'r', 'Visual Studio Code' }, -- vscode
  { 't', 'iTerm' }, -- T-erminal
  { 'e', '/usr/local/opt/emacs-plus/Emacs.app' }, -- Text Editor
  { ';', 'Safari' }, -- Work B-rowser
  { 'm', 'Airmail 3'}, -- Mail
}

-- { 'c', 'Sblack' }, -- Work C-hat
-- { 'm', 'Mail'}, -- Mail
-- { 'm', 'Canary Mail'}, -- Mail
-- { 'p', 'Franz' }, -- Personal Chat
-- { 'k', 'Fantastical 2'}, -- Calendar
-- { 'k', 'Calendar'}, -- Calendar
-- { 'e', '/Applications/Emacs.app' }, -- Text Editor
-- { 'e', '/usr/local/bin/emacs' }, -- Text Editor
-- { 'e', '/usr/local/opt/emacs-plus/Emacs.app' }, -- Text Editor
-- { 'e', '/usr/local/Cellar/emacs-plus/26.1/Emacs.app' }, -- Text Editor
-- { 't', 'Hyper' }, -- T-erminal
-- { 'k', 'Fantastical 2' }, -- K-alendar


local _HYPER = {'cmd,ctrl,alt,shift'}

for i, mapping in ipairs(hyperModeAppMappings) do
  local key = mapping[1]
  local appName = mapping[2]

  hs.hotkey.bind(_HYPER, key, function()
    hs.application.launchOrFocus(appName)
  end)
end

hs.hotkey.bind(_HYPER, "k", function() switchToCalendar() end)

-- hs.hotkey.bind(_HYPER, "b", function()
--     switchToChromeProfile('U')
-- end)

fullscreen = function() hs.grid.maximizeWindow(hs.window.focusedWindow()) end

-- hs.grid.HINTS = {
--   { "!", "@", "{", "}", "&", "=", "7", "8", "9", "*" },
--   { "#", "$", "(", ")", "~", "|", "4", "5", "6", "-" },
--   { "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P" },
--   { "A", "S", "D", "F", "G", "H", "J", "K", "L", ";" },
--   { "Z", "X", "C", "V", "B", "N", "M", ",", ".", "/" }
-- }

-- Set some resize grids up
hs.grid.setGrid('10x3') -- default to something that maps nicely ...
hs.grid.setGrid('8x3', '1680x1050')
hs.grid.setGrid('12x4', '3440x1440')

hs.grid.setMargins({0,0}) -- gapless
hs.window.animationDuration = 0 -- disable animations

hs.hotkey.bind(_HYPER, '=', hs.caffeinate.startScreensaver)

hs.hotkey.bind(_HYPER, 'g', hs.grid.toggleShow)

hs.hotkey.bind(_HYPER, "space", fullscreen) -- BAM!

hs.hotkey.bind(_HYPER, "Left", function()
    local win = hs.window.focusedWindow()
    win:moveOneScreenWest(false, true, 0)
end)
hs.hotkey.bind(_HYPER, "Right", function()
    local win = hs.window.focusedWindow()
    win:moveOneScreenEast(false, true, 0)
end)

hs.hotkey.bind(_HYPER, "[", function()
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

hs.hotkey.bind(_HYPER, "]", function()
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


switchToCalendar = function()
  hs.osascript.applescript([[
    tell application "Calendar"
    switch view to day view
    view calendar at current date
    end tell
    ]])
end


switchToChromeProfile = function(profileName)
  chromeSwitcher = 'set PROFILE to "' .. profileName .. '"' .. [[

    if application "Google Chrome" is running then
      tell application "System Events" to tell process "Google Chrome"
        set frontmost to true
        click menu item PROFILE of menu 1 of menu bar item "People" of menu bar 1
      end tell
    end if
    if application "Google Chrome" is not running then
      tell application "Google Chrome"
        activate
      end tell
      tell application "System Events" to tell process "Google Chrome"
        set frontmost to true
        click menu item PROFILE of menu 1 of menu bar item "People" of menu bar 1
      end tell
    end if
    ]]
  hs.osascript.applescript(chromeSwitcher)
end
