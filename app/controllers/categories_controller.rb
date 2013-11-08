class CategoriesController < ApplicationController

  def index
    @order = find_or_create_order
    @categories = Category.all
  end
end
