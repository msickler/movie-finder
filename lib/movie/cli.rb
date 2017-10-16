require_relative './scraper.rb'
require_relative './movie.rb'

module  MovieFinder
  class Cli
    attr_accessor :scraper, :movie

    def call
      puts "Welcome to Movie Finder, where we help you out when you run out of ideas on what to watch"
      start
    end

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
      input = gets.strip.downcase
      @genre = input
       if @genre == "action" || input ==  "Comedy" || input ==  "Documentary" || input ==  "Drama" || input ==  "Horror" || input == "Family" || input ==  "Mystery" || input ==  "Romance" || input == "Fantasy"
        MovieFinder::Movie.list_all
        select_movie
       else
         puts "Now now, that's not a genre we mentioned."
         puts "Enter genre:"
         input = gets.strip.downcase
         @genre = input
      end
          if input == "action" || input ==  "Comedy" || input ==  "Documentary" || input ==  "Drama" || input ==  "Horror" || input == "Family" || input ==  "Mystery" || input ==  "Romance" || input == "Fantasy"
            MovieFinder::Movie.all
            select_movie
          else
             call
          end
    end

    def select_movie
      puts "Which movie interests you?"
      puts "Type me the name and I'll tell you about it"
      puts "But no typos or this won't work"
      input = gets.strip.downcase
      @movie = input
      if MovieFinder::Movie.find_synopsis(movie) != nil
        MovieFinder::Movie.find_synopsis(movie)
      else
        puts "That's not in our list"
      end
     find
    end

    def find
      puts "You can search here too"
      puts "Say 'Find by name'"
      input = gets.strip
      if input == "Find by name"
        puts "Great, what name?"
        input = gets.strip.downcase
        MovieFinder::Movie.find_by_name(input)
      else
        randomize
      end
    end

    def randomize
      puts "We can select one movie for you, if you like"
      puts "Just say 'OK'"
      input = gets.strip
      if input == "OK"
        MovieFinder::Movie.random
      else
        puts "Or we can Exit or Restart?"
        input = gets.strip.downcase
        if input == "exit"
          exit
        else input == "restart"
          start
        end
      end
    end

  end
end
