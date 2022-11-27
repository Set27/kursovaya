class CarInfoPolicy < ApplicationPolicy
  def index?
    user&.admin? || user&.manager?
  end

  def edit?
    update?
  end

  def update?
    index?
  end

  def new?
    create?
  end

  def create?
    index?
  end

  def destroy?
    user&.admin?
  end

  def registation_infos?
    create?
  end
end
