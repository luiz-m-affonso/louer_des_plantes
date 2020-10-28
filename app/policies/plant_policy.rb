class PlantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def index?
  #   true
  # end

  # def show?

  # end

  # def create?

  # end

  def new?
    true
  end

  # def update?

  # end

  # def edit?
  #   update?
  # end

  # def destroy?

  # end
end
