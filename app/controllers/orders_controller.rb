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
    if session[:user_id]
      @order = Order.find(current_order)
      @order.update(status: "completed")
      flash.notice = "Order Completed"
      session[:order_id] = nil
      redirect_to categories_path
    else
      flash.notice = "You need to sign in first!"
      redirect_to new_session_path
    end
  end

  # def add_to_cart
    
  #   redirect_to categories_path
  # end
end
