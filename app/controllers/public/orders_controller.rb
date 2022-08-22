class Public::OrdersController < ApplicationController
  def new
     @order = Order.new
     @order.postal_code = current_customer.postal_code
     @order.address = current_customer.address
     @order.name = current_customer.first_name + current_customer.last_name
  end

  def index
  end

  def show
  end

  def thank
  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
  end

private
def order_params
  params.require(:order).permit(:payment_method, :postal_code, :address, :name)
end
end
