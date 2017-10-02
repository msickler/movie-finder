require "movie/finder/version"
#this is after getting an input in which genre to find from. need to make a cli class
class Finder
  attr_accessor :name, :year, :rating, :description
  @@all = []

  def initialize(name = nil, year = nil, rating = nil, description = nil)
    @name = name
    @year = year
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

  def self.find_by_year(year)
    #users can seach by year
    self.all.find_all{ |n| n.year == year  }
  end

  def self.find_by_rating(rating)
    #users can search by rating
    self.all.find_all { |n| n.rating == rating  }
  end

  def self.random
    #users can ask for a random name in a selected genre
  end

  def self.find_by_year_and_rating(year, rating)
    self.all.where(year: year, rating: rating)
    #this would be really cool if i make it work
  end


end
