class FarmersMarkets::Controller
  
  def call
    puts "Welcome Local Food Hunter!"
    puts "What would you like to do?"
    user_input = gets.strip.downcase
    case user_input
    when "menu"
      display_menu
    when "list markets"
      list_markets
    when "list districts"
      list_districts
    when "list districts with markets"
      list_districts_with_markets
    when "list markets in district"
      list_markets_in_district
    when "market"
      market_details
    when "exit"
      goodbye
      exit
    else
      puts "I am not sure I understand what you want"
    end
    while user_input != "exit"
      puts "What would you like to do now?"
      user_input = gets.strip.downcase
    end
    goodbye
  end
  
  def call
    puts "Welcome Local Food Hunter!"
    menu
    goodbye
  end
  
  def menu
    puts "To list all Farmers Markets in the UK, enter 'list markets'"
    puts "To list all UK districts, enter 'list districts'"
    puts "To list all districts that have at least one Farmers Market, enter 'list districts with markets'"
    puts "To list a district's Farmers Markets, enter 'list markets in the district'"
    puts "To have the details of a specific market, enter 'market'"
    puts " "
  end
  
  def goodbye
    puts "Goodbye, see you for the next market!"
  end
  
  def list_markets
    FarmersMarkets::Market.all
  end
  
  def list_districts
    FarmersMarkets::District.all
  end
  
  def list_districts_with_markets
    puts "District 1 - Rochester - ME"
  end
  
  def list_markets_in_district
    puts "Market 1 - East Farleigh Market"
    puts "Market 2 - Elm Court Village Market"
  end
  
  def market_details
    puts "Name: East Farleigh Market"
    puts "Location: ME15 0JL"
    puts "Phone Number: 01732833976"
    puts "Email: bob@kfma.org.uk"
    puts "Website: https://www.kfma.org.uk"
  end
  
end