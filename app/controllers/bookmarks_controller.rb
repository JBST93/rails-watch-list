class BookmarksController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    @bookmark.list = @list

    if Movie.find_by(title: movie_params[:title])
      @movie = Movie.find_by(title: movie_params[:title])
    else
      @movie = Movie.new(movie_params)
      @bookmark.movie = @movie
    end

    @bookmark.movie = @movie
    @movie.save
    @bookmark.save
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :list_id)
  end

  def movie_params
    params.require(:movie).permit(:title, :year, :poster_url)
  end
end
