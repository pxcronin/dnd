# require 'scraper'
require 'open-uri'
require 'net/http'
require 'json'
class PagesController < ApplicationController
  def fetch(search)
    url = "https://app.roll20.net/compendium/dnd5e/#{search}.json"
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end
  
  def home
    # raise
    params['spell'].nil? ? response = fetch('fireball') : response = fetch(params['spell']['spell'].gsub(" ", "_"))
    @name = response['name']
    @level = response['data']['Level']
    @casting_time = response['data']['Casting Time']
    @range_area = response['data']['Range']
    @damage = response['data']['Damage'].nil? ? response['data']['Healing'] : response['data']['Damage']
    @components = response['data']['Components']
    @duration = response['data']['Duration']
    @attack_save = response['data']['Save'].nil? ? response['data']['Spell Attack'].nil? ? "None" : "Spell Attack" : "#{response['data']['Save']} Save"
    @damage_effect = response['data']['Damage Type'].nil? ? response['data']['Healing'].nil? ? "Buff/Debuff" : "Healing" : response['data']['Damage Type']
    @description = response['data']['data-description']
    @higher_level_description = response['data']['Higher Spell Slot Desc']
  end

  private

  def spell_params
  end
end
