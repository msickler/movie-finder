require 'nokogiri'

class Scraper
  attr_accessor :genre, :movie

  def initialize(genre= nil, movie= nil)
    @genre = Cli.genre # or Cli.start.genre (where the genre var is born)
    @movie = Cli.movie #or Cli.select_movie.movie (where the movie var is born)
  end

  # --- ok if ini variables work
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
  end # --- ok

  # --- ok
  def scrape_movie_index
    self.get_page_by_genre.css("a .unstyled-articleLink").text
  end # --- ok

  # --- ok
  def scrape_rating
    self.get_page_by_genre.css(".tMeterScore").gsub("%", "").text
  end # --- ok

  # --- how to get a link path and send nokogiri to it abstractly
  def scrape_description(movie)
    @movie_link = self.get_page_by_genre.css("a .unstyled-articleLink").attribute("href").value
    description_in = Nokogiri::HTML(open(self.movie_link))
    description = self.description_in.css("#movieSynopsis .movie_synopsis clamp clamp-6").text
    description
  end


end
