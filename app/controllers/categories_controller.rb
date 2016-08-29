class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @items = Item.available_items.select {|item| item.category == @category}
  end

end
