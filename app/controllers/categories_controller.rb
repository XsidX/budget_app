class CategoriesController < ApplicationController

  before_action :set_categories, only: [:index, :show]

  def index
  end

  def show
    @category = Category.find(params[:id])
    @transaction_categories = @category.transaction_categories
    @transaction_entities = @category.transaction_entities.order('created_at DESC')
    @total_transaction_amount = @category.transaction_entities.sum(:amount)
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

  def set_categories
    @categories = current_user.categories
  end
end
