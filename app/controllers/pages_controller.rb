class PagesController < ApplicationController

  def index
    @lists = List.all
    @movies = Movie.all
    @movies_rand = Movie.order("RANDOM()").limit(5)


  end

end
