-- Inspired by https://github.com/jasoncodes/dotfiles/blob/master/hammerspoon/control_escape.lua

len = function(t)
    local length = 0
    for k, v in pairs(t) do
    	length = length + 1
    end
    return length
end

left_shift=56
right_shift=60

send_left_brace = false
send_right_brace = false
prev_modifiers = {}

shift_key_down = function(evt)
  local curr_modifiers = evt:getFlags()
  if curr_modifiers["shift"] and len(curr_modifiers) == 1 and len(prev_modifiers) == 0 then
    return evt:getKeyCode()
  end
  return false
end

-- not sure how to do modifiers stacked on modifiers to get `[{` and `}]` pairs now
modifier_handler = function(evt)
  local curr_modifiers = evt:getFlags()
  if shift_key_down(evt) == left_shift then
    send_left_brace = true
  elseif prev_modifiers['shift'] and len(curr_modifiers) == 0 and send_left_brace then
    send_left_brace = false
    hs.eventtap.keyStroke({}, "[")
  else
    send_left_brace = false
  end

  if shift_key_down(evt) == right_shift then
    send_right_brace = true
  elseif prev_modifiers['shift'] and len(curr_modifiers) == 0 and send_right_brace then
    send_right_brace = false
    hs.eventtap.keyStroke({}, "]")
  else
    send_right_brace = false
  end
  prev_modifiers = curr_modifiers

  return false
end

-- Call the modifier_handler function anytime a modifier key is pressed or released
modifier_tap = hs.eventtap.new({hs.eventtap.event.types.flagsChanged}, modifier_handler)
modifier_tap:start()

-- If any non-modifier key is pressed, we know we won't be sending an escape
non_modifier_tap = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(evt)
    send_left_brace = false
	return false
end)
non_modifier_tap:start()
