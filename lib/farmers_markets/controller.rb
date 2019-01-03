class FarmersMarkets::Controller
  
  def call
    puts "Welcome Local Food Hunter!"
    
    create_markets
    add_attributes_to_markets
    
    puts "What district are you interested in?"
    user_input = gets.strip
    if FarmersMarkets::Market.districts.include?(user_input)
      list_markets_by_district(user_input)
    else
      puts "There is no market in this district"
    end
    
    puts "Would you like more information on any of the above markets? Enter 'Y' or 'N'"
    user_input = gets.strip
    if user_input == "Y"
      puts "Please enter the number of the market you would like more information about:"
      number_input = gets.strip.to_i
      markets_sorted = FarmersMarkets::Market.all.sort_by{|market| market.name}
      markets_sorted.each.with_index(1) do |market, index|
        if index == number_input
          puts "|  #{market.name}  |"
          puts "    -  #{market.telephone}"
          puts "    -  #{market.email}"
          puts "    -  #{market.website}"
          puts "    -  Membership: #{market.membership}"
        end
      end
    elsif user_input == "N"
      puts "To continue browsing farmers markets, enter 'continue'"
      puts "To leave the application, enter 'leave'"
      user_input = gets.strip
      if user_input == 'continue'
        puts "What district are you interested in?"
      elsif user_input == 'leave'
        goodbye
      end
    else
      "I am not sure I understand what your answer"
    end
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
    markets_sorted = FarmersMarkets::Market.all.sort_by{|market| market.name}
    markets_sorted.each.with_index(1) do |market, index|
      puts "#{index}. #{market.name} - #{market.district}"
    end
  end
  
  def create_markets
    markets_array = Scraper.scrape_markets
    FarmersMarkets::Market.create_from_collection(markets_array)
  end
  
  def add_attributes_to_markets
    FarmersMarkets::Market.all.each do |market|
      market_url = "http://www.farma.org.uk" + market.details_link
      attributes = Scraper.scrape_contact_details(market_url)
      market.add_market_attributes(attributes)
    end
  end
  
  def list_districts
    space
    districts_sorted = FarmersMarkets::Market.districts.sort_by{|district| district}
    districts_sorted.each.with_index(1) do |district, index|
      puts "#{index}. #{district}"
    end
  end
  
  def list_markets_by_district(user_input)
    if my_district = FarmersMarkets::Market.districts.find{|district| district == user_input}
      markets_sorted = FarmersMarkets::Market.all.sort_by{|market| market.name}
      markets_sorted.each.with_index(1) do |market, index|
        puts "#{index}. #{market.name} - #{market.postcode.upcase}" if market.district == user_input
      end
    end
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