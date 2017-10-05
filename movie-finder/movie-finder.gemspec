# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "movie/version"

Gem::Specification.new do |spec|
  spec.name          = "movie-finder"
  spec.version       = MovieFinder::VERSION
  spec.authors       = ["'M Sickler'"]
  spec.email         = ["'marianal_93@hotmail.com'"]
  spec.files         = ["lib/movie/cli.rb", "lib/movie/genre.rb", "lib/movie/scraper.rb", "config/environment.rb"]

  spec.summary       = %q{TODO: Write a short summary, because Rubygems requires one.}
  spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/msickler/movie-finder.git"
  s.executables  <<  'movie-finder'

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", ">= 0"
  s.add_development_dependency "nokogiri", ">= 0"
  s.add_development_dependency "pry", ">= 0"
end
