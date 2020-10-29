class PlantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    true
  end

  def update?
  # record.user == user
    true
  end

  def edit?
    update?
  end

  def destroy?
  # record.user == user
    true
  end
end
