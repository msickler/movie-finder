class Cli

  #Hello! This is what I have so far in my project...
  #I'm making an app where you can look for movies, if you have nothing to watch or no ideas
  #You look them by genre and depending on the genre is the scraping and well, the options
  #it's mainly about listing movie options from rottentomatoes top 100 by genre
  #but we can sort them by rating too and they can ask about a movie and receive the description from rottentomatoes website here
  #we can also provide the user with a random option depending on the genre they choose
  #i thought it would be fun and useful, since i could make use of something like that myself for my own movie watching nights ...
  #anyway this is what i have

  def initialize(genre = nil)
    @@genre
  end

  def call
    puts "Welcome to Movie Finder, where we help you out when you run out of ideas on what to watch"
    start
  end

  def start
    #we want to lighten the mood. i might need to make an until loop here... not yet though
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
    puts "Science Fiction, because Harry Potter"
    input = gets.strip
    if input == "Action"
      list_action
    elsif input == "Comedy"
      list_comedy
    elsif input == "Documentary"
      list_documentary
    elsif input == "Drama"
      list_drama
    elsif input == "Horror"
      list_horror
    elsif input == "Family"
      list_family
    elsif input == "Mystery"
      list_mystery
    elsif input == "Romance"
      list_romance
    elsif input == "Science Fiction"
      list_science_fiction
    else
    puts "Now now, that's not a genre we mentioned."
    input = gets.strip
    if input == "Action"
      list_action
    elsif input == "Comedy"
      list_comedy
    elsif input == "Documentary"
      list_documentary
    elsif input == "Drama"
      list_drama
    elsif input == "Horror"
      list_horror
    elsif input == "Family"
      list_family
    elsif input == "Mystery"
      list_mystery
    elsif input == "Romance"
      list_romance
    elsif input == "Science Fiction"
      list_science_fiction
    else
      puts "We can wait here all day until you pick a real genre"
      puts "... That we carry."
      puts "Here goes the list again: Action, Comedy, Documentary, Drama, Horror, Family, Mystery, Romance and Science Fiction"
      input = gets.strip
    end
  end
  @@genre = input
  # i want to translate this input to a variable genre i can use across the board
  loop do #i want these methods to be able to run in line like this if user doesnt say anything else
    select_movie
    find
    randomize
  end
end


  def select_movie
    puts "Which movie interests you?"
    puts "Type me the name and I'll you about it"
    puts "But no typos or this won't work"
    input = gets.strip
    @movie = input
    Scraper.scrape_movie_index.detect do |title| title.name == @movie
      return @movie.description
    else
      puts "Try me again"
    end
    end
    self.select_movie
  end

  def find
    puts "You can search here too"
    puts "Here's what you can do:"
    puts "Say 'Find by name' or 'Find by rating'"
    input = gets.strip
    if input == "Find by name"
      Finder.find_by_name(input)
    elsif input == "Find by rating"
      Finder.find_by_rating(input)
    else
      puts "Say 'Find by name' or 'Find by rating'"
    end
  end

  def randomize
    puts "We can select for you, if you like"
    puts "Just say 'OK'"
    input = gets.strip
    if input == "OK"
      Finder.random(genre)
    else
      puts "Exit or Restart?"
      input = gets.strip
      if input == "Exit"
        exit
      else input == "Restart"
        start
      end
    end
  end




  end


end
