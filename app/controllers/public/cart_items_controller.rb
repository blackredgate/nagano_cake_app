class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
  end

  def create
    @item = Item.find(cart_item_params[:item_id])
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end

  def update

  end

  def destroy

  end

  def destroy_all

  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
