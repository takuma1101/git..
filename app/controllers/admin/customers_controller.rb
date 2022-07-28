class Admin::CustomersController < ApplicationController
  def new
  end

  def index
    @customers = Customer.all
  end

  def show
  end

  def edit
  end
end
