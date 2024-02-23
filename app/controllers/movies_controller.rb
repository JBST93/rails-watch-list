class MoviesController < ApplicationController

  def index

  end

  def show
  end

  def create
    binding.break
    @movie = Movie.new(movie_params)
    @movie.save
    puts "Movie added to DB"
    redirect_to root_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :year, :poster_url)
  end
end
