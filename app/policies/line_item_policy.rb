# frozen_string_literal: true

class LineItemPolicy < ApplicationPolicy
  def create?
    !user.guest?
  end

  def update?; end

  def change?; end

  def destroy?
    (user == record.order.user || user.admin_role?) && !record.order.completed
  end

  def index?
    true
  end

  def show?
    true
  end
end
