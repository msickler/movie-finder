require_relative '../movie/scraper.rb'
require_relative '../movie/movie.rb'
require 'nokogiri'
require 'pry'

class Cli

    def call
      puts "Welcome to Movie Finder, where we help you out when you run out of ideas on what to watch"
      start
      make_movies
      display_movies
      select_movie
      find
      randomize
    end

    def start
      puts "What kind of mood (ahem, genre) are you looking for?"
      puts "We got all the main ones"
      puts "You name it..."
      puts "Actually, let me list you our list of genres"
      puts "Action, of course"
      puts "Comedy, obviously"
      puts "Documentary, for the intellectuals"
      puts "Drama, but it could be boring"
      puts "Horror, if you like"
      puts "Family, if you must"
      puts "Mystery, our favorite"
      puts "Romance, to really set the mood"
      puts "Fantasy, because Harry Potter, Mordor and Jedis"
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
          @doc = Scraper.get_page_by_genre(@genre)
          make_movies
        else
          call
        end
      end

    def make_movies
      movies_array = Scraper.new_movie_list(@doc)
      Movie.create_from_collection(movies_array)
    end

    def display_movies
      Movie.all.each do |movie|
        puts "#{movie.title.upcase}"
        puts "Rating: #{movie.rating}"
        puts "Link: #{movie.link}"
        puts "------------------------"
      end
    end

    def select_movie
      puts "Which movie interests you?"
      puts "Type me the name and I'll find you its synopsis"
      puts "But no typos or this won't work"
      input = gets.strip.downcase
      @title = input
      movie = Movie.find_by_title(@title)
      if movie != nil
        Scraper.scrape_synopsis(movie)
        puts "---------------------------------------------"
        puts "Synopsis: #{Scraper.scrape_synopsis(movie)} "
        puts "---------------------------------------------"
      else
        puts "That's not in our list"
      end
    end

    def find
      puts "You can search titles by words too"
      puts "Say 'Find'"
      input = gets.strip
      if input == "Find" || input == "find"
        puts "Great, what word?"
        input = gets.strip.downcase
        @title = input
        titles = Movie.find_all_by_title(@title)
        puts "Found: #{titles}"
        puts "---------------------------------------------"
      end
    end

    def randomize
      puts "We can select one movie for you, if you like"
      puts "Just say 'OK'"
      input = gets.strip
      if input == "OK" || input == "ok" || input == "Ok"
        random_movie = Movie.random
        puts "Our computers have decided you should watch..."
        puts "------------------ //// drum-roll //// ------------------"
        puts "#{random_movie.upcase}"
        puts "--------------------------------------------------------------"
      else
        puts "Or we can Exit or Restart?"
        input = gets.strip.downcase
        if input == "exit"
          puts "Hasta la vista Baby"
          exit
        else input == "restart"
          puts "Restarting the matrix"
          start
        end
      end
    end

end
