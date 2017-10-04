
class Genre
  attr_accessor :name, :rating
  @@list = []
  @@rating_list = []


  def print_genre_list_of_movies
   @@list << Scraper.scrape_movie_index
   @@list.collect {|title| title.gsub("/m/", "").capitalize}
   @@list
 end

 def print_list_by_rating
   @@rating_list << Scraper.scrape_rating
   @@rating_list.sort.reverse
 end

  def self.find_by_name(name)
    @@list.find_all { |n| n.name == name }
  end

  def self.find_by_rating(rating)
    @@rating_list.find_all { |n| n.rating == rating  }
  end

  def self.random
    random_movie = @@list[rand(list.length)]
    random_movie
  end

end
