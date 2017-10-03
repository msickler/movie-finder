require "movie/finder/version"

class Genre
  attr_accessor :name, :rating
  @@list = []
  @@rating_list = []


  def print_genre_list_of_movies
   @@list << Scraper.get_page_by_genre.css("a .unstyled-articleLink")
   @@list.collect {|title| title.gsub("/m/", "").capitalize}
   @@list
 end

 def print_list_by_rating(rating)
   @@rating_list << Scraper.rating
   @@rating_list.sort.reverse
   #should sort by descending order
   #Scraper.rating is already [], so do I have to make new one or does this keep an []?
 end

  def self.find_by_name(name)
    @@list.find_all { |n| n.name == name }
    #users can search by name
    #only searching in an already given genre
  end

    def self.find_by_rating(rating)
      @@rating_list.find_all { |n| n.rating == rating  }
    #users can search by rating
  end

  def self.random
    #users can ask for a random name in a selected genre
      random_movie = @@list[rand(list.length)]
      random_movie
  end





end
