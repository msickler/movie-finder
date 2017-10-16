class Scraper
    attr_accessor :genre, :movie, :doc
    BASE_URL = 'https://www.rottentomatoes.com/'

    def initialize(genre= nil, movie= nil)
      @genre = genre
      @movie = movie
      @doc = doc
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
        movie = @doc.css(".table tr").each do |row|
          movies_hash = {
            :title => row.css("a.unstyled-articleLink").text,
            :rating => row.css(".tMeterScore").text.gsub("%", ""),
            :link => row.css("a.unstyled-articleLink").attribute("href").value
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
      link = BASE_URL + movie[:link]
      page = Nokogiri::HTML(open(link))
      movie.synopsis = page.css("#movieSynopsis .movie_synopsis clamp clamp-6").text
      movie.synopsis
    end


end
