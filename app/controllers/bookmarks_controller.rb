class BookmarksController < ApplicationController

  def index
  end

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    @movie = Movie.new
  end

  def create
    @list = List.find(params[:list_id])
    puts @list
    @movie = Movie.new(movie_params)
    puts @movie
    @bookmark = Bookmark.new
    puts params[:bookmark_id]
    @bookmark.list = @list
    @bookmark.movie = @movie
    puts @bookmark
    @movie.save!
    puts "Movie added to DB"
    puts @movie[:params]
    puts @list.id
    @bookmark.save!
    puts "Bookmark Created"
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
