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
      redirect_to categories_path, notice: 'Signed in successfully.'
    else
      flash.now.alert = 'Invalid email or password'
      render :new
    end
  end

  def new

  end
end
