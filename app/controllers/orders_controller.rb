class OrdersController < ApplicationController

  def index
    @orders = Order.all
    if @orders.first.items.any?
      @items = @orders.first.items.first.name
    end
  end

  def show
    @order = find_or_create_order
  end

  def add_to_cart
    
    redirect_to categories_path
  end
end
