class SessionsController < ApplicationController
  def destroy
    session[:order_id] = nil
    session[:user_id]  = nil
    redirect_to categories_path, notice: 'Signed out successfully'
  end

  def create
    user = User.where(email: params[:email]).first
    if user && user.authenticate(params[:password])
      puts 'checking it works'
      session[:user_id] = user.id
      user.orders << find_or_create_order
      redirect_after_login
    else
      flash.now.alert = 'Invalid email or password'
      render :new
    end
  end

  def new
    @order = find_or_create_order
  end

  private

  def redirect_after_login
    if current_order.order_items.any?
      redirect_to order_path(current_order), notice: 'Signed in successfully.'
    else
      redirect_to categories_path
    end
  end
end
