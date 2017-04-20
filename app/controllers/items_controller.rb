#This controller manages different items on a to do list
#json_response is a helper method that responds with JSON and HTTP status code; it is defiened in controllers/concerns/response.rb

class ItemsController < ApplicationController
  before_action :set_todo
  before_action :set_todo_item, only: [:show, :update, :destroy]

  #GET /todos/:todo_id/items (view all items on a particular to do list)
  def index
    json_response(@todo.items)
  end

  #GET /todos/:todo_id/items/:id (view a specific items on a specific to do list)
  def show
    json_response(@items)
  end

  #POST /todos/:todo_id/items (create a new item on a particular to do list)
  def create
    @todo.items.create!(item_params)
    json_response(@todo, :created)
  end

  #PUT /todos/:todo_id/items/:id (edit a specific item on a specific to do list)
  def update
    @item.update(item_params)
    head :no_content
  end

  #DELETE /todos/:todo_id/items/:id
  def destroy
    @item.destroy
    head :no_content
  end

  private

  def item_params
    params.permit(:name, :done)
  end

  def set_todo
    @todo = Todo.find(params[:todo_id])
  end

  def set_todo_item
    @item = @todo.items.find_by!(id: params[:id]) if @todo
  end

end#of ItemsController class
