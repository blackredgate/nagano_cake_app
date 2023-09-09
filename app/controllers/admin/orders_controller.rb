class Admin::OrdersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    # @order = 
  end
end
