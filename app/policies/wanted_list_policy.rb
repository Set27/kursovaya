class WantedListPolicy < ApplicationPolicy
  def index?
    true
  end

  def edit?
    update?
  end

  def update?
    manage?
  end

  def new?
    create?
  end

  def create?
    manage?
  end

  def destroy?
    user&.admin?
  end

  def manage?
    user&.admin? || user&.manager?
  end
end
