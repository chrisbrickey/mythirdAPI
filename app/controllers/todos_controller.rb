#This controller manages different To Do lists (eg. todos)
#json_response is a helper method that responds with JSON and HTTP status code; it is defiened in controllers/concerns/response.rb

class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  #GET /todos  (aka view all todos)
  def index
    @todos = Todo.all
    json_response(@todos)
  end

  #POST /todos (aka create a todo)
  def create
    @todo = Todo.create!(todo_params)
    json_response(@todo, :created)
  end

  #GET /todos/:id (aka view one todo)
  def show
    json_response(@todo)
  end

  #PUT /todos/:id (aka edit one todo)
  def update
    @todo.update(todo_params)
    head :no_content
  end

  #DELETE /todos/:id (aka delete one todo)
  def destroy
    @todo.destroy
    head :no_content
  end

  private

  def todo_params
    #whitelist params
    params.permit(:title, :created_by)
  end

  #set_todo is a callback method to find a todo by id
  def set_todo
    @todo = Todo.find(params[:id])
  end

end #of class TodosController
