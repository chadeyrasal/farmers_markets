require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper
  
  def self.scrape_markets
    doc = Nokogiri::HTML(open("http://www.farma.org.uk/members-map/"))
    my_markets = []
    doc.css("div.map-member").each do |member|
      this_market = {}
      this_market[:name] = member.css("h4").text
      this_market[:postcode] = member.css("div.postcode").text
      this_market[:details_link] = member.css("a.read-more").attribute("href").value
      my_markets << this_market
    end
    my_markets
  end
  
  def self.scrape_contact_details(market_url)
    doc = Nokogiri::HTML(open(market_url))
    market_details = []
    doc.css("").each do |detail|
      contact_details = {}
      contact_details[:address] = detail.css("")
    end
  end
  
end