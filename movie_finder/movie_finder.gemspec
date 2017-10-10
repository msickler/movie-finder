# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'movie/version'

Gem::Specification.new do |spec|
  spec.authors       = ["M Sickler"]
  spec.email         = ["gasaiischocolatefactory@gmail.com"]
  spec.description   = %q{Movie finder}
  spec.summary       = %q{Movie finder}
  spec.homepage      = "https://github.com/msickler/movie-finder"

  spec.files         = `git ls-files`.split($\)
  spec.executables   = ["movie-finder"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.name          = "movie_finder"
  spec.require_paths = ["lib", "lib/movie"]
  spec.version       = MovieFinder::VERSION
  spec.license       = "MIT"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
