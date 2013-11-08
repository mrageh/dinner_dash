class OrdersController < ApplicationController

  def index
    @orders = Order.all
    @items = @orders.first.items.first.name
  end

  def add_to_cart
    
    redirect_to categories_path
  end

end
