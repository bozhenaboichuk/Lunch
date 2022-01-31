class UsersController < ApplicationController
  def show
      @user= User.find(params[:id])
  end

  def destroy
    sign_out(current_user)
  end
end
