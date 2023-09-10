class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.all
    @customer = @order.customer
  end
  
  def update
    
  end
end
