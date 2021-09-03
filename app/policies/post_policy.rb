# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    true
  end

  def create?
    new?
  end

  def edit?
    true
  end

  def update?
    edit?
  end

  def destroy?
    true
  end

  def show?
    true
  end
end
