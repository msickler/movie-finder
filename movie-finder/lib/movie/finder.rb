require "movie/finder/version"
#this is after getting an input in which genre to find from. need to make a cli class
class Finder
  attr_accessor :name, :rating, :description
  @@all = []

  def initialize(name = nil, rating = nil, description = nil)
    @name = name
    @rating = rating
    @description = description
    @@all << self
  end

  def self.all
    @@all
    #user can see the full list of a genre
    #also, it's helpful for us to have
  end

  def self.find_by_name(name)
    #users can search by name
    #only searching in an already given genre
    self.all.find_all { |n| n.name == name  }
  end

    def self.find_by_rating(rating)
    #users can search by rating
    self.all.find_all { |n| n.rating == rating  }
  end

  def self.random(genre)
    #users can ask for a random name in a selected genre
      list = []
      titles = Scraper.get_page_by_genre.css("a .unstyled-articleLink").text
      list << titles
      random_movie = list[rand(list.length)]
      random_movie
  end



end
