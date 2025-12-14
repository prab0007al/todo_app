class CategoriesController < ApplicationController
  def index
    @categories = Category.all 
    @todo = Todo.new
  end

  def show
    @category = Category.find(params[:id])

    @todo = Todo.new
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to root_path, notice: "List created!"
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to root_path, notice: "List updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to root_path, notice: "List deleted."
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
