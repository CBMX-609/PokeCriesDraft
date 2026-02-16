local sound_files = NFS.getDirectoryItems(SMODS.current_mod.path .. 'assets/sounds')

for _, path in ipairs(sound_files) do
  SMODS.Sound {
    key = path:sub(1, -5),
    path = path
  }
end

function pcry_safely_play_sound(sound, pitch, volume)
  if not SMODS.Sounds[sound] then return end
  play_sound(sound, pitch, volume)
end

local add_to_deck = Card.add_to_deck
function Card:add_to_deck(from_debuff)
  local ret = add_to_deck(self, from_debuff)
  if not from_debuff and self.config.center.stage then
    pcry_safely_play_sound('pcry_' .. self.ability.name)
  end
  return ret
end
