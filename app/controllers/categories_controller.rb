class CategoriesController < ApplicationController

  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      flash[:success] = "Category created!"
    else
      flash[:danger] = "Category not created!"
    end
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
