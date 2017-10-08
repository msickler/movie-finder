module MovieFinder
  class Scraper
    attr_accessor :genre, :title
    BASE_URL = 'https://www.rottentomatoes.com/'

      def initialize(genre= nil, title= nil)
        @gnere = genre
        @title = title
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
