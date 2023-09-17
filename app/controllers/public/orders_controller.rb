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
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    if @order.save!
      @cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart_item.amount
        order_detail.price_including_tax = cart_item.subtotal
        order_detail.save
      end
      redirect_to orders_complete_path
      @cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def index

  end

  def show

  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :payment, :payment_method, :postage, :shipping_name, :shipping_postal_code, :shipping_address)
  end
end
