class FarmersMarkets::Controller
  
  def call
    space
    puts "   -------------------------------   "
    puts "  |  Welcome, Local Food Hunter!  |  "
    puts "   -------------------------------   "
    
    create_markets
    add_attributes_to_markets
    what_district
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
  
  def space
    puts " "
  end
  
  def goodbye
    space
    puts "Goodbye, see you for the next market!"
    exit
  end
  
  def what_district
    space
    puts "What district are you interested in?"
    user_input = gets.strip.upcase
    if FarmersMarkets::Market.districts.include?(user_input)
      list_markets_by_district(user_input)
      more_info
    else
      puts "There is no market in this district"
      continue_or_leave
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
  
  def continue_or_leave
    user_input = nil
    while user_input != "leave"
      space
      puts "To continue browsing farmers markets, enter 'continue'"
      puts "To leave the application, enter 'leave'"
      user_input = gets.strip.downcase
      if user_input == 'continue'
        what_district
      elsif user_input == 'leave'
        goodbye
      else
        space
        meaning
      end
    end
  end
  
  def more_info
    space
    user_input = nil
    until user_input == "Y" || user_input == "N"
      puts "Would you like more information on any of the above markets? Enter 'Y' or 'N'"
      user_input = gets.strip.upcase
      if user_input == "Y"
        display_details
        continue_or_leave
      elsif user_input == "N"
        continue_or_leave
      else
        space
        meaning
      end
    end
  end
  
  def display_details
    space
    puts "Please enter the number of the market you would like more information about:"
    user_input = gets.strip.to_i
    markets_sorted = FarmersMarkets::Market.all.sort_by{|market| market.name}
    markets_sorted.each.with_index(1) do |market, index|
      if index == user_input
        space
        puts "The markets in your district of interest are:"
        space
        puts "|  #{market.name}  |"
        puts "    -  #{market.telephone}"
        puts "    -  #{market.email}"
        puts "    -  #{market.website}"
        puts "    -  Membership: #{market.membership}"
      end
    end
  end
  
  def meaning
    puts "I am not sure I understand what you mean"
  end
  
end