
class MovieFinder::Scraper
  attr_accessor :genre, :movie

  def initialize(genre= nil, movie= nil)
    @genre = MovieFinder::Cli.genre # or Cli.start.genre (where the genre var is born)
    @movie = MovieFinder::Cli.movie #or Cli.select_movie.movie (where the movie var is born)
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
  def scrape_movie_index(genre)
    # TODO instantiate movie with title and link by iterating on your scraped data and instantiating and saving a movie with the title and link
    self.get_page_by_genre(genre).css("a .unstyled-articleLink").text

    # TODO return array of movie objects
  end # --- ok

  # --- how to select the movie and access that movie link
  def scrape_description(movie)
    # REFERENCE :exhibit_link => "http://moma.org#{exhibit.css("a.calendar-tile__link").attribute("href").value}"
    # ALTERNATIVE movie_link = self.get_page_by_genre.css("a .unstyled-articleLink").attribute("href").value
    # ALTERNATIVE url = self.get_page_by_genre.css.search("a.unstyled-articleLink").first.attr("href").strip
    #get_movie = self.scrape_movie_index.find { |title| title.name.downcase == movie.downcase  }

    # TODO remove if statement and pass in link correctly for your scraping
    if get_movie != nil
      movie_link = "http://rottentomatoes.com#{get_movie.attribute("href").value}"
      movie_link = "http://rottentomatoes.com#{self.get_page_by_genre.search("a.unstyled-articleLink").attribute("href").value}"
      description_in = Nokogiri::HTML(open(movie_link))
      description = description_in.css("#movieSynopsis .movie_synopsis clamp clamp-6").text
      description
   else
     nil
   end
  end


end
