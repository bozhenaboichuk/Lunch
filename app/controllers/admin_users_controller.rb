# frozen_string_literal: true

class AdminUsersController < ApplicationController
  before_action :set_user!
  before_action :authorize_admin

  def destroy
    if @user == current_user
      redirect_to admin_user_path(@user), status: :see_other,
                                          notice: 'Ви не можете видалити свій профіль(Це може зробити інший адміністратор).'
    else
      @user.destroy
      redirect_to admin_user_path(@user), status: :see_other, notice: 'Користувача видалено.'
    end
  end

  def update
    if @user.role == 'basic'
      @user.update role: 'admin'
      redirect_to admin_user_path(@user), status: :see_other, notice: 'Роль змінено успішно.'
    elsif @user.role == 'admin' && @user == current_user
      @user.update role: 'admin'
      redirect_to admin_user_path(@user), status: :see_other,
                                          notice: 'Ви не можете змінити свою роль (Це може зробити інший адміністратор).'
    else
      @user.update role: 'basic'
      redirect_to admin_user_path(@user), status: :see_other, notice: 'Роль змінено успішно.'
    end
  end

  private

  def authorize_admin
    authorize current_user || User, policy_class: AdminUserPolicy
  end

  def set_user!
    @user = User.find params[:id]
  end
end
