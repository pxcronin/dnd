class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :level
      t.string :class
      t.integer :armor_class
      t.integer :strength
      t.integer :dexterity
      t.integer :constitution
      t.integer :intelligence
      t.integer :wisdom
      t.integer :charisma
      t.integer :proficiency_bonus
      t.integer :acrobatics
      t.integer :animal_handling
      t.integer :arcana
      t.integer :athletics
      t.integer :deception
      t.integer :history
      t.integer :insight
      t.integer :intimidation
      t.integer :investigation
      t.integer :medicine
      t.integer :nature
      t.integer :perception
      t.integer :performance
      t.integer :persuasion
      t.integer :religion
      t.integer :sleight_of_hand
      t.integer :stealth
      t.integer :survival
      t.integer :thieves_tools
      t.integer :alchemist_supplies
      t.integer :brewer_supplies
      t.integer :calligrapher_supplies
      t.integer :carpenter_tools
      t.integer :cartographer_tools
      t.integer :cobbler_tools
      t.integer :cook_utensils
      t.integer :glassblower_tools
      t.integer :jewelwer_tools
      t.integer :leatherworker_tools
      t.integer :mason_tools
      t.integer :painter_supplies
      t.integer :potter_tools
      t.integer :smith_tools
      t.integer :tinker_tools
      t.integer :weaver_tools
      t.integer :woodcarver_tools
      t.integer :disguise_kit
      t.integer :forgery_kit
      t.integer :navigator_tools
      t.integer :poisoner_kit
      t.integer :herbalism_kit
      t.integer :platinum
      t.integer :gold
      t.integer :silver
      t.integer :copper
      t.boolean :darkvision
      t.integer :hit_points
      t.integer :speed
      t.string :race
      t.string :background
      t.text :biography
      t.string :alignment

      t.timestamps
    end
  end
end
