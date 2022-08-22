class Public::CustomersController < ApplicationController
    before_action :authenticate_customer!
  def show
    @customer = current_customer
  end

  def edit
     @customer = current_customer
  end

  def unsubscribe
    @customer = Customer.find_by(email: params[:email])
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_valid: false)
    reset_session
    redirect_to root_path
  end

  def update
    @customer = current_customer
  	@customer.update(customer_params)
  	redirect_to public_customer_path
  end

  private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :adress, :telephone_number,  :is_active, :created_at, :update_at)
    end
end

