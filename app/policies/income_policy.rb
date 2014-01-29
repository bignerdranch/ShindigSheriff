class IncomePolicy < ApplicationPolicy
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
    finance_approver? 
  end

  def reject?
    finance_approver?  
  end
end