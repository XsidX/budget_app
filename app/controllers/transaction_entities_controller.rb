class TransactionEntitiesController < ApplicationController

  def new
    @transaction_entity = TransactionEntity.new
  end

  def create
    @transaction_entity = TransactionEntity.new(name: transaction_entity_params[:name], amount: transaction_entity_params[:amount])
    @transaction_entity.user = current_user
    if @transaction_entity.save
      transaction_entity_params[:category_ids].each do |category_id|
        @transaction_entity.transaction_categories.create(category_id: category_id)
      end
      flash[:success] = "Transaction entity created!"
    else
      flash[:danger] = "Transaction entity not created!"
    end
    redirect_to request.referrer
  end

  private

  def transaction_entity_params
    params.require(:transaction_entity).permit(:name, :amount, category_ids: [])
  end

end