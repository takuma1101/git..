class Public::OrdersController < ApplicationController
 before_action :authenticate_customer!
  before_action :cart_check, only: [:new, :confirm, :create]


  def cart_check
    unless CartItem.find_by(customer_id: current_customer.id)
      flash[:danger] = "カートに商品がない状態です"
      redirect_to root_url
    end
  end
  def new
     @order = Order.new
     @order.postal_code = current_customer.postal_code
     @order.address = current_customer.address
     @order.name = current_customer.first_name + current_customer.last_name
  end
  def confirm
    @total = 0
     @order = Order.new
    @cart_items = CartItem.where(customer_id: current_customer.id)
    customer = current_customer
    address_option = params[:order][:address_option].to_i

    @order.payment_method = params[:order][:payment_method].to_i
    @order.temporary_information_input(customer.id)

    if address_option == 0
      @order.order_in_postal_code_address_name(customer.postal_code, customer.address, customer.last_name)
    elsif address_option == 1
      shipping = ShippingAddress.find(params[:order][:registration_shipping_address])
      @order.order_in_postal_code_address_name(postal_code, address, name)
    elsif address_option == 2
      @order.order_in_postal_code_address_name(params[:order][:postal_code], params[:order][:address], params[:order][:name])
    else
    end
    unless @order.valid?
      flash[:danger] = "お届け先の内容に不備があります<br>・#{@order.errors.full_messages.join('<br>・')}"
      p @order.errors.full_messages
      redirect_back(fallback_location: root_path)
    end
    # render plain: @order.inspect
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_fee = 800
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, cart_item| sum +  cart_item.subtotal }
    @order.bill = @total + @order.shipping_fee.to_i
    if @order.save
      @cart_items = CartItem.where(customer_id: current_customer.id)
      @cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart_item.amount
        order_detail.price_including_tax =cart_item.item.price
        order_detail.production_status = 0
        if order_detail.save
          @cart_items.destroy_all
        end
      end
      redirect_to public_orders_thanks_path
    else
    end
  end

  def thanks
  end


  def index
     @orders = Order.where(customer_id: current_customer.id).order(created_at: :desc)

  end

  def show
     @order = Order.find(params[:id])
  end





private
def order_params
  params.require(:order).permit(:payment_method, :postal_code, :address, :name)
end
end

