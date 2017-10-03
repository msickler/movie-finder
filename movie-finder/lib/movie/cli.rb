require "lib/scraper"
require "lib/movie/genre"
# --- ok will mark what i believe is done

class Cli
  # --- ok
  def call
    puts "Welcome to Movie Finder, where we help you out when you run out of ideas on what to watch"
    start
    select_movie
    find
    randomize
  end #--- ok
  # --- ok except 1
  def start
    puts "What kind of mood are you looking for?"
    puts "We got all the main ones"
    puts "You name it"
    puts "Actually, let me list you our list of genres"
    puts "Action, of course"
    puts "Comedy, obviously"
    puts "Documentary, for the intellectuals"
    puts "Drama, aka boring or tearjerkers"
    puts "Horror, if you like"
    puts "Family, if you must"
    puts "Mystery, my favorite"
    puts "Romance, to really set the mood"
    puts "Fantasy, because Harry Potter"
    input = gets.strip
    @@genre = input
     if input == "Action" || "Comedy" || "Documentary" || "Drama" || "Horror" || "Family" || "Mystery" || "Romance" || "Fantasy"
         Genre.print_genre_list_of_movies(input)
# ------->  how to make it so Genre.print_genre_list_of_movies takes CLI @@genre
       else
       puts "Now now, that's not a genre we mentioned."
       puts "Enter genre:"
       input = gets.strip
       @@genre = input
       if input == "Action" || "Comedy" || "Documentary" || "Drama" || "Horror" || "Family" || "Mystery" || "Romance" || "Fantasy"
           Genre.print_genre_list_of_movies(input)
         else
           call
         end
       end
     end # --- ok

    #if input == "Action"
    #  list_action
    #elsif input == "Comedy"
    #  list_comedy
    #elsif input == "Documentary"
    #  list_documentary
    #elsif input == "Drama"
    #  list_drama
    #elsif input == "Horror"
    #  list_horror
    #elsif input == "Family"
    #  list_family
    #elsif input == "Mystery"
    #  list_mystery
    #elsif input == "Romance"
    #  list_romance
    #elsif input == "Fantasy"
    #  list_science_fiction
    #else
    #puts "Now now, that's not a genre we mentioned."
    #input = gets.strip
    #if input == "Action"
    #  list_action
    #elsif input == "Comedy"
    #  list_comedy
    #elsif input == "Documentary"
    #  list_documentary
    #elsif input == "Drama"
    #  list_drama
    #elsif input == "Horror"
    #  list_horror
    #elsif input == "Family"
    #  list_family
    #elsif input == "Mystery"
    #  list_mystery
    #elsif input == "Romance"
    #  list_romance
    #elsif input == "Fantasy"
    #  list_science_fiction
    #else
    #  puts "We can wait here all day until you pick a real genre"
    #  puts "... That we carry."
    #  puts "Here goes the list again: Action, Comedy, Documentary, Drama, Horror, Family, Mystery, Romance and Fantasy"
    #  input = gets.strip
    #end
  #end
  # @@genre = input
  # i want to translate this input to a variable genre i can use across the board
  #end
#end

  def select_movie
    puts "Which movie interests you?"
    puts "Type me the name and I'll tell you about it"
    puts "But no typos or this won't work"
    input = gets.strip
    @movie = input
    Genre.print_genre_list_of_movies. detect do |title| if title.name == @movie
      Scraper.scrape_description(movie)
    end
    else
      puts "That's not in our list"
    end
    find
  end

  def find
    puts "You can search here too"
    puts "Here's what you can do:"
    puts "Say 'Find by name' or 'Find by rating'"
    input = gets.strip
    if input == "Find by name"
      puts "Great, what name?"
      input = gets.strip
      Genre.find_by_name(input)
    elsif input == "Find by rating"
      puts "OK, which rating?"
      input = gets.strip
      Genre.find_by_rating(input)
    else
      puts "That wasn't an option, but here's what else we can do"
    end
    randomize
  end

  def randomize
    puts "We can select one movie for you, if you like"
    puts "Just say 'OK'"
    input = gets.strip
    if input == "OK"
      Genre.random
    else
      puts "Or we can Exit or Restart?"
      input = gets.strip
      if input == "Exit"
        exit
      else input == "Restart"
        start
      end
    end
  end




  end
