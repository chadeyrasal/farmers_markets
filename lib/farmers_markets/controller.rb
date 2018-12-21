class FarmersMarkets::Controller
  
  def call
    puts "Welcome Local Food Hunters"
    puts "To see your options, type in 'menu'"
    puts "To leave the application, type in 'exit'"
    puts "What would you like to do?"
    user_input = gets.strip
    if user_input.upcase == "MENU"
      menu
    elsif user_input.upcase == "EXIT"
      exit
    else
      puts "What would you like to do?"  
      user_input = gets.strip
    end
  end
  
  def menu
    puts "To list all Farmers Markets in the UK, enter 'list markets'"
    puts "To list all UK districts, enter 'list districts'"
    puts "To list all districts that have at least one Farmers Market, enter 'list districts with markets'"
    puts "To list a district's Farmers Markets, enter 'list markets in the district'"
    puts "To have the details of a specific market, enter 'market'"
    user_input = gets.strip
    if user_input.upcase == "LIST MARKETS"
      list_markets
    elsif user_input.upcase == "LIST DISTRICTS"
      list_districts
    elsif user_input.upcase == "LIST DISTRICTS WITH MARKETS"
      list_districts_with_markets
    elsif user_input.upcase == "LIST MARKETS IN THE DISTRICT"
      list_markets_in_the_district
    elsif user_input.upcase == "MARKET"
      market_details
    end
  end
  
  def list_markets
  end
  
  def list_districts
  end
  
  def list_districts_with_markets
  end
  
  def list_markets_in_the_district
  end
  
  def market_details
  end
  
end