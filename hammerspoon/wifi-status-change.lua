-- Update Slack status when WFH
--

local homeWifi = "much-internet-such-wifi-5g-wow"
local workWifi = "unbounce"

function wfhWifiChanger()
  local currentWifi = hs.wifi.currentNetwork()
  if currentWifi == homeWifi then
    -- {
    --   "status_text": "Working From Home",
    --   "status_emoji": ":house_with_garden:"
    -- }
    -- change Slack Status to WFH
  elseif currentWifi == workWifi then
    -- {
    --   "status_text": "",
    --   "status_emoji": ""
    -- }
    -- reset Slack Status
  else
    -- {
    --   "status_text": "Places Unknown",
    --   "status_emoji": ":milky_way:"
    -- }
  end
end

local wfhWatcher = hs.wifi.watcher.new(wfhWifiChanger)
-- wfhWatcher:start()
