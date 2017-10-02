class MovieFinder::Scraper

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
    rating = self.get_page_by_genre.css(".tMeterScore").gsub("%", "").text
  end

  def scrape_description
    description = self.get_page_by_genre
    #how do we get a description of a selected movie that is in a separate page. How do we link all this?
    #list of genres - genre - list of movies - movie - description. o m g we haven't done this
  end


end
