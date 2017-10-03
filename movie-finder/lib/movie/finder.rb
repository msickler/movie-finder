require "movie/finder/version"
#this is after getting an input in which genre to find from. need to make a cli class
class Finder
  attr_accessor :name, :rating, :genre
  @@all = []

  def initialize(name = nil, rating = nil)
    @name = name
    @rating = rating
    @@all << self
  end

  def self.find_by_name(name)
    list = Genre.print_genre_list
    list.find_all { |n| n.name == name }
    #users can search by name
    #only searching in an already given genre
  end

    def self.find_by_rating(rating)
      list = Genre.print_list_by_rating
      list.find_all { |n| n.rating == rating  }
    #users can search by rating
  end

  def self.random(genre)
    #users can ask for a random name in a selected genre
      list = []
      titles = Genre.print_genre_list(genre)
      list << titles
      random_movie = list[rand(list.length)]
      random_movie
  end



end
