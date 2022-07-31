class Admin::CustomersController < ApplicationController
  def new
  end

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
     @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
     @customer.update(customer_params)
     redirect_to admin_customers_path
  end
end

  private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :adress, :telephone_number,  :is_active, :created_at, :update_at)
    end


