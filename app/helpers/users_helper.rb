module UsersHelper
  def user_params
    params.require(:user).permit(:name, :user_name, :email, :password, :password_confirmation)
  end
end
