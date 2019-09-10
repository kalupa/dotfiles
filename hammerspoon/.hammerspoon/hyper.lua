local _HYPER = {'cmd,ctrl,alt,shift'}
local log = hs.logger.new('hyper.lua', 'debug')

hs.hotkey.bind(_HYPER, '=', hs.caffeinate.startScreensaver)

-- Launch apps with Hyper key
hyperModeAppMappings = {

  -- Work
  { 'b', 'Google Chrome' }, -- B-rowser
  { 'c', 'Slack' }, -- C-hat
  { 'e', '/usr/local/opt/emacs-plus/Emacs.app' }, -- Text Editor
  { 't', 'iTerm' }, -- T-erminal

-- Personal
  { ';', 'Firefox.app' }, -- Browser
  { 'p', 'Sblack' }, -- Chat
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
