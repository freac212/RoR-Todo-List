class TodosController < ApplicationController
  # GET lists/list_id/todos/new
  def new 
    @todo = Todo.new
    @list = List.find(params[:list_id])
  end

  # POST lists/list_id/todos
  def create
    @list = List.find(params[:list_id])
    @todo = @list.todos.create(todo_params)

    if @todo.save
      flash[:notice] = "New Todo Created!"
      redirect_to lists_index_path
    else 
      render 'new'
    end
  end

  # DELETE todos/id
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    
    flash[:notice] = "Todo Deleted..."
    redirect_to lists_index_path
  end

  private
  def todo_params
    # ++Q where does params come from?
    params.require(:todo).permit(:title, :description, :completed)
  end
end
