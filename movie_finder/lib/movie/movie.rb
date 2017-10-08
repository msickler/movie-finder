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
      self.all.each do |movie|
        puts "#{movie.title} - #{movie.rating}"
      end
    end

     def self.synopsis

     end

     def self.random
       random_movie = self.all.sample
       random_movie
     end

   end
 end
