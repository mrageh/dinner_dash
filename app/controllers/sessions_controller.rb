class SessionsController < ApplicationController
  def destroy
    session[:order_id] = nil
    redirect_to categories_path
  end

  def create

  end

  def new

  end
end
