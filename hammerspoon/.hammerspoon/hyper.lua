-- a global variable for hyper mode
-- hyperMode = hs.hotkey.modal.new({}, 'F17')
-- hs.hotkey.bind({'cmd'},'j', function() switcher:next() end)

-- Keybindings for launching apps in Hyper Mode
hyperModeAppMappings = {
  { 'c', 'Slack' }, -- Work C-hat
  { 'd', 'OmniFocus' }, -- to-D-o
  { 'e', '/usr/local/opt/emacs-plus/Emacs.app' }, -- Text Editor
  -- { 'k', 'Calendar'}, -- Calendar
  { 'm', 'Canary Mail'}, -- Mail
  { 'p', 'Franz' }, -- Personal Chat
  { 't', 'iTerm' }, -- T-erminal
}

-- { 'f', 'Firefox' }, -- B-rowser
-- { 'r', 'Visual Studio Code' }, -- vscode
-- { 'e', '/usr/local/opt/emacs-mac/Emacs.app' }, -- E-ditor
-- { 'm', 'Airmail 3'}, -- e-M-ail
-- { 'm', 'Mail.app'}, -- Mail
-- { 't', 'Hyper' }, -- T-erminal
-- { 'k', 'Fantastical 2' }, -- K-alendar
-- { 'p', 'Postman' }, -- P-ostman

for i, mapping in ipairs(hyperModeAppMappings) do
  hs.hotkey.bind({'cmd,ctrl,alt,shift'}, mapping[1], function()
    hs.application.launchOrFocus(mapping[2])
  end)
end

-- { 'b', 'Google Chrome' }, -- B-rowser
hs.hotkey.bind({'cmd,ctrl,alt,shift'}, "b", function()
    switchToChromeProfile('U')
end)

hs.hotkey.bind({'cmd,ctrl,alt,shift'}, ";", function()
    switchToChromeProfile('Paul')
end)

fullscreen = function()
  hs.grid.maximizeWindow(hs.window.focusedWindow())
end

-- Set some resize grids up
hs.grid.setGrid('10x3') -- default to something that maps nicely ...
hs.grid.setGrid('8x3', '1680x1050')
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


hs.hotkey.bind({'cmd,ctrl,alt,shift'}, "k", function()
    hs.osascript.applescript([[
      tell application "Calendar"
      switch view to day view
      view calendar at current date
      end tell
      ]])
end)

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
