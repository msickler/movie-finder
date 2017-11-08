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
      @doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/top_100_#{genre}_movies/"))
    end

    def self.new_movie_list(doc)
      movies = []
      movies_hash = {}
      movie = @doc.css(".table tr").drop(1).each do |row|
        movies_hash = {
          :title => row.css(".unstyled").text.strip,
          :rating => row.css(".tMeterScore").text.gsub("%", ""),
          :link => row.css(".unstyled").attribute('href').value
        }
        movies << movies_hash
      end
      movies
    end

    def self.scrape_synopsis(link)
      link_1 = BASE_URL + link
      page = Nokogiri::HTML(open(link_1))
      synopsis = page.css(".movie_synopsis").text.strip
      synopsis
    end

end
