class Cart < ActiveRecord::Base
  belongs_to :order
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items


  def total
    total_array = self.line_items.collect do |l_item|
      l_item.item.price * l_item.quantity
    end
    total = total_array.inject 0, :+
    # number_to_currency(total, precision: 2)
  end

  def add_item(item_id)
    added_item = self.line_items.find_by(item_id: item_id)
    if !!added_item
      added_item.quantity += 1
      return added_item
    else
      self.line_items.build(item_id: item_id)
    end
  end


end
