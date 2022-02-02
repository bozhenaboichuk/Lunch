class AdminUserPolicy < ApplicationPolicy
  def create?
    user.admin_role?
  end

  def update?
    user.admin_role?
  end

  def destroy?
    user.admin_role?
  end

  def index?
    user.admin_role?
  end

  def change?
    user.admin_role?
  end

  def show?
    true
  end

end
