class OrderController < ApplicationController

  def index
    @order = Order.all
  end
end
