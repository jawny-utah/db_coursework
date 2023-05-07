class OrdersController < ApplicationController
  def destroy
    Order.find(params[:id]).destroy

    flash[:notice] = 'Order was destroyed'

    redirect_to orders_homepages_path
  end

  def new; end

  def create
    Order.create(order_params)

    flash[:notice] = 'Order was created'

    redirect_to orders_homepages_path
  end

  def update
    order = Order.find(params[:id])

    order.update(order_params)

    flash[:notice] = 'Order was updated'

    redirect_to orders_homepages_path
  end

  def edit
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(Order.column_names.map(&:to_sym))
  end
end
