class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :destroy]

  def index
    @bookmarks = Bookmark.all
  end

  def show
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
