# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def destroy
    session.delete(:order_id)
    sign_out(current_user)
    redirect_to root_path, status: :see_other
  end

  def index
    @users = User.all
  end
end
