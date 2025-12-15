class TodosController < ApplicationController
  before_action :get_category
  before_action :set_todo, only: [:update, :destroy]
  
  def create
    # DEBUG: Print what we're receiving
    Rails.logger.debug "===== TODO PARAMS DEBUG ====="
    Rails.logger.debug "Raw params: #{params.inspect}"
    Rails.logger.debug "Todo params: #{todo_params.inspect}"
    Rails.logger.debug "=========================="
    
    @todo = @category.todos.build(todo_params)

    if @todo.save
      redirect_to category_path(@category), notice: "Task '#{@todo.title}' created successfully!"
    else
      @category = Category.find(params[:category_id]) if params[:category_id]
      flash.now[:alert] = "Error: #{@todo.errors.full_messages.join(', ')}"
      render 'categories/show'
    end
  end

  def update
    if @todo.update(todo_params)
      redirect_to category_path(@category), notice: "Task updated!"
    else
      redirect_to category_path(@category), alert: "Error updating task."
    end
  end

  def destroy
    task_title = @todo.title
    @todo.destroy
    redirect_to category_path(@category), notice: "Task '#{task_title}' deleted."
  end

  private
  
  def todo_params
    permitted = params.require(:todo).permit(:title, :description, :priority, :deadline, :is_completed)
    Rails.logger.debug "Permitted params: #{permitted.inspect}"
    permitted
  end
  
  def get_category
    if params[:category_id]
      @category = Category.find(params[:category_id])
    else
      @category = Category.find_or_create_by(title: 'Miscellaneous')
    end
  end
  
  def set_todo
    @todo = @category.todos.find(params[:id])
  end
end
