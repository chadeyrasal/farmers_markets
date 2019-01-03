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
  
  def add_market_attributes(attributes)
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
  end

  def self.all
    @@all
  end
  
  def self.districts
    my_districts = @@all.collect{|market| market.district}.uniq
    my_districts.delete_if {|district| district == "0000"}
    my_districts.delete_if {|district| district == "ENTER POSTCODE"}
    my_districts.delete_if {|district| district == ""}
    my_districts.delete_if {|district| district == "H65ED39"}
    my_districts
  end
  
end