
class MovieFinder::Genre
  attr_accessor :name #---the variable we need from outside the class, from the CLI

  def initialize(name = nil)
    @name = name
    @@list = []
  end

  def self.print_genre_list_of_movies
   @@list << MovieFinder::Scraper.scrape_movie_index
   @@list.collect {|title| title.gsub("/m/", "").capitalize}
   @@list
 end

  def self.find_by_name(name)
    @@list.find_all { |n| n.name.downcase == name.downcase }
  end

  def self.random
    random_movie = @@list[rand(list.length)]
    random_movie
  end

end
