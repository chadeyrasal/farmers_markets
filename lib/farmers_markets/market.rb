class FarmersMarkets::Market
  
  attr_accessor :name, :location, :district, :phone_number, :email, :website
  
  @@all = []
  
  def self.all
#    @@all
    puts "Market 1 - London Fields - E8"
    puts "Market 2 - Islington Town Hall - N1"
  end
  
end