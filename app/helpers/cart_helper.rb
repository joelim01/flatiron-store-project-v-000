module CartHelper

  def checkout_button
    if current_cart && current_cart.status != "submitted"
      button_to 'Checkout', checkout_path(current_cart), method: :post
    end
  end

end
