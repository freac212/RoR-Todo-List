class TodosController < ApplicationController
  # GET lists/list_id/todos/new
  def new 
    @todo = Todo.new
    @list = List.find(params[:list_id])
  end
end
