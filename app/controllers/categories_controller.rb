class CategoriesController < ApplicationController
  before_action :set_categories, only: %i[index show]

  def index; end

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
      flash[:notice] = 'Category created successfully!'
      redirect_to categories_path
    else
      flash[:error] = @category.errors.full_messages
      redirect_to categories_path, status: :unprocessable_entity
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end

  def set_categories
    @categories = current_user.categories
  end
end
