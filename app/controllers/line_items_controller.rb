class LineItemsController < ApplicationController

  def create

    if !!current_user && !!current_user.current_cart
      current_user.current_cart.line_items << current_user.current_cart.add_item(params[:item_id])
      redirect_to cart_path(current_user.current_cart)
    elsif !!current_user && !current_user.current_cart
      current_user.current_cart = Cart.create(status: "current")
      current_user.save
      binding.pry
      line_item = current_cart.line_items.create(item_id: params[:item_id])
      redirect_to cart_path(current_user.current_cart)
    else
      redirect_to store_path
    end

  end


  def line_item_params
  end

end
