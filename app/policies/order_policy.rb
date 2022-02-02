class OrderPolicy < ApplicationPolicy
  def create?
    user == record.user || user.admin_role?
  end

  def update?
    time_diff = (Time.now - record.updated_at) / (24 * 60 * 60)
    user.admin_role? && ((record.completed && time_diff < 1) || !record.completed )
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
