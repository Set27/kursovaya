class FinePolicy < ApplicationPolicy
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
  end
  