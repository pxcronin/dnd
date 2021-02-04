class Character < ApplicationRecord
  validates :name, presence: true
  validates :race, inclusion: { in: %w(Dragonborn Dwarf Elf Gnome Half-Elf Half-Orc Halfling Human Tiefling Bugbear Centaur Goblin Grung Hobgoblin Kobold Lizardfolk Minotaur Orc Yuan-Ti Aarakocra Aasimar Firbolg Genasi Gith Goliath Kalashtar Kenku Leonin Locathah Loxodon Satyr Shifter Tabaxi Tortle Triton Vedalken Warforged) }
  validates :alignment, presence: true, inclusion: { in: ["Lawful Good", "Neutral Good", "Chaotic Good", "Lawful Neutral", "Neutral", "Chaotic Neutral", "Lawful Evil", "Neutral Evil", "Chaotic Evil"]}
end
