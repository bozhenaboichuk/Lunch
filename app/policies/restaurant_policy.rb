# frozen_string_literal: true

class RestaurantPolicy < ApplicationPolicy
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
    true
  end

  def show?
    true
  end
end
