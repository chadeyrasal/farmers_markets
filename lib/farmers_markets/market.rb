class FarmersMarkets::Market
  
  attr_accessor :name, :postcode, :details_link, :district, :telephone, :email, :website, :membership
  
  @@all = []
  
  def initialize(market_hash = nil)
    if market_hash
      market_hash.each do |key, value|
        self.send("#{key}=", value)
      end
    end
    @@all << self
  end
  
  def self.create_from_collection(markets_array)
    markets_array.each{|market| self.new(market)}
  end
  
  def add_attributes_to_markets
    
  end
  
  def self.all
    @@all
#    market1 = self.new
#    market1.name = "London Fields Farmers Market"
#    market1.district = "E8"
#    market2 = self.new
#    market2.name = "Islington Town Hall Farmers Market"
#    market2.district = "N1"
#    [market1, market2]
  end
  
end