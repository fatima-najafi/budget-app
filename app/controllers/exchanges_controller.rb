class ExchangesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @transactions = @category.exchanges.where(author: current_user).order(created_at: :desc)
  end

  def new
    @category = Category.find(params[:category_id])
    @transaction = Exchange.new
  end

  def create
    @transaction = current_user.exchanges.new(exchange_params)
    if @transaction.save
      redirect_to category_exchanges_path(exchange_params[:category_id]),
                  notice: 'Transaction was successfully created.'
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @transaction = Exchange.find(params[:id])
  end

  def update
    @transaction = Exchange.find(params[:id])
    if @transaction.update(exchange_params)
      redirect_to category_exchanges_path(exchange_params[:category_id]),
                  notice: 'Transaction was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @transaction = Exchange.find(params[:id])
    @transaction.destroy
    redirect_to category_exchanges_path(params[:category_id]),
                notice: 'Transaction was successfully destroyed.'
  end

  def exchange_params
    params.require(:exchange).permit(:name, :amount, :category_id)
  end
end
