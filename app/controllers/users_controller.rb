class UsersController < ApplicationController
  def show
      @user= User.find(params[:id])
  end

  def destroy
    session.delete(:order_id)
    sign_out(current_user)
    redirect_to root_path, status: :see_other
  end

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path,status: :see_other, notice: 'User deleted.'
  end

end
