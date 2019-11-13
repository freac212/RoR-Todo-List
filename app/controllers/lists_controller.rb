class ListsController < ApplicationController
    # GET lists/index - Set the main index page to the todo lists page
  def index
    @lists = List.all
  end

  # GET lists/new
  def new 
    @list = List.new
  end

  # POST lists/create
  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to lists_index_path
    else 
      render 'new'
    end
  end

  private
  def list_params
    params.require(:list).permit(:title)
  end
end
