module MovieFinder
  class Cli

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
      input = gets.strip
      @genre = input
       if input == "Action" || input ==  "Comedy" || input ==  "Documentary" || input ==  "Drama" || input ==  "Horror" || input == "Family" || input ==  "Mystery" || input ==  "Romance" || input == "Fantasy"
        MovieFinder::Movie.list_all
        select_movie
       else
         puts "Now now, that's not a genre we mentioned."
         puts "Enter genre:"
         input = gets.strip
         @genre = input
      end
          if input == "Action" || input ==  "Comedy" || input ==  "Documentary" || input ==  "Drama" || input ==  "Horror" || input == "Family" || input ==  "Mystery" || input ==  "Romance" || input == "Fantasy"
            MovieFinder::Movie.list_all
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
            @@list.detect do |title| if title.name.downcase == @movie
        # TODO pass in
        MovieFinder::Scraper.scrape_description(@movie)
        else
        puts "That's not in our list"
        end
      end
      find
    end


  end
end
