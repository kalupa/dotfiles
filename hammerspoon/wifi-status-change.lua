-- Update Slack status when WFH
--
local log = hs.logger.new('init.lua', 'debug')

local home = "much-internet-such-wifi-5g-wow"
local work = "unbounce"

function wfhWifiChanger()
  local currentWifi = hs.wifi.currentNetwork()
  status = {}
  if currentWifi == home then
    status["status_text"] = "Working From Home"
    status["status_emoji"] = ":house_with_garden:"
    -- change Slack Status to WFH
  elseif currentWifi == work then
    status["status_text"] = ""
    status["status_emoji"] = ""
    -- reset Slack Status
  else
    status["status_text"] = "Working from Places Unknown"
    status["status_emoji"] = ":milky_way:"
  end
  -- curl -L https://slack.com/api/users.profile.set?token=[token]&profile=[status-url-encoded]

  string_status = hs.json.encode(status)
  encoded_status = hs.http.convertHtmlEntities(string_status)

  log.d(encoded_status)
end

local wfhWatcher = hs.wifi.watcher.new(wfhWifiChanger)
wfhWatcher:start()
