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
  
  def scrape(key)
    # url = "https://app.roll20.net/compendium/dnd5e/Spells%20List?sort=Level&amp;Classes[]=#{key}#content"
    # uri = URI.parse(url)
    # response = Net::HTTP.get_response(uri)
    # JSON.parse(response.body)
  end

  def home
    # raise
    params['spell'].nil? ? response = fetch('fireball') : response = fetch(params['spell']['spell'].gsub(' ', '_'))
    @name = response['name']
    @level = response['data']['Level']
    @casting_time = response['data']['Casting Time']
    @range_area = response['data']['Range']
    @damage = response['data']['Damage'].nil? ? response['data']['Healing'].nil? ? "See description for effect" : response['data']['Healing'] : response['data']['Damage']
    @dam_heal_nums = @damage.include?('description') ? "" : @damage.split('d').map { |n| n.to_i }
    @average_dam_heal = ((1..@dam_heal_nums[1]).sum.to_f / @dam_heal_nums[1] * @dam_heal_nums[0]).to_i unless @dam_heal_nums == ""
    @min_dam_heal = @dam_heal_nums[0] unless @dam_heal_nums == ""
    @max_dam_heal = @dam_heal_nums[0] * @dam_heal_nums[1] unless @dam_heal_nums == ""
    @components = response['data']['Components']
    @duration = response['data']['Duration']
    @attack_save = response['data']['Save'].nil? ? response['data']['Spell Attack'].nil? ? "None" : "Spell Attack" : "#{response['data']['Save']} Save"
    @damage_effect = response['data']['Damage Type'].nil? ? response['data']['Healing'].nil? ? "Buff/Debuff" : "Healing" : response['data']['Damage Type']
    @description = response['data']['data-description']
    @higher_level_description = response['data']['Higher Spell Slot Desc'].nil? ? nil : response['data']['Higher Spell Slot Desc']
    @materials = response['data']['Material'].nil? || response['data']['Material'].include?("consumes") ? response['data']['Material'] : nil
    @classes = response['data']['Classes']
    @concentration = "Yes" unless response['data']['Concentration'].nil?

    # @test = scrape('Bard')
  end

  def spell_damage

  end

  private

  def spell_params
  end
end
