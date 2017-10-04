
# --- ok will mark what i believe is done

class Cli

  def initialize(genre = nil, movie = nil)
    @genre = genre
    @movie = movie
    @@list = []
  end
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
    @genre = input
     if input == "Action" || input ==  "Comedy" || input ==  "Documentary" || input ==  "Drama" || input ==  "Horror" || input == "Family" || input ==  "Mystery" || input ==  "Romance" || input == "Fantasy"
        @@list = Genre.print_genre_list_of_movies(input)
# ------->  how to make it so Genre.print_genre_list_of_movies takes CLI @genre
       else
       puts "Now now, that's not a genre we mentioned."
       puts "Enter genre:"
       input = gets.strip
     end
       @genre = input
        if input == "Action" || input ==  "Comedy" || input ==  "Documentary" || input ==  "Drama" || input ==  "Horror" || input == "Family" || input ==  "Mystery" || input ==  "Romance" || input == "Fantasy"
           @@list = Genre.print_genre_list_of_movies(input)
        else
           call
        end
     end # --- ok

  # --- ok unless call to Scraper.scrape_description(input) doesn't work
  def select_movie
    puts "Which movie interests you?"
    puts "Type me the name and I'll tell you about it"
    puts "But no typos or this won't work"
    input = gets.strip
    @movie = input
    @@list.detect do |title| if title.name == input
      Scraper.scrape_description(input)
      else
      puts "That's not in our list"
    end
  end
    find
  end # --- ok

  # --- ok unless Genre.find_by_name cant work with the input as variable
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
      randomize
    end
  end # --- ok

  # --- ok
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
  end # --- ok




  end
