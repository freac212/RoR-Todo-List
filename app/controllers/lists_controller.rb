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

  # DELETE lists/id
  def destroy
    @list = List.find(params[:id])
    # @list.todos.destroy_all # Recursive deletion, basically - unless you set "dependant: :destroy" in the lists model for has_many :todos
    @list.destroy
    
    flash[:notice] = "List Deleted..."
    redirect_to lists_index_path
  end

  private
  def list_params
    params.require(:list).permit(:title)
  end
end
