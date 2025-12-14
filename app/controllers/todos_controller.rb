class TodosController < ApplicationController

    before_action :get_category

    def create
        @todo = @category.todos.build(todo_params)

        if @todo.save
            redirect_to category_path(@category), notice: "Task created Successfully!"
        else
            redirect_to root_path, alert: "Error: Task could not be saved!"
        end
    end

    def destroy
        @todo = @category.todos.find(params[:id])
        @todo.destroy
        redirect_to category_path(@category), notice: "Task deleted."
    end

    private
    def todo_params
        params.require(:todo).permit(:title, :description, :priority, :deadline, :is_completed)
    end

    def get_category
        if params[:category_id]
            @category = Category.find(params[:category_id])
        else
            @category = Category.find_or_create_by(title: 'Miscellaneous')
        end
    end
end