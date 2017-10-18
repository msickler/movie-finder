# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
  => The CLI constantly depends on the user input. It wants to know what genre the user wants, what movie the user wants to know about? Does the user want it to provide a random selection? And the CLI calls on the Scraper and the Genre class to get the lists of movies and find what the user wants.
- [x] Pull data from an external source
  => The Scraper takes care of this. For each genre it pulls data from its specific page and for each selected movie (if any) it pulls data from that specific movies page. It makes a list of movies by name with rating and link and it can find a specific movie synopsis.  
- [x] Implement both list and detail views
  => The application is a combination of list and detail views itself. List of genres, list of movies by genre, which include the rating and link as details, list of matches of movie titles. The detail views are more about the movie synonpsis, if they pick a movie, the application access that movie's page and returns the description.
