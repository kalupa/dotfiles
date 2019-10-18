local _HYPER = {'cmd,ctrl,alt,shift'}
local log = hs.logger.new('hyper.lua', 'debug')

hs.hotkey.bind(_HYPER, '=', hs.caffeinate.startScreensaver)

-- Launch apps with Hyper key
hyperModeAppMappings = {

  { 'b', 'Google Chrome' }, -- B-rowser
  { 'c', 'Slack' }, -- C-hat
  { 'e', '/usr/local/opt/emacs-plus/Emacs.app' }, -- text E-ditor
  { 't', 'iTerm' }, -- T-erminal
  { 'm', 'Mail.app' }, -- e-M-ail

  { ';', 'Firefox.app' }, --
  { 'd', 'OmniFocus' }, -- to-D-o
}

for i, mapping in ipairs(hyperModeAppMappings) do
  local key = mapping[1]
  local appName = mapping[2]

  hs.hotkey.bind(
    _HYPER, key,
    function()
      log.d('Switching to:', appName)
      hs.application.launchOrFocus(appName)
  end)
end

-- hs.loadSpoon("MiroWindowsManager")

-- hs.window.animationDuration = 0
-- spoon.MiroWindowsManager:bindHotkeys({
--   up = {_HYPER, "up"},
--   right = {_HYPER, "]"},
--   down = {_HYPER, "down"},
--   left = {_HYPER, "["},
--   fullscreen = {_HYPER, "space"}
-- })
