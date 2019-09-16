-- Reload config when any lua file in config directory changes
-- function reloadConfig(files)
--   doReload = false
--   for _,file in pairs(files) do
--     if file:sub(-4) == '.lua' then
--       doReload = true
--     end
--   end
--   if doReload then
--     hs.reload()
--   end
-- end
-- local myWatcher = hs.pathwatcher.new(os.getenv('HOME') .. 'dotfiles/hammerspoon/.hammerspoon/', reloadConfig):start()

hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

-- spoon.ReloadConfiguration.watch_paths
