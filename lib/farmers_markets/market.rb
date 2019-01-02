class FarmersMarkets::Market
  
  attr_accessor :name, :postcode, :district, :phone_number, :email, :website, :membership
  
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
  

  
end