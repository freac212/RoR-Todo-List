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

  # PUT todos/id/complete
  def complete
    @todo = Todo.find(params[:id])

    completed = @todo.completed ? false : true
   
    if @todo.update(completed: completed)
      redirect_to lists_index_path
    else
      flash[:notice] = "Issue Completing Todo... Call an admin or something 🤷‍♂️"
      redirect_to lists_index_path
    end
  end

  private
  def todo_params
    # ++Q where does params come from?
    params.require(:todo).permit(:title, :description, :completed)
  end
end
