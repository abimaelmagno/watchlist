class ListsController < ApplicationController
  before_action :find, only: [:show]
  def index
    @lists = List.all
  end
  def show
    
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params) 
    if @list.save
      redirect_to list_path(@list)
    else
      render :new #raise
    end
  end  
  
  private

  def list_params
    params.require(:list).permit(:name, photos: [])
  end

  # before show, edit, update and destroy run this code!
  def find
    @list = List.find(params[:id])
  end

end
