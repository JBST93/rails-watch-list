class BookmarksController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @movie = Movie.new(movie_params)
    @bookmark = Bookmark.new
    @bookmark.list = @list
    @bookmark.movie = @movie
    @movie.save!
    @bookmark.save!
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
