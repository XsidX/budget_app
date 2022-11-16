# class TransactionCategoriesController < ApplicationController
#
#   def create
#     @transaction_category = current_user.transaction_categories.build(transaction_category_params)
#     if @transaction_category.save
#       flash[:success] = "Transaction category created!"
#     else
#       flash[:danger] = "Transaction category not created!"
#     end
#     redirect_to category_path(params[:category_id])
#   end
#
#   private
#
#   def transaction_category_params
#     params.require(:transaction_category).permit(:transaction_entity_id, :category_id)
#   end
# end