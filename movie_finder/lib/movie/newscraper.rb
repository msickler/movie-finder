module MovieFinder
  class Scraper
    attr_accessor :genre, :movie
    BASE_URL = 'https://www.rottentomatoes.com/'

      def initialize(genre= nil, movie= nil)
        @gnere = genre
        @movie = movie
      end

      def get_page_by_genre(genre)
        if genre == "Action"
          Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/top_100_action__adventure_movies/"))
        elsif genre == "Comedy"
          Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/top_100_comedy_movies/"))
        elsif genre == "Documentary"
            Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/top_100_documentary_movies/"))
        elsif genre == "Drama"
            Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/top_100_drama_movies/"))
        elsif genre == "Horror"
            Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/top_100_horror_movies/"))
        elsif genre == "Family"
          Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/top_100_kids__family_movies/"))
        elsif genre == "Mystery"
          Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/top_100_mystery__suspense_movies/"))
        elsif genre == "Romance"
          Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/top_100_romance_movies/"))
        else genre == "Fantasy"
          Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/top_100_science_fiction__fantasy_movies/"))
        end
      end

      def get_movie_with_attributes
          self.get_page_by_genre.css(".table tr").drop(1).each do |row|
            movie = MovieFinder::Movie.new
            movie.rating = row.css(".tMeterScore").text.gsub!(/\u00A0/, "")
            movie.title = row.css("a.unstyled-articleLink").text
            movie.link = row.css("a.unstyled-articleLink").attribute("href").value.sub("/", "")
          end
          MovieFinder::Movie.all
        end

    def get_synopsis(movie)
        link = BASE_URL + movie.link
        synopsis_in = Nokogiri::HTML(open(link))
        movie.synopsis = synopsis_in.css("#movieSynopsis .movie_synopsis clamp clamp-6").text
    end
end
end