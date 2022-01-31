class OrderPolicy < ApplicationPolicy
  def create?
    !user.guest?
  end

  def update?
    user.admin_role?
  end

  def destroy?
    user == record.user || user.admin_role?
  end
  
  def index?
    true
  end

  def show?
    true
  end
end
