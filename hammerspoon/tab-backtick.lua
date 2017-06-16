-- tbt = hs.hotkey.modal.new('shift', 'tab')

hs.hotkey.bind('shift', 'tab', function()
  hs.eventtap.keySroke({}, '`')
end)
