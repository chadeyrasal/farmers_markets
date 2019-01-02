require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper
  
  def self.scrape_districts(url_uk_postcode)
    html = File.read(url_uk_postcode)
    all_districts = Nokogiri::HTML(html)
  end
  
end