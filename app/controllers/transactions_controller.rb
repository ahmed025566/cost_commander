class TransactionsController < ApplicationController
  before_action :authenticate_user!
  def new
    @transaction = Entity.new
    session[:group_id] = params[:group_id]
  end

  def create
    @transaction = Entity.new(transaction_params)
    @transaction.author = current_user
    if @transaction.save!
      redirect_to group_path(session[:group_id])
    else
      render :new, notice: 'Please try again'
    end
  end

  private

  def transaction_params
    params.require(:entity).permit(:name, :amount, :groups)
  end
end
