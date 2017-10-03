class Genre
  attr_accessor :name, :rating, :genre


  def print_genre_list(genre)
   list = Scraper.get_page_by_genre.css("a .unstyled-articleLink")
   list.collect {|title| title.gsub("/m/", "").capitalize}
   list
 end

 def print_list_by_rating(rating)
   @rating = Scraper.rating
   @rating.sort.reverse
   #should sort by descending order

 end






end
