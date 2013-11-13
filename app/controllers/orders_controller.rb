class OrdersController < ApplicationController

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_order
  end

  def update

  end

  def checkout
    # fail
    @order = Order.find(current_order)
    @order.update(status: "completed")
    flash.notice = "Order Completed"
    session[:order_id] = nil
    redirect_to categories_path
  end

  # def add_to_cart
    
  #   redirect_to categories_path
  # end
end
