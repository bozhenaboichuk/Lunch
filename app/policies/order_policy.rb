# frozen_string_literal: true

class OrderPolicy < ApplicationPolicy
  def create?
    (user == record.user || user.admin_role?) && !record.completed
  end

  def cancel?
    (user == record.user || user.admin_role?) && !record.completed
  end

  def update?
    time_diff = (Time.zone.now - record.updated_at) / (24 * 60 * 60)
    user.admin_role? && ((record.completed && time_diff < 1) || !record.completed)
  end

  def change?
    time_diff = (Time.zone.now - record.updated_at) / (24 * 60 * 60)
    user.admin_role? && ((record.completed && time_diff < 1) || !record.completed)
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
