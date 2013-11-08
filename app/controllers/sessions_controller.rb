class SessionsController < ApplicationController
  def destroy
    session[:order_id] = nil
    session[:user_id]  = nil
    redirect_to categories_path, notice: 'Signed out successfully'
  end

  def create
    user = User.where(email: params[:session][:email]).first
    puts params[:session]
    if user && user.authenticate(params[:session][:password])
      puts 'checking it works'
      session[:user_id] = user.id
      redirect_to orders_path, notice: 'Signed in successfully.'
    else
      puts 'did you work!!!'
      flash.now.alert = 'Invalid email or password'
      render :new
    end
  end

  def new

  end
end
