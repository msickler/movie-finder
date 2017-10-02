class Genre
  attr_accessor :name, :rating, :genre


  def print_genre_list
   list = Scraper.get_page_by_genre.css("a .unstyled-articleLink")
   list.collect {|title| title.gsub("/m/", "").capitalize}
   list
 end






end
