module ApplicationHelper

  def current_cart
    if !!current_user
      current_user.carts.find_by(status: "current")
    end
  end

  def add_to_cart_if_logged_in(item)
    if !!current_user
      button_to "Add to Cart", line_items_path(item_id: item.id), method: :post
    end
  end
end
