class FarmersMarkets::Market
  
  attr_accessor :name, :postcode, :district, :phone_number, :email, :website
  
  @@all = []
  
  def self.all
#    @@all
    market1 = self.new
    market1.name = "London Fields Farmers Market"
    market1.district = "E8"
    market2 = self.new
    market2.name = "Islington Town Hall Farmers Market"
    market2.district = "N1"
    
    [market1, market2]
  end
  
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
  
end