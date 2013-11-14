class UsersController < ApplicationController
  before_action :is_admin?, only: [:index]
  
  include UsersHelper

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save

    if @user.valid?
      flash.alert = 'New Account Successfully created'
      redirect_to new_session_path
    else
      render new_user_path
    end
  end
end
