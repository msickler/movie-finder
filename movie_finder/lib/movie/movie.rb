module MovieFinder
  class Movie
    attr_accessor :title, :rating, :synopsis
    @@all = []

    def initialize(title, rating, synopsis)
      @title = title
      @rating = rating
      @synopsis = synopsis
      @@all << self
    end

    def self.all
      @@all
    end

    def self.list_all
      @@all.each do |movie|
        puts "#{movie.title.capitalize} - #{movie.rating}"
      end
    end

    def self.find_synopsis(title)
      @@all.detect do |t| if t.title.downcase == title.downcase
        MovieFinder::Scraper.get_synopsis(movie)
        else
         nil
       end
     end
    end

    def self.random
      random_movie = self.all.sample
      random_movie
    end

    def self.find_by_name(title)
      @@all.find_all { |n| n.title.downcase == title.downcase }
    end

  end
end
