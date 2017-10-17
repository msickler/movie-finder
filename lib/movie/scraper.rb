require 'pry'

class Scraper
    attr_accessor :genre, :movie, :doc, :link
    BASE_URL = 'https://www.rottentomatoes.com'

    def initialize(genre= nil, movie= nil)
      @genre = genre
      @movie = movie
      @doc = doc
      @link = link
    end

    def self.get_page_by_genre(genre)
      if @genre == "action"
        @doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/top_100_action__adventure_movies/"))
      elsif genre == "comedy"
        @doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/top_100_comedy_movies/"))
      elsif genre == "documentary"
          @doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/top_100_documentary_movies/"))
      elsif genre == "drama"
          @doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/top_100_drama_movies/"))
      elsif genre == "horror"
          @doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/top_100_horror_movies/"))
      elsif genre == "family"
        @doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/top_100_kids__family_movies/"))
      elsif genre == "mystery"
        @doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/top_100_mystery__suspense_movies/"))
      elsif genre == "romance"
        @doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/top_100_romance_movies/"))
      else genre == "fantasy"
        @doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/top_100_science_fiction__fantasy_movies/"))
      end
      @doc
    end

    def self.new_movie_list(doc)
      #self.get_page_by_genre(doc).css(".table tr").drop(1).each do |row|
        movies = []
        movies_hash = {}
        movie = @doc.css(".table tr").drop(1).each do |row|

          movies_hash = {
            :title => row.css(".unstyled").text,
            :rating => row.css(".tMeterScore").text.gsub("%", ""),
            :link => row.css(".unstyled").attribute('href').value
          }
          movies << movies_hash
        #movie.rating = row.css(".tMeterScore").text.gsub("%", "")
        #movie.title = row.css("a.unstyled-articleLink").text
        #movie.link = row.css("a.unstyled-articleLink").attribute("href").value#.sub("/", "")
      end
      movies
    end
      #self.get_page_by_genre.css(".table tr").drop(1).each do |row|


    def self.scrape_synopsis(link)
      #link = 'https://www.rottentomatoes.com/' + movie[:link]
      link_1 = BASE_URL + link
      page = Nokogiri::HTML(open(link_1))
      synopsis = page.css(".movie_synopsis").text.strip
      synopsis
    end


end
