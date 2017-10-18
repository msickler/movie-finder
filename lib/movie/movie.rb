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
      if selected != nil
        selected.link
      else
        nil
      end
    end

    def self.find_all_by_title(word)
      found = @@all.find_all { |movie| movie.title.downcase.include?(word)}
        found.to_s.scan(/([A-Z][\w-]*(\s+[A-Z][\w-]*)+)/).map{|i| i.first}
    end

    def self.random
      random_movie = self.all.sample
      random_movie.title
    end

end
