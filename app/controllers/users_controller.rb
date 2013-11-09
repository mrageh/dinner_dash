class UsersController < ApplicationController

  include UsersHelper

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
      # flash.alert = @user.errors.full_messages
      render new_user_path
    end
  end
end
