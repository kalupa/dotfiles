-- Update Slack status when WFH
--
local log = hs.logger.new('init.lua', 'debug')

local home = "much-internet-such-wifi-5g-wow"
local work = "unbounce"

function wfhWifiChanger()
  local currentWifi = hs.wifi.currentNetwork()
  if currentWifi == home then
    status = {
      "status_text", "Working From Home",
      "status_emoji", ":house_with_garden:"
    }
    -- change Slack Status to WFH
  elseif currentWifi == work then
    status = {
      "status_text", "",
      "status_emoji", ""
    }
    -- reset Slack Status
  else
    status = {
      "status_text", "Working from Places Unknown",
      "status_emoji", ":milky_way:"
    }
  end
  log.d(status)
end

local wfhWatcher = hs.wifi.watcher.new(wfhWifiChanger)
wfhWatcher:start()
