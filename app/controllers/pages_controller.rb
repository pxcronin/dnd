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
    @response = fetch("fireball")
    # @response = Scraper.fetch("fireball")
    # @name = response.body.name
    # @search = scrape("fireball")
  end
end
