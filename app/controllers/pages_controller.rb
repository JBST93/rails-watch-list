class PagesController < ApplicationController

  def index
    @lists = List.all
    @movies = Movie.all

  end

end
