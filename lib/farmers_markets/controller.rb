class FarmersMarkets::Controller
  
  def call
    puts "Welcome Local Food Hunter!"
    menu
    goodbye
  end
  
  def menu
    space
    puts "To list districts that have farmers markets, enter 'ld'"
    puts "To list all farmers markets in a specific district, enter 'lm'"
    puts "To have the details of a specific market, enter 'market'"
    puts "To leave the application, enter 'exit'"
    space
    user_input = nil
    while user_input != "exit"
      space
      puts "What would you like to do?"
      space
      user_input = gets.strip.downcase
      case user_input
      when "ld"
        list_districts
      when "lm"
        list_markets
      when "market"
        market_details
      when "exit"
        goodbye
        exit
      else
        space
        puts "I am not sure I understand what you want"
        puts "What would you like to do?"
        space
      end
    end
    
  end
  
  def goodbye
    space
    puts "Goodbye, see you for the next market!"
  end
  
  def space
    puts " "
  end
  
  def list_markets
    space
    FarmersMarkets::Market.all
  end
  
  def list_districts
    space
    FarmersMarkets::District.all
  end
  
  def market_details
    space
    puts "Name: East Farleigh Market"
    puts "Location: ME15 0JL"
    puts "Phone Number: 01732833976"
    puts "Email: bob@kfma.org.uk"
    puts "Website: https://www.kfma.org.uk"
  end
  
end