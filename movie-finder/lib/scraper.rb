class Scraper
  attr_reader :genre, :movie

  def initialize(genre, movie)
    @genre = Cli.genre
    @movie = Cli.select_movie
    #does this get the genre(=input) from CLI?
  end

  #def genres_list
  #Top 100 Action
  #Top 100 Comedy Movies
  #Top 100 Documentary Movies
  #Top 100 Drama Movies
  #Top 100 Horror Movies
  #Top 100 Family Movies
  #Top 100 Mystery
  #Top 100 Romance Movies
  #Top 100 Science Fiction
  #end

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
    else genre == "Science Fiction"
      Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/top_100_science_fiction__fantasy_movies/"))
  end
end

  def scrape_movie_index
    self.get_page_by_genre.css("a .unstyled-articleLink").text
  end

  def scrape_rating
    @rating = []
    self.get_page_by_genre.css(".tMeterScore").gsub("%", "").text
    @rating << self
    @rating
  end

  def scrape_description(movie)
    @movie = Cli.select_movie
    @link = self.get_page_by_genre.css("a .unstyled-articleLink").attribute("href").value
    description_in = Nokogiri::HTML(open(self.link))
    description = self.description_in.css("#movieSynopsis .movie_synopsis clamp clamp-6").text
    return description
    #does @movie take the movie (input) from cli
    #how to select the specific link value from the movie to then send nokogiri there?
    #list of genres - genre - list of movies - movie - description.

  end


end
