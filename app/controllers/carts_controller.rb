class CartsController < ApplicationController

  def checkout
    @cart = Cart.find(params[:id])
    @cart.line_items.each do |l_item|
      l_item.item.inventory -= l_item.quantity
      l_item.item.save
    end
    @cart.status = "submitted"
    @cart.save
    current_user.current_cart = nil
    current_user.save
    redirect_to cart_path(@cart)
  end

  def show

  end

end
