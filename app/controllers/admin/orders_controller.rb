class OrdersController < ApplicationController
  def index
    @order = Order.all
  end

  def show
  end
end
