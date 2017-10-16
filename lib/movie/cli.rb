require_relative '../movie/scraper.rb'
require_relative '../movie/movie.rb'
require 'nokogiri'

class Cli

    def call
      puts "Welcome to Movie Finder, where we help you out when you run out of ideas on what to watch"
      start
      make_movies
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
       if @genre == "action" || @genre ==  "comedy" ||  @genre ==  "documentary" ||  @genre ==  "drama" ||  @genre ==  "horror" ||  @genre == "family" ||  @genre ==  "mystery" ||  @genre ==  "romance" ||  @genre == "fantasy"
        @doc = Scraper.get_page_by_genre(@genre)
        make_movies
       else
         puts "Now now, that's not a genre we mentioned."
         puts "Enter genre:"
         input = gets.strip.downcase
         @genre = input
      end
      if @genre == "action" || @genre ==  "comedy" ||  @genre ==  "documentary" ||  @genre ==  "drama" ||  @genre ==  "horror" ||  @genre == "family" ||  @genre ==  "mystery" ||  @genre ==  "romance" ||  @genre == "fantasy"
          Scraper.get_page_by_genre(@genre)
          make_movies
        else
          call
        end
    end

    def make_movies
      movies_array = Scraper.new_movie_list(@doc)
      Movie.create_from_collection(movies_array)
    end

    def select_movie
      puts "Which movie interests you?"
      puts "Type me the name and I'll find you its synopsis"
      puts "But no typos or this won't work"
      input = gets.strip.downcase
      @title = input
      if Movie.find_synopsis(@title) != nil
        Movie.find_synopsis(@title)
      else
        puts "That's not in our list"
      end
     find
    end

    def find
      puts "You can search titles here too"
      puts "Say 'Find by name'"
      input = gets.strip
      if input == "Find by name"
        puts "Great, what name?"
        input = gets.strip.downcase
        @title = input
        Movie.find_by_name(@title)
      else
        randomize
      end
    end

    def randomize
      puts "We can select one movie for you, if you like"
      puts "Just say 'OK'"
      input = gets.strip
      if input == "OK"
        Movie.random
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
