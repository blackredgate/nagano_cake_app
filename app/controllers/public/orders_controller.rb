class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def comfim
    @order = Order.new(order_params)
    @order.postage = 800
    @cart_items = current_customer.cart_items.all
    @total = 0
    @shipping_postal_code = current_customer.postal_code
    @shipping_address = current_customer.address
    @shipping_name = current_customer.name
  end

  def complete

  end

  def create

  end

  def index

  end

  def show

  end
  
  private
  def order_params
    params.require(:order).permit(:payment_metods)
  end
end
