class BookmarksController < ApplicationController
  before_action :set_bookmark, only: :destroy
  before_action :find_list, only: [:new, :create]
  
  def new
    @bookmark = Bookmark.new
  end

  def create
    # this instance of review is created with validation errors
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    # if not empty due to validations it will save. then:
    # raise
    if @bookmark.save
      redirect_to list_path(@list)
    else
      
      render :new
    end
  end

  def destroy
    # @task = Task.find(params[:id])
    @bookmark.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to lists_path
  end
  private
  
  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def find_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end


end
