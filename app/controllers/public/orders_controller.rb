class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if @order.payment_method.present?
      @cart_items = current_customer.cart_items.all
      @total = 0
    else
      render :new
    end
  end

  def complete

  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      redirect_to orders_complete_path
    else
      render :confirm
    end
  end

  def index

  end

  def show

  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :postage, :shipping_name, :shipping_postal_code, :shipping_address)
  end
end
