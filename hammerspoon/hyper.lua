-- A global variable for Hyper Mode
hyperMode = hs.hotkey.modal.new({}, 'F17')

-- Keybindings for launching apps in Hyper Mode
-- hyperModeAppMappings = {
--   { 'a', 'iTunes' },            -- "A" for "Apple Music"
--   { 'b', 'Google Chrome' },     -- "B" for "Browser"
--   { 'c', 'Slack' },             -- "C for "Chat"
--   { 'd', 'Remember The Milk' }, -- "D" for "Do!" ... or "Done!"
--   { 'e', 'Atom Beta' },         -- "E" for "Editor"
--   { 'f', 'Finder' },            -- "F" for "Finder"
--   { 'g', 'Mailplane 3' },       -- "G" for "Gmail"
--   { 't', 'iTerm' },             -- "T" for "Terminal"
-- }
hyperModeAppMappings = {
  { 'e', 'Emacs' }
}

for i, mapping in ipairs(hyperModeAppMappings) do
  hyperMode:bind({}, mapping[1], function()
    hs.application.launchOrFocus(mapping[2])
  end)
end

-- Enter Hyper Mode when F17 (right option key) is pressed
pressedF18 = function()
  hyperMode:enter()
end

-- Leave Hyper Mode when F17 (right option key) is released.
releasedF18 = function()
  hyperMode:exit()
end

-- Bind the Hyper key
f17 = hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)
