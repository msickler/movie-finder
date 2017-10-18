require_relative '../movie/scraper.rb'
require_relative '../movie/movie.rb'
require 'nokogiri'
require 'pry'
require 'colorize'

class Cli

    def call
      puts "Welcome to Movie Finder,".colorize(:light_blue) + " we help you out when you run out of ideas on what to watch"
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
      puts "Action".colorize(:light_blue) + ", of course"
      puts "Comedy".colorize(:light_blue) + ", obviously"
      puts "Documentary".colorize(:light_blue) + ", for the intellectuals"
      puts "Drama".colorize(:light_blue) + ", but it could be boring"
      puts "Horror".colorize(:light_blue) + ", if you like"
      puts "Family".colorize(:light_blue) + ", if you must"
      puts "Mystery".colorize(:light_blue) + ", our favorite"
      puts "Romance".colorize(:light_blue) + ", to really set the mood"
      puts "Fantasy".colorize(:light_blue) + ", because Harry Potter, Mordor and Jedis"
      input = gets.strip.downcase
      @genre = input
      if @genre == "action" || @genre ==  "comedy" ||  @genre ==  "documentary" ||  @genre ==  "drama" ||  @genre ==  "horror" ||  @genre == "family" ||  @genre ==  "mystery" ||  @genre ==  "romance" ||  @genre == "fantasy"
        @doc = Scraper.get_page_by_genre(@genre)
        make_movies
       else
         puts "Now now, that's not a genre we mentioned."
         puts "Enter genre:".colorize(:background => :red)
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
        puts "#{movie.title.upcase}".colorize(:red).underline
        puts "Rating:".colorize(:light_blue) + " #{movie.rating}"
        puts "Link:".colorize(:light_blue) + " #{movie.link}"
        puts "                        ".underline
      end
    end

    def select_movie
      puts "Which movie interests you?".colorize(:blue).underline
      puts "Type me the name and I'll find you its synopsis"
      puts "But no typos or this won't work"
      input = gets.strip.downcase
      @title = input
      movie = Movie.find_by_title(@title)
      if movie != nil
        Scraper.scrape_synopsis(movie)
        puts "                                              ".colorize(:blue).underline
        puts "Synopsis:".colorize(:red) + " #{Scraper.scrape_synopsis(movie)} "
        puts "                                              ".colorize(:blue).underline
      else
        puts "That's not in our list".colorize(:red)
      end
    end

    def find
      puts "You can search titles by words too"
      puts "Say 'Find'".colorize(:blue)
      input = gets.strip
      if input == "Find" || input == "find"
        puts "Great, what word?"
        input = gets.strip.downcase
        @word = input
        titles = Movie.find_all_by_title(@word)
        puts "This is what we found:".colorize(:red) + " #{titles}"
        puts "                                         ".underline
    end

    def randomize
      puts "We can select one movie for you, if you like"
      puts "Just say 'OK'".colorize(:blue)
      input = gets.strip
      if input == "OK" || input == "ok" || input == "Ok"
        random_movie = Movie.random
        puts "Our computers have decided you should watch..."
        puts "                    //// drum-roll ////                       ".colorize(:blue).underline
        puts "#{random_movie.upcase}".colorize(:red).underline
        puts "                                                               ".underline
      end
      else
        puts "Now, we can Exit or Restart"
        input = gets.strip.downcase
        if input == "exit"
          puts "Hasta la vista Baby".colorize(:red)
          exit
        else input == "restart"
          puts "Restarting the matrix..........".colorize(:blue).underline
          call
        end
      end
    end

end
