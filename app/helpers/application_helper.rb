module ApplicationHelper

  def add_to_cart_if_logged_in(item)
    if !!current_user
      button_to "Add to Cart", line_items_path(item_id: item.id), method: :post
    end
  end
  
end
