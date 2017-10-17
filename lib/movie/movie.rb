require 'pry'
class Movie
    attr_accessor :title, :rating, :link, :synopsis, :scraper, :genre
    @@all = []

    def initialize(movie_hash)
      movie_hash.each {|key, value| self.send("#{key}=", value)}
      self
      @@all << self
    end

    def self.create_from_collection(movies_array)
      movies_array.each {|movie| Movie.new(movie)}
    end

    def self.all
      @@all
    end

    def self.find_by_title(title)
      selected = self.all.detect do |movie|
        movie.title.downcase.strip == title.downcase.strip ||
        movie.title.split(' ')[0...-1].join(' ').downcase == title.downcase.strip
    end
    selected.link
  end

    #def self.find_movie(title)
    #  selected = @@all.detect { |movie| movie[:title].downcase == title.downcase }
    #  selected
    #end

    #def self.find_synopsis(title)
    #  @@all.detect do |movie| if movie[:title].downcase == title.downcase
    #    Scraper.scrape_synopsis(movie[:link])
    #    else
    #     nil
    #   end
     #end
    #end

    def self.random
      random_movie = self.all.sample #[rand(self.all.length)]
      random_movie.title
    end

    def self.find_by_name(title)
      @@all.find_all { |movie| movie[:title].downcase == title.downcase }
    end


end
