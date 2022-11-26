class UserPolicy < ApplicationPolicy
  def index?
    user&.admin?
  end

  def edit?
    update?
  end

  def update?
    index?
  end
end
