class MovieFinder::CLI

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
end



end
