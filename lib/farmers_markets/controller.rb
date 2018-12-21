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
    puts "To find out if a specific district has markets, enter 'with markets?'"
    
    
#    puts "Welcome to your music library!"
#    puts "To list all of your songs, enter 'list songs'."
#    puts "To list all of the artists in your library, enter 'list artists'."
#    puts "To list all of the genres in your library, enter 'list genres'."
#    puts "To list all of the songs by a particular artist, enter 'list artist'."
#    puts "To list all of the songs of a particular genre, enter 'list genre'."
#    puts "To play a song, enter 'play song'."
#    puts "To quit, type 'exit'."
    
    
  end
  
end