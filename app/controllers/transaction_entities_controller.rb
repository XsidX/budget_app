class TransactionEntitiesController < ApplicationController
  def new
    @transaction_entity = TransactionEntity.new
  end

  def create
    @transaction_entity = TransactionEntity.new(name: transaction_entity_params[:name],
                                                amount: transaction_entity_params[:amount])
    @transaction_entity.user = current_user
    if transaction_entity_params[:category_ids].present?
      if @transaction_entity.save
        transaction_entity_params[:category_ids].each do |category_id|
          @transaction_entity.transaction_categories.create(category_id:)
        end
        flash[:notice] = 'Transaction was completed successfully!'
        redirect_to request.referrer
      else
        flash[:notice] = @transaction_entity.errors.full_messages
        redirect_to request.referrer, status: :unprocessable_entity
      end
    else
      error_array = @transaction_entity.errors.full_messages
      error_array << 'Please select at least one category'
      flash[:notice] = error_array
      redirect_to request.referrer, status: :unprocessable_entity
    end
  end

  private

  def transaction_entity_params
    params.require(:transaction_entity).permit(:name, :amount, category_ids: [])
  end
end
