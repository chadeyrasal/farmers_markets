class FarmersMarkets::District

  attr_accessor :name, :code
  
  @@all = []
  
  def self.all
#    @@all
    district1 = self.new
    district1.name = "Dundee"
    district1.code = "DD"
    district2 = self.new
    district2.name = "Aberdeen"
    district2.code = "AB"
    
    [district1, district2]
  end
  
end