class FarmersMarkets::Controller
  
  def call
    puts "Welcome Local Food Hunters!"
    main_prompt
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
    end
    until user_input == "exit"
      main_prompt
      user_input = gets.strip.downcase
    end
  end
  
  def main_prompt
    puts "To see your options, type in 'menu'"
    puts "To leave the application, type in 'exit'"
    puts "What would you like to do?"  
  end
  
  def display_menu
    puts " "
    puts "To list all Farmers Markets in the UK, enter 'list markets'"
    puts "To list all UK districts, enter 'list districts'"
    puts "To list all districts that have at least one Farmers Market, enter 'list districts with markets'"
    puts "To list a district's Farmers Markets, enter 'list markets in the district'"
    puts "To have the details of a specific market, enter 'market'"
    puts " "
  end
  
  def list_markets
    puts "Market 1 - London Fields - E8"
    puts "Market 2 - Islington Town Hall - N1"
  end
  
  def list_districts
    puts "District 1 - Dundee - DD"
    puts "District 2 - Bath - BA"
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