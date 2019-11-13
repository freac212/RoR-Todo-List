class ListsController < ApplicationController
    # GET lists/index - Set the main index page to the todo lists page
  def index
    @lists = List.all
  end
end
