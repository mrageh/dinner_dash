class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception

  helper_method :current_user, :current_order

  def find_or_create_order
    if session[:order_id]
      Order.find(session[:order_id])
    elsif current_user
      order = Order.create(status: "started", user_id: current_user.id)
      session[:order_id] = order.id
      order
    else
      order = Order.create(status: "started")
      session[:order_id] = order.id
      order
    end
  end

  protected

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_order
    @current_order ||= Order.find(session[:order_id]) if session[:order_id]
  end

  def authenticate
    unless current_user
      redirect_to new_session_url,
        alert: 'You need to sign in or sign up before continuing.'
    end
  end

  def is_admin?
    unless current_user && current_user.admin?
      flash.notice = 'Page does not exist!'
      redirect_to root_path
    end
  end
end
