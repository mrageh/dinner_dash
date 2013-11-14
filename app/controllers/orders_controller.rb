class OrdersController < ApplicationController

  def index
    if !current_user
      flash.notice = 'You need to sign in to view past orders'
      redirect_to new_session_path
    elsif !current_user.admin?
      @orders = current_user.orders.where(status: 'completed')
    else
      @orders = Order.all
    end
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
end
