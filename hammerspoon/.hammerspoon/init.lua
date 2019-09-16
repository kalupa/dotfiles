local log = hs.logger.new('init.lua', 'debug')

-- https://github.com/Hammerspoon/Spoons/raw/master/Spoons/SpoonInstall.spoon.zip
-- spoon installer

function findSpoon(name)
  local spoonFile = package.searchpath(name, package.path)
  if spoonFile == nil then
    return false
  else
    return true
  end
end

-- https://github.com/miromannino/miro-windows-manager/raw/master/MiroWindowsManager.spoon.zip
-- for window management used in 'hyper'
require('hyper')

-- https://github.com/Hammerspoon/Spoons/raw/master/Spoons/ReloadConfiguration.spoon.zip
-- config reloader
require('reloadconfig')

