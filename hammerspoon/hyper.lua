-- a global variable for hyper mode
hyperMode = hs.hotkey.modal.new({}, 'F17')

-- Keybindings for launching apps in Hyper Mode
hyperModeAppMappings = {
  { 'e', '/usr/local/opt/emacs-mac/Emacs.app' }, -- E-ditor
  { 't', 'iTerm' }, -- T-erminal
  { 'c', 'Slack' }, -- C-hat
  { 'd', 'Things3' }, -- to-D-o
  { 'm', 'Mailplane 3' }, -- e-M-ail
  { 'b', 'Google Chrome' }, -- B-rowser
  { 'k', 'Fantastical 2' }, -- K-alendar
}
  -- { 'm', 'Airmail 3'},

for i, mapping in ipairs(hyperModeAppMappings) do
  hyperMode:bind({}, mapping[1], function()
    hs.application.launchOrFocus(mapping[2])
  end)
end

-- clear sticky alert notificationb
function clearNotification()
  local script = [[
    tell application "System Events" to tell process "Notification Center"
      try
        click button 1 of last item of windows
      end try
    end tell
    return input]]
  hs.osascript.applescript(script)
end
hyperMode:bind({}, 'escape', clearNotification)

function clearAllNotifications()
  local script = [[
    tell application "System Events" to tell process "Notification Center"
      click button 1 in every window
    end tell
    return input]]
  hs.osascript.applescript(script)
end
hyperMode:bind({'shift'}, 'escape', clearNotification)

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

hyperMode:bind({}, 'g', hs.grid.toggleShow)

hyperMode:bind({}, "space", fullscreen) -- BAM!

hyperMode:bind({}, "Left", function()
    local win = hs.window.focusedWindow()
    win:moveOneScreenWest(false, true, 0)
end)
hyperMode:bind({}, "Right", function()
    local win = hs.window.focusedWindow()
    win:moveOneScreenEast(false, true, 0)
end)

-- center window
hyperMode:bind({}, "delete", function()
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

hyperMode:bind({}, "[", function()
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

hyperMode:bind({}, "]", function()
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
-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()

-- Enter Hyper Mode when F17 (Left Alt) is pressed
pressedF18 = function()
  hyperMode:enter()
end

-- Leave Hyper Mode when F17 (Left alt) is released.
releasedF18 = function()
  hyperMode:exit()
end

-- Bind the Hyper key
f17 = hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)
