class AdminUsersController < ApplicationController

  def destroy
    @user= User.find(params[:id])
    unless  @user == current_user
      @user.destroy
      redirect_to admin_user_path(@user), status: :see_other, notice: 'Користувача видалено.'
    else
      redirect_to admin_user_path(@user), status: :see_other, notice: 'Ви не можете видалити свій профіль(Це може зробити інший адміністратор).'
    end

  end

  def update
    @user = User.find(params[:id])
    if @user.role == "basic"
      @user.update role: "admin"
      redirect_to admin_user_path(@user), status: :see_other, notice:  'Роль змінено успішно.'
    elsif @user.role == "admin" && @user == current_user
      @user.update role: "admin"
      redirect_to admin_user_path(@user), status: :see_other,notice: 'Ви не можете змінити свою роль (Це може зробити інший адміністратор).'
    else
      @user.update role: "basic"
      redirect_to admin_user_path(@user), status: :see_other, notice:  'Роль змінено успішно.'
    end


  end


end
