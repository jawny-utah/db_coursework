class TransactionsController < ApplicationController
  def destroy
    Transaction.find(params[:id]).destroy

    flash[:notice] = 'Transaction was destroyed'

    redirect_to transactions_homepages_path
  end

  def new; end

  def create
    Transaction.create(transaction_params)

    flash[:notice] = 'Transaction was created'

    redirect_to transactions_homepages_path
  end

  def update
    transaction = Transaction.find(params[:id])

    transaction.update(transaction_params)

    flash[:notice] = 'Transaction was updated'

    redirect_to transactions_homepages_path
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  private

  def transaction_params
    params.require(:transaction).permit(Transaction.column_names.map(&:to_sym))
  end
end
