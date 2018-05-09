local string = require "string"
local table = require "table"

-- Update Slack status when WFH
--
local log = hs.logger.new('init.lua', 'debug')

local home = "much-internet-such-wifi-5g-wow"
local work = "unbounce"
last_wifi = ""

local function encode(str)
  --Ensure all newlines are in CRLF form
  str = string.gsub (str, "\r?\n", "\r\n")
  --Percent-encode all non-unreserved characters
  --as per RFC 3986, Section 2.3
  --(except for space, which gets plus-encoded)
  str = string.gsub (str, "([^%w%-%.%_%~ ])",
                     function (c) return string.format ("%%%02X", string.byte(c)) end)
  --Convert spaces to plus signs
  str = string.gsub (str, " ", "+")

  return str
end

function postResp(status, body, headers)
  log.d("slack status set response:" .. status .. body)
end

function token()
  local f = assert(io.open(os.getenv ("HOME") .. "/.hammerspoon/.slack-token", "rb"))
  local token = f:read("*line")
  f:close()

  return token
end

function home_status()
  return {
    status_text = "Working From Home",
    status_emoji = ":house_with_garden:"
  }
end

function empty_status()
  return {
    status_text = "",
    status_emoji = ""
  }
end

function gone_status()
  return {
    status_text = "Working from Places Unknown",
    status_emoji = ":milky_way:"
  }
end

function encoded_status(current_wifi_name)
  if current_wifi_name == home then
    status = home_status()
  else
    status = empty_status()
  end

  return encode(hs.json.encode(status))
end

-- curl -L https://slack.com/api/users.profile.set?token=[token]&profile=[status-url-encoded]
function status_url(current_wifi_name)
  return "https://slack.com/api/users.profile.set?token=" .. token() .. "&profile=" .. encoded_status(current_wifi_name)
end


function wfhWifiChanger(watcher, eventName, interface)
  log.d(eventName)
  if eventName == "SSIDChange" then
    current_wifi_name = hs.wifi.currentNetwork() or ""
    url = status_url(current_wifi_name)
    log.d(url)
    hs.http.asyncPost(url, nil, nil, postResp)
  end
end

wfhWifiChanger()
local wfhWatcher = hs.wifi.watcher.new(wfhWifiChanger)
wfhWatcher:start()
wfhWatcher:watchingFor('linkChange', 'SSIDChange', 'powerChange')
