class TodoItemsController < ApplicationController
  before_action :set_todo_list

  # GET /todo_items/1
  # GET /todo_items/1.json
  def show
    @todo_item = @todo_list.todo_items.find(params[:id])
  end

  # GET /todo_items/new
  def new
    @todo_item = @todo_list.todo_items.new
  end

  # GET /todo_items/1/edit
  def edit
    @todo_item = show
  end

  # POST /todo_items
  # POST /todo_items.json
  def create
    @todo_item = @todo_list.todo_items.new(todo_item_params)

    if @todo_item.save
      redirect_to @todo_list, notice: 'Todo item was successfully created.'
    else
      redirect_to @todo_list, alert: 'Todo item failed to be created.'
    end
  end

  # PATCH/PUT /todo_items/1
  # PATCH/PUT /todo_items/1.json
  def update
    @todo_item = show
    if @todo_item.update(todo_item_params)
      redirect_to @todo_list, notice: 'Todo item was successfully updated.'
    else
      redirect_to @todo_list, alert: 'Todo item failed to be updated.'
    end
  end

  # DELETE /todo_items/1
  # DELETE /todo_items/1.json
  def destroy
    @todo_item = show
    @todo_item.destroy
    redirect_to @todo_list, notice: 'Todo item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_item
      @todo_list.todo_items.find(:id)
    end

    def set_todo_list
      @todo_list = TodoList.find(params[:todo_list_id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_item_params
      params.require(:todo_item).permit(:title, :due_date, :description, :completed, :todo_list_id)
    end
end
