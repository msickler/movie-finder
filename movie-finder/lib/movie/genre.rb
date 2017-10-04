
class MovieFinder::Genre
  attr_accessor :name, :rating #---the 2 variables we need from outside the class, from the CLI

  def initialize(name = nil, rating = nil)
    @name = name
    @rating = rating
    @@list = []
    @@rating_list = []
  end


  def print_genre_list_of_movies
   @@list << MovieFinder::Scraper.scrape_movie_index
   @@list.collect {|title| title.gsub("/m/", "").capitalize}
   @@list
 end

 def print_list_by_rating
   @@rating_list << MovieFinder::Scraper.scrape_rating
   @@rating_list.sort.reverse
 end

  def self.find_by_name(name)
    @@list.find_all { |n| n.name.downcase == name.downcase }
  end

  def self.find_by_rating(rating)
    @@rating_list.find_all { |n| n.rating == rating  }
  end

  def self.random
    random_movie = @@list[rand(list.length)]
    random_movie
  end

end
