class AdminUsersController < ApplicationController

  def destroy
    @user= User.find(params[:id])
    @user.destroy
    redirect_to root_path, status: :see_other, notice: 'User deleted.'
  end

  def update
    @user = User.find(params[:id])
    if @user.role == "basic"
      @user.update role: "admin"
    elsif @user.role == "admin" && @user == current_user
      @user.update role: "admin"
    else
      @user.update role: "basic"
    end

    redirect_to admin_user_path(@user), status: :see_other
  end


end
