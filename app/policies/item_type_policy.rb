class ItemTypePolicy < ApplicationPolicy
  #user can only add, update, create, edit if admin
  def index?
    user.admin?
  end

  def new?
    user.admin?
  end

  def update?
    user.admin?
  end

  def edit? #returns true if user is an admin
    user.admin?
  end

  def create?
    user.admin?
  end

  def show?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
