class OrdersController < ApplicationController

  def index
    @orders = Order.all
    @items = @orders.first.items.first.name
  end

end
