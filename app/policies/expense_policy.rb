class ExpensePolicy < ApplicationPolicy
  def new?
    organizer?
  end

  def create?
    organizer?
  end

  def destroy?
    organizer?
  end

  def verify?
    finance_approver? && verified?
  end

  def reject?
    finance_approver? && verified?
  end
end

