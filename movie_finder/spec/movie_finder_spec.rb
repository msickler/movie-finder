require 'spec_helper'

RSpec.describe MovieFinder::Movie do
  before :each do
    @movie = Movie.new :title, :rating
  end
   describe "#new" do
     it "returns a new movie object" do
       @movie.should be_an_instance_of Movie
     end
   end

  describe "#title" do
    it "returns the correct title" do
      @movie.title.should eql "Title"
  end
end


   end
